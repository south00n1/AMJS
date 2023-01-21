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
		FaqDAO dao=new FaqDAO();
		List<FaqVO> list=dao.faqListData(Integer.parseInt(type));
		int count=dao.faqRowCount(Integer.parseInt(type));
		request.setAttribute("type", type);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("main_jsp", "../service/faq_list.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("service/faq_detail.do")
	public String faq_detail(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		FaqDAO dao=new FaqDAO();
		FaqVO vo=dao.faqDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../service/faq_detail.jsp");
		return "../main/main.jsp";
	}
}
