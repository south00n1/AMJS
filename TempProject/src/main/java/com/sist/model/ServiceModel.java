package com.sist.model;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class ServiceModel {
	@RequestMapping("service/list.do")
	public String qna_list(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		ServiceDAO dao=new ServiceDAO();
		List<AskVO> list=dao.qnaListData(curpage);
		request.setAttribute("list", list);
		
		int count=dao.qnaRowCount();
		int totalpage=(int)(Math.ceil(count/10.0));
		request.setAttribute("count", count);
		request.setAttribute("totalpage", totalpage);
		
		request.setAttribute("main_jsp", "../service/list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("service/detail.do")
	public String qna_detail(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		ServiceDAO dao=new ServiceDAO();
		AskVO vo=dao.qnaDetailData(Integer.parseInt(no), 1);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../service/detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("service/insert.do")
	public String qna_insert(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../service/insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("service/insert_ok.do")
	public String qna_insert_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch(Exception ex) {}
		String subject=request.getParameter("subject");
		String type=request.getParameter("type");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		ServiceDAO dao=new ServiceDAO();
		AskVO vo=new AskVO();
		vo.setSubject(subject);
		vo.setType(type);
		vo.setContent(content);
		vo.setPwd(pwd);
		dao.qnaInsert(vo);
		return "redirect:list.do";
	}
	
	@RequestMapping("service/reply.do")
	public String qna_reply(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../service/reply.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("service/reply_ok.do")
	public String qna_reply_ok(HttpServletRequest request, HttpServletResponse response) {
		
		return "redirect:list.do";
	}
	
	@RequestMapping("service/update.do")
	public String qna_update(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../service/update.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("service/update_ok.do")
	public String qna_update_ok(HttpServletRequest request, HttpServletResponse response) {

		return "redirect:list.do";
	}
	
	@RequestMapping("service/delete.do")
	public String qna_delete(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../service/delete.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("service/delete_ok.do")
	public String qna_delete_ok(HttpServletRequest request, HttpServletResponse response) {
		
		return "redirect:list.do";
	}
}
