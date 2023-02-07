package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.LikeDAO;
import com.sist.vo.LikeVO;
@Controller
public class LikeModel {
	@RequestMapping("like/like_insert.do")
	public String like_insert(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("like");
		String geno=request.getParameter("geno");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		LikeVO vo=new LikeVO();
		vo.setNo(Integer.parseInt(geno));
		vo.setId(id);
		LikeDAO dao=new LikeDAO();
		dao.likeInsert(vo);
		return "redirect:../exhibition/exhibition_detail.do?geno="+geno;
	}

}
