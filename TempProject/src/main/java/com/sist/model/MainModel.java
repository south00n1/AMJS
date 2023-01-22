package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_page(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		// include할 파일명을 전송
		PictureDAO dao = new PictureDAO();
		ArrayList<PictureVO> list = dao.PictureListData(curpage);
		ExhibitionDAO dao2 = new ExhibitionDAO();
		List<ExhibitionVO> list2 = dao2.normalExhibitionData(); // 일반전시회
		List<ExhibitionVO> list3 = dao2.tradeExhibitionData(); // 무역전시회
		List<ExhibitionVO> list4 = dao2.rankExhibitionData(); // 랭킹데이터
		
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("list4", list4);
		
		request.setAttribute("main_jsp", "../main/home.jsp"); // main.jsp
		return "../main/main.jsp";
	}
}
