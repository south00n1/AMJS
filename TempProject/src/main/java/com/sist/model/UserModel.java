package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class UserModel {
	@RequestMapping("user/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../user/login.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("user/join.do")
	public String join(HttpServletRequest request, HttpServletResponse response) {
		
		return "../user/join.jsp";
	}
}
