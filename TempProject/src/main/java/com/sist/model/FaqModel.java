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
		try {
			request.setCharacterEncoding("UTF-8");
	    } catch (Exception e) {}
	    String ss=request.getParameter("ss");
	    request.setAttribute("ss", ss);
		request.setAttribute("main_jsp", "../service/faq_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("service/faq_card.do")
	public String faq_card(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
	    } catch (Exception e) {}
	    String ss=request.getParameter("ss");
	    FaqDAO dao=new FaqDAO();
	    List<FaqVO> list=dao.faqFindData(ss, 1);
	    int count=dao.faqFindRowCount(ss);
	    request.setAttribute("ss", ss);
	    request.setAttribute("list", list);
	    request.setAttribute("count", count);
	    return "../service/faq_card_result.jsp";
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
		String type=request.getParameter("type");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		FaqDAO dao=new FaqDAO();
		FaqVO vo=new FaqVO();
		vo.setGfno(Integer.parseInt(no));
		vo.setType(type);
		vo.setSubject(subject);
		vo.setContent(content);
		dao.faqUpdate(vo);
		return "redirect:faq_list.do";
	}
	
	@RequestMapping("service/faq_find.do")
	public String faq_find(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
	    } catch (Exception e) {}
	    String ss=request.getParameter("ss");
	    if(ss==null) ss=" ";
	    String page=request.getParameter("page");
	    if(page==null) page="1";	
	    int curpage=Integer.parseInt(page);
	    FaqDAO dao=new FaqDAO();
	    List<FaqVO> list=dao.faqFindData(ss, curpage);
	    int count=dao.faqFindRowCount(ss);
	    int totalpage=(int)(Math.ceil(count/10.0));
	    request.setAttribute("list", list);
	    request.setAttribute("count", count);
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    return "../service/faq_find_result.jsp";
	}
	
	@RequestMapping("service/faq_type.do")
	public String faq_type(HttpServletRequest request, HttpServletResponse response) {
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
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
		return "../service/faq_find_result.jsp";
	}
}