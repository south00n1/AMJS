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
import com.sist.vo.AskVO;
import com.sist.vo.JjimVO;
import com.sist.vo.LikeVO;
import com.sist.vo.ReserveVO;
import com.sist.vo.ReviewBoardLikeVO;
import com.sist.vo.ReviewBoardReplyVO;
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
		String page = request.getParameter("page");
		if (page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		// dao연결
		MypageDAO dao = new MypageDAO();
		List<ReviewBoardVO> list = dao.mypageMyPostData(id, curpage);
		int totalpage = dao.mypageMyPostListTotalPage(id);
		
		final int BLOCK = 5;
		int startPage = ((curpage-1)/BLOCK*BLOCK) + 1;
		int endPage = ((curpage-1)/BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage)
			 endPage = totalpage;
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		return "../mypage/mypage_mypost_list.jsp";
	}
	
	@RequestMapping("mypage/mypage_mypost_delete.do")
	public String mypage_mypost_list_delete(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		MypageDAO dao = new MypageDAO();
		dao.myPostDelete(Integer.parseInt(no));
		return "redirect:../mypage/mypage_mypost_list.do";

	}
	@RequestMapping("mypage/mypage_myreply_list.do")
	public String mypage_myreply_list(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String page = request.getParameter("page");
		if (page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		// dao연결
		MypageDAO dao = new MypageDAO();
		List<ReviewBoardReplyVO> list = dao.mypageMyReplyData(id,curpage);
		
		int totalpage = dao.mypageMyReplyListTotalPage(id);
		
		final int BLOCK = 5;
		int startPage = ((curpage-1)/BLOCK*BLOCK) + 1;
		int endPage = ((curpage-1)/BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage)
			 endPage = totalpage;
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		return "../mypage/mypage_myreply_list.jsp";
	}
	@RequestMapping("mypage/mypage_myreply_delete.do")
	public String mypage_myreply_list_delete(HttpServletRequest request, HttpServletResponse response) {
		
		String rno = request.getParameter("rno");
		MypageDAO dao = new MypageDAO();
		dao.myReplyDelete(Integer.parseInt(rno));
		return "redirect:../mypage/mypage_myreply_list.do";

	}
	
	@RequestMapping("mypage/mypage_myqna_list.do")
	public String mypage_myqna_list(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String page = request.getParameter("page");
		if (page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		// dao연결
		MypageDAO dao = new MypageDAO();
		List<AskVO> list = dao.mypageMyqnaData(id,curpage);
		int totalpage = dao.mypageMyqndListTotalPage(id);
		
		final int BLOCK = 5;
		int startPage = ((curpage-1)/BLOCK*BLOCK) + 1;
		int endPage = ((curpage-1)/BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage)
			 endPage = totalpage;
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		return "../mypage/mypage_qna_list.jsp";
	}  
	@RequestMapping("mypage/mypage_myqna_delete.do")
	public String mypage_myqna_list_delete(HttpServletRequest request, HttpServletResponse response) {
		
		String gano = request.getParameter("gano");
		MypageDAO dao = new MypageDAO();
		dao.myqnaDelete(Integer.parseInt(gano));
		return "redirect:../mypage/mypage_myqna_list.do";

	}
		
	@RequestMapping("mypage/jjim_list.do")
	public String mypage_jjim(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		String page = request.getParameter("page");
		if (page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		
		JjimDAO dao = new JjimDAO();
		List<JjimVO> list = dao.jjimListData(id, curpage);
		int totalpage = dao.jjimListTotalPage(id);
		
		final int BLOCK = 5;
		int startPage = ((curpage-1)/BLOCK*BLOCK) + 1;
		int endPage = ((curpage-1)/BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage)
			 endPage = totalpage;
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
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
		
		String page = request.getParameter("page");
		if (page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		
		MypageDAO dao = new MypageDAO();
		List<ReserveVO> list = dao.mypageReserveData(id, curpage);
		int totalpage = dao.mypageReserveListTotalPage(id);
		
		final int BLOCK = 5;
		int startPage = ((curpage-1)/BLOCK*BLOCK) + 1;
		int endPage = ((curpage-1)/BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage)
			 endPage = totalpage;
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		return "../mypage/mypage_reserve_list.jsp";
	}
	@RequestMapping("mypage/mypage_reserve_delete.do")
	public String mypage_reserve_delete(HttpServletRequest request, HttpServletResponse response) {
		String gerno = request.getParameter("gerno");
		MypageDAO dao = new MypageDAO();
		
		dao.reserveDelete(Integer.parseInt(gerno));
		return "redirect:../mypage/mypage_reserve_list.do";
	}
	@RequestMapping("mypage/mypage_like_list.do")
	public String mypage_like_list(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		String page = request.getParameter("page");
		if (page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		
		MypageDAO dao = new MypageDAO();
		List<LikeVO> list = dao.mypageLikeData(id, curpage);
		int totalpage = dao.mypageLikeListTotalPage(id);
		
		final int BLOCK = 5;
		int startPage = ((curpage-1)/BLOCK*BLOCK) + 1;
		int endPage = ((curpage-1)/BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage)
			 endPage = totalpage;
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		return "../mypage/mypage_like_list.jsp";
	}
	@RequestMapping("mypage/mypage_like_delete.do")
	public String mypage_like_delete(HttpServletRequest request, HttpServletResponse response) {
		String lno = request.getParameter("lno");
		MypageDAO dao = new MypageDAO();
		
		dao.likeDelete(Integer.parseInt(lno));
		return "redirect:../mypage/mypage_like_list.do";
	}
	@RequestMapping("mypage/mypage_gong_list.do")
	public String mypage_gong_list(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		String page = request.getParameter("page");
		if (page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		
		MypageDAO dao = new MypageDAO();
		List<ReviewBoardLikeVO> list = dao.mypageGongData(id, curpage);
		int totalpage = dao.mypageGoodListTotalPage(id);
		
		final int BLOCK = 5;
		int startPage = ((curpage-1)/BLOCK*BLOCK) + 1;
		int endPage = ((curpage-1)/BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage)
			 endPage = totalpage;
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		return "../mypage/mypage_gong_list.jsp";
	}
	
	@RequestMapping("mypage/mypage_gong_delete.do")
	public String mypage_gong_delete(HttpServletRequest request, HttpServletResponse response) {
		String lno = request.getParameter("lno");
		MypageDAO dao = new MypageDAO();
		
		dao.gongDelete(Integer.parseInt(lno));
		return "redirect:../mypage/mypage_gong_list.do";
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