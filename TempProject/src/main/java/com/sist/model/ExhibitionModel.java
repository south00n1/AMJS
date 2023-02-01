package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.*;
import com.sist.vo.*;
// Spring
@Controller
public class ExhibitionModel {
   @RequestMapping("exhibition/exhibition_all.do") // if문 대신 사용
   public String exhibitionAll(HttpServletRequest request,HttpServletResponse response)
   {
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   int curpage=Integer.parseInt(page);
	   ExhibitionDAO dao=new ExhibitionDAO();
	   ArrayList<ExhibitionVO> list=dao.exhibitionAllListData(curpage);
	   int count=dao.exhibitionRowCount();
	   int totalpage=(int)(Math.ceil(count/20.0));
	   //int totalpage=dao.exhibitionAllTotalPage();
	   
	   final int BLOCK=10;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	   if(endPage>totalpage)
		   endPage=totalpage;
	   // 화면에 출력할 모든 데이터를 JSP로 전송 
	   request.setAttribute("list", list);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("startPage", startPage);
	   request.setAttribute("endPage", endPage);
	   request.setAttribute("count", count);
	   request.setAttribute("main_jsp", "../exhibition/exhibition_all.jsp");// main.jsp에서 include되는 파일 지정 
	   return "../main/main.jsp";
   }  
   
   @RequestMapping("exhibition/exhibition_detail.do")
	public String exhibition_exhibitiondetail(HttpServletRequest request, HttpServletResponse response) {
		String geno = request.getParameter("geno");
		ExhibitionDAO dao = new ExhibitionDAO();
		ExhibitionVO vo = dao.ExhibitionDetailData(Integer.parseInt(geno));
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../exhibition/exhibition_detail.jsp");
		return "../main/main.jsp";
	}
}