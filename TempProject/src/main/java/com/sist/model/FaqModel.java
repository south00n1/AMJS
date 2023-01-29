package com.sist.model;
import com.sist.vo.*;
import com.sist.dao.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class FaqModel {
	@RequestMapping("service/faq_list.do")
	public String faq_list(HttpServletRequest request, HttpServletResponse response) {
		String type=request.getParameter("type");
		if(type==null) type="0";
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		FaqDAO dao=new FaqDAO();
		List<FaqVO> list=dao.faqListData(Integer.parseInt(type), curpage);
		int count=dao.faqRowCount(Integer.parseInt(type));
		int totalpage=(int)(Math.ceil(count/10.0));
		request.setAttribute("type", type);
		request.setAttribute("curpage", curpage);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("main_jsp", "../service/faq_list.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("service/faq_detail.do")
	public String faq_detail(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String id="master";
		FaqDAO dao=new FaqDAO();
		FaqVO vo=dao.faqDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../service/faq_detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("service/faq_update.do")
	public String faq_update(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		FaqDAO dao=new FaqDAO();
		FaqVO vo=dao.faqDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../service/faq_update.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("service/faq_update_ok.do")
	public String faq_update_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch(Exception ex) {}
		String no=request.getParameter("no");
		String id="master";
		String type=request.getParameter("type");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		FaqDAO dao=new FaqDAO();
		FaqVO vo=new FaqVO();
		vo.setGfno(Integer.parseInt(no));
		vo.setType(type);
		vo.setSubject(subject);
		vo.setContent(content);
		dao.faqUpdate(vo, id);
		return "redirect:list.do";
	}
}
