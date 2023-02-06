package com.sist.model;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.JjimDAO;
import com.sist.dao.MemberDAO;
import com.sist.dao.MypageDAO;
import com.sist.dao.ReviewBoardDAO;
import com.sist.vo.JjimVO;
import com.sist.vo.ReserveVO;
import com.sist.vo.ReviewBoardVO;

@Controller
public class MyPageModel {
	@RequestMapping("mypage/mypage_main.do")
	public String mypage(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("mypage_jsp", "../mypage/mypage_home.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/mypage_mypost_list.do")
	public String mypage_mypost_list(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		// dao연결
		MypageDAO dao = new MypageDAO();
		List<ReviewBoardVO> list = dao.mypageMyPostData(id);
		
		request.setAttribute("list", list);
		return "../mypage/mypage_mypost_list.jsp";
	}
	
	@RequestMapping("mypage/reserve_delete.do")
	public String mypage_mypost_list_delete(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		MypageDAO dao = new MypageDAO();
		dao.myPostDelete(Integer.parseInt(no));
		return "redirect:../mypage/mypage_mypost_list.do";

	}
	
	@RequestMapping("mypage/jjim_list.do")
	public String mypage_jjim(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		JjimDAO dao = new JjimDAO();
		List<JjimVO> list = dao.jjimListData(id);
		
		request.setAttribute("list", list);
		return "../jjim/picture_jjim_list.jsp";
	}
	
	@RequestMapping("mypage/jjim_delete.do")
	public String mypage_jjim_delete(HttpServletRequest request, HttpServletResponse response) {
		String jno = request.getParameter("no");
		JjimDAO dao = new JjimDAO();
		dao.jjimDelete(Integer.parseInt(jno));
		return "redirect:jjim_list.do";
	}
	
	@RequestMapping("mypage/mypage_reserve_list.do")
	public String mypage_reserve(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		// dao연결
		MypageDAO dao = new MypageDAO();
		List<ReserveVO> list = dao.mypageReserveData(id);
		
		request.setAttribute("list", list);
		return "../mypage/mypage_reserve_list.jsp";
	}
	@RequestMapping("mypage/reserve_delete.do")
	public String mypage_reserve_delete(HttpServletRequest request, HttpServletResponse response) {
		String gerno = request.getParameter("gerno");
		MypageDAO dao = new MypageDAO();
		
		dao.reserveDelete(Integer.parseInt(gerno));
		return "redirect:../mypage/mypage_reserve_list.do";
	}
	
	@RequestMapping("mypage/join_delete.do")
	public String member_delete(HttpServletRequest request, HttpServletResponse response) {
		
		return "../member/join_delete.jsp";
	}
	
	@RequestMapping("mypage/join_delete_ok.do")
		
	public void member_delete_ok(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String pwd = request.getParameter("pwd");
		MemberDAO dao = new MemberDAO();
		boolean bCheck = dao.memberJoinDelete(id, pwd);
		try {
			PrintWriter out = response.getWriter();
			if(bCheck == true) {
				out.println("yes");
				session.invalidate();
			} else {
				out.println("no");
			}
		} catch (Exception e) {}
		
	}
}