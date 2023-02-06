package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.NoticeBoardDAO;
import com.sist.vo.NoticeBoardVO;

@Controller
public class AdminModel {
	private String[] prefix={"","서비스소식","서비스오픈","서비스종료","서비스점검","안내"};
	@RequestMapping("adminpage/adminpage_main.do")
	public String admin_main(HttpServletRequest request,HttpServletResponse response)
	{
		  request.setAttribute("admin_jsp", "../adminpage/admin_home.jsp");
		  request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		  return "../main/main.jsp";
	}
	
	@RequestMapping("adminpage/notice_list.do")
	  public String admin_notice_list(HttpServletRequest request,HttpServletResponse response)
	  {
		try
		   {
			   // 한글 변환 
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex){}
		   String ss=request.getParameter("ss");
		   if(ss==null)
			   ss="";
		// 사용자 보내준 데이터 받기 
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);
		   NoticeBoardDAO dao=new NoticeBoardDAO();
		   List<NoticeBoardVO> list=dao.noticeboardFindData(curpage,ss);
		   
		   for(NoticeBoardVO vo:list)
		   {
			   vo.setPrefix("["+prefix[vo.getType()]+"]");
		   }
		   
		   int count=dao.noticeboardRowCount();
		   int totalpage=(int)(Math.ceil(count/20.0));
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   if(endPage>totalpage)
				   endPage=totalpage;
		  request.setAttribute("ss", ss);
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("startPage", startPage);
		  request.setAttribute("endPage", endPage);
	      request.setAttribute("count", count);
		  request.setAttribute("list", list);
		  request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		  request.setAttribute("adminpage_jsp", "../adminpage/notice_list.jsp");
		  request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		  return "../main/main.jsp";
	  }
	
	@RequestMapping("adminpage/notice_insert.do")
	  public String admin_notice_insert(HttpServletRequest request,HttpServletResponse response)
	  {
		   request.setAttribute("adminpage_jsp", "../adminpage/notice_insert.jsp");
		   request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		   return "../main/main.jsp";
	  }
	
	@RequestMapping("adminpage/notice_insert_ok.do")
	  public String admin_notice_insert_ok(HttpServletRequest request,HttpServletResponse response)
	  {
		  // 사용자가 전송한 데이터 받기 
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String type=request.getParameter("type");
		  String name=request.getParameter("name");
		  String subject=request.getParameter("subject");
		  String content=request.getParameter("content");
		  NoticeBoardVO vo=new NoticeBoardVO();
		  vo.setType(Integer.parseInt(type));
		  vo.setName(name);
		  vo.setSubject(subject);
		  vo.setContent(content);
		  
		  //DAO연결 => 오라클 
		  NoticeBoardDAO dao=new NoticeBoardDAO();
		  dao.noticeInsert(vo);
		  return "redirect:notice_list.do";
	  }
	
	@RequestMapping("adminpage/notice_update.do")
	  public String admin_notice_update(HttpServletRequest request,HttpServletResponse response)
	  {
		   String gnbno=request.getParameter("gnbno");
		   NoticeBoardDAO dao=new NoticeBoardDAO();
		   NoticeBoardVO vo=dao.noticeUpdateData(Integer.parseInt(gnbno));
		   request.setAttribute("vo", vo);
		   // include => request를 공유 
		   request.setAttribute("adminpage_jsp", "../adminpage/notice_update.jsp");
		   request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		   return "../main/main.jsp";
	  }
	  @RequestMapping("adminpage/notice_update_ok.do")
	  public String admin_notice_update_ok(HttpServletRequest request,HttpServletResponse response)
	  {
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex){}
		  String type=request.getParameter("type");
		  String name=request.getParameter("name");
		  String subject=request.getParameter("subject");
		  String content=request.getParameter("content");
		  String gnbno=request.getParameter("gnbno");
		  NoticeBoardVO vo=new NoticeBoardVO();
		  vo.setType(Integer.parseInt(type));
		  vo.setName(name);
		  vo.setSubject(subject);
		  vo.setContent(content);
		  vo.setGnbno(Integer.parseInt(gnbno));
		  NoticeBoardDAO dao=new NoticeBoardDAO();
		  // 메소드 호출 
		  dao.noticeUpdate(vo);
		  return "redirect:notice_list.do";
	  }
	  
	  @RequestMapping("adminpage/notice_delete.do")
	  public String admin_notice_delete(HttpServletRequest request,HttpServletResponse response)
	  {
		  String grbno=request.getParameter("grbno");
		  //DAO연동 
		  NoticeBoardDAO dao=new NoticeBoardDAO();
		  dao.noticeDelete(Integer.parseInt(grbno));
		  return "redirect:notice_list.do";
	  }
}
