package com.sist.model;
import java.util.*;
import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.vo.*;
import com.sist.dao.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class ServiceModel {
	@RequestMapping("service/main.do")
	public String service_main(HttpServletRequest request, HttpServletResponse response) {
		//qna
		ServiceDAO sdao=new ServiceDAO();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		List<AskVO> slist=sdao.serviceMainQna(id);
		request.setAttribute("slist", slist);
		request.setAttribute("count", slist.size());
		
		//faq
		FaqDAO fdao=new FaqDAO();
		List<FaqVO> flist=fdao.faqListData(0, 1);
		request.setAttribute("flist", flist);
		
		/////퀵메뉴
		Cookie[] cookies=request.getCookies();
		
		PictureDAO pdao=new PictureDAO();
		List<PictureVO> pList=new ArrayList<PictureVO>();
		if(cookies!=null) {
			if(id==null) {
				for(int i=cookies.length-1;i>=0;i--) {
					if(cookies[i].getName().startsWith("guest_picture")) {
						String pc=cookies[i].getValue();
						PictureVO pvo=pdao.pictureDetailData(Integer.parseInt(pc));
						pList.add(pvo);
					}
				}
			} else {
				for(int i=cookies.length-1;i>=0;i--) {
					if(cookies[i].getName().startsWith(id+"_picture")) {
						String pc=cookies[i].getValue();
						PictureVO pvo=pdao.pictureDetailData(Integer.parseInt(pc));
						pList.add(pvo);
					}
				}
			}
		}
		request.setAttribute("id", id);
		request.setAttribute("pList", pList);
		/////
		
		request.setAttribute("main_jsp", "../service/service.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("service/list.do")
	public String qna_list(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		ServiceDAO dao=new ServiceDAO();
		List<AskVO> list=dao.qnaListData(curpage);
		int count=dao.qnaTotal();
		int totalpage=(int)(Math.ceil(count/10.0));
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		int startpage=1;
		int endpage=5;
		if(endpage>totalpage) endpage=totalpage;
		request.setAttribute("startpage", startpage);
	    request.setAttribute("endpage", endpage);
		request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		request.setAttribute("main_jsp", "../service/list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("service/detail.do")
	public String qna_detail(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		ServiceDAO dao=new ServiceDAO();
		AskVO vo=dao.qnaDetailData(Integer.parseInt(no), 1);
		List<AskVO> list=dao.qnaGroupData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../service/detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("service/insert.do")
	public String qna_insert(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../service/insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("service/insert_ok.do")
	public String qna_insert_ok(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch(Exception ex) {}
		String path="c:\\download";
		int size=1024*1024*100;
		String enctype="UTF-8";
		MultipartRequest mr=new MultipartRequest(request,path,size,enctype,new DefaultFileRenamePolicy());
		String id=mr.getParameter("id");
		String subject=mr.getParameter("subject");
		String type=mr.getParameter("type");
		String content=mr.getParameter("content");
		String pwd=mr.getParameter("pwd");
		String filename=mr.getFilesystemName("upload");
		ServiceDAO dao=new ServiceDAO();
		AskVO vo=new AskVO();
		vo.setId(id);
		vo.setSubject(subject);
		vo.setType(type);
		vo.setContent(content);
		vo.setPwd(pwd);
		if(filename==null) {
			vo.setFilename("");
			vo.setFilesize(0);
		} else {
			File file=new File(path+"\\"+filename);
			vo.setFilename(filename);
			vo.setFilesize((int)file.length());
		}
		dao.qnaInsert(vo);
		return "redirect:list.do";
	}
	
	@RequestMapping("service/download.do")
	public String qna_download(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String fn=request.getParameter("fn");
		String path="c:\\download";
		File file=new File(path+"\\"+fn);
		response.setContentLengthLong(file.length());
		response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(fn,"UTF-8"));
		BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));
		BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
		int i=0;
		byte[] buffer=new byte[1024];
		while((i=bis.read(buffer,0,1024))!=-1) {
			bos.write(buffer,0,i);
		}
		//out 객체?
		bis.close();
		bos.close();
		return "redirect:list.do";
	}
	
	@RequestMapping("service/reply.do")
	public String qna_reply_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch(Exception ex) {}
		String no=request.getParameter("no");
		String id=request.getParameter("id");
		String admin=request.getParameter("admin");
		String pwd=request.getParameter("pwd");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		ServiceDAO dao=new ServiceDAO();
		AskVO vo=new AskVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setSubject(subject);
		vo.setContent(content);
		dao.qnaReplyInsert(Integer.parseInt(no), admin, vo);
		return "redirect:list.do";
	}
	
	@RequestMapping("service/update.do")
	public String qna_update(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		ServiceDAO dao=new ServiceDAO();
		AskVO vo=dao.qnaDetailData(Integer.parseInt(no), 2);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../service/update.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("service/update_ok.do")
	public String qna_update_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch(Exception ex) {}
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		String type=request.getParameter("type");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		ServiceDAO dao=new ServiceDAO();
		AskVO vo=new AskVO();
		vo.setGano(Integer.parseInt(no));
		vo.setPwd(pwd);
		vo.setType(type);
		vo.setSubject(subject);
		vo.setContent(content);
		boolean bCheck=dao.qnaUpdate(vo);
		if(bCheck==true) {
			request.setAttribute("res", "y");
		} else {
			request.setAttribute("res", "n");
		}
		return "../service/ok.jsp";
	}
	
	@RequestMapping("service/delete.do")
	public String qna_delete(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		ServiceDAO dao=new ServiceDAO();
		boolean bCheck=dao.qnaDelete(Integer.parseInt(no), pwd);
		if(bCheck==true) {
			request.setAttribute("res", "y");
		} else {
			request.setAttribute("res", "n");
		}
		return "../service/ok.jsp";
	}
}
