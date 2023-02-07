package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.LikeDAO;
import com.sist.dao.ReviewBoardLikeDAO;
import com.sist.vo.LikeVO;
import com.sist.vo.ReviewBoardLikeVO;

@Controller
public class ReviewBoardLikeModel {
	@RequestMapping("board/like_insert.do")
	public String like_insert(HttpServletRequest request,HttpServletResponse response)
	{
		String no=request.getParameter("no");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		ReviewBoardLikeVO vo=new ReviewBoardLikeVO();
		vo.setGno(Integer.parseInt(no));
		vo.setId(id);
		ReviewBoardLikeDAO dao=new ReviewBoardLikeDAO();
		dao.likeInsert(vo);
		return "redirect:../board/review_detail.do?no="+no;
	}

}
