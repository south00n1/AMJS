package com.sist.model;

import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

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
		
		
		request.setAttribute("id", id);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../picture/detail.jsp");
		return "../main/main.jsp";
	}
}

