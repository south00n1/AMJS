package com.sist.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.AllReplyDAO;
import com.sist.dao.JjimDAO;
import com.sist.dao.PictureDAO;
import com.sist.vo.AllReplyVO;
import com.sist.vo.PictureVO;


@Controller
public class PictureModel {
	@RequestMapping("picture/list.do")
	public String picture_list(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		PictureDAO dao = new PictureDAO();
		ArrayList<PictureVO> list = dao.pictureListData(curpage);
		int totalpage = dao.pictureListTotalPage();

		final int BLOCK = 10;
		int startPage = ((curpage-1)/BLOCK*BLOCK) + 1;
		int endPage = ((curpage-1)/BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage)
			 endPage = totalpage;
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../picture/list.jsp"); // main.jsp에서 include되는 파일 지정
		return "../main/main.jsp";
	}
	
	@RequestMapping("picture/gallery.do")
	public String picture_gallery(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		PictureDAO dao = new PictureDAO();
		ArrayList<PictureVO> list = dao.pictureListData(curpage);
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		
		
		return "../picture/gallery.jsp";
	}
	
	@RequestMapping("picture/before_detail.do")
	public String food_before_detail(HttpServletRequest request,HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String user = "";
		
		if(id == null) {
			user="guest";
		} else {
			user=id;
		}
		
		String gpno = request.getParameter("gpno");
		try {
			Cookie cookie = new Cookie(user+"_picture"+gpno, gpno);
			cookie.setPath("/");
			cookie.setMaxAge(60*60*24); // 하루동안 저장
			response.addCookie(cookie);
		} catch (Exception e) {} 
		
		return "redirect:../picture/detail.do?gpno="+gpno;
	}
	
	@RequestMapping("picture/detail.do")
	public String picture_detail(HttpServletRequest request, HttpServletResponse response) {
		String gpno = request.getParameter("gpno");
		PictureDAO dao = new PictureDAO();
		PictureVO vo = dao.pictureDetailData(Integer.parseInt(gpno));
		
		AllReplyDAO adao=new AllReplyDAO();
		List<AllReplyVO> rList=adao.allReplyListData(Integer.parseInt(gpno), 1);
		request.setAttribute("rList", rList);
		request.setAttribute("count", rList.size());
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		JjimDAO jdao = new JjimDAO();
		int jcount = jdao.jjimCount(Integer.parseInt(gpno), id);
		request.setAttribute("jjim_count", jcount);
		
		Cookie[] cookies = request.getCookies();
		List<PictureVO> cList = new ArrayList<PictureVO>();
		if (cookies!=null) {
			if(id == null) {
				for(int i = cookies.length-1; i>=0; i--) {
					if(cookies[i].getName().startsWith("guest_picture")) {
						String gpno2 = cookies[i].getValue();
						PictureVO vo2 = dao.pictureDetailData(Integer.parseInt(gpno2));
						cList.add(vo2);
					}
				}
			} else {
				for(int i = cookies.length-1; i>=0; i--) {
					if(cookies[i].getName().startsWith(id+"_picture")) {
						String gpno2 = cookies[i].getValue();
						PictureVO vo2 = dao.pictureDetailData(Integer.parseInt(gpno2));
						cList.add(vo2);
					}
				}
			}
		}
		
		request.setAttribute("cList", cList);
		request.setAttribute("id", id);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../picture/detail.jsp");
		return "../main/main.jsp";
	}
}

