package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.EventBoardDAO;
import com.sist.dao.NoticeBoardDAO;
import com.sist.vo.EventBoardVO;
import com.sist.vo.NoticeBoardVO;

@Controller
	public class EventBoardModel {
		@RequestMapping("board/event_list.do")
		  public String eventboard_list(HttpServletRequest request,HttpServletResponse response)
		  {
			try
			   {
				   // 한글 변환 
				   request.setCharacterEncoding("UTF-8");
			   }catch(Exception ex){}
			   String ss=request.getParameter("ss");
			   if(ss==null)
				   ss="";
			   
			  String page=request.getParameter("page");
			  if(page==null)
				  page="1";

			  int curpage=Integer.parseInt(page);
			  EventBoardDAO dao=new EventBoardDAO();
			  List<EventBoardVO> list=dao.eventboardFindData(curpage,ss);
			  
			  ////////////////////////////////////////////
			  int count=dao.eventboardRowCount();
			  int totalpage=(int)(Math.ceil(count/12.0));
			  final int BLOCK=10;
			  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			  if(endPage>totalpage)
				   endPage=totalpage;
			  request.setAttribute("ss", ss);
			  request.setAttribute("curpage", curpage);
			  request.setAttribute("totalpage", totalpage);
			  request.setAttribute("startPage", startPage);
			  request.setAttribute("endPage", endPage);
			  request.setAttribute("count", count);
			  request.setAttribute("list", list);
			  /////////////////////////////////////////////
			  //int totalpage=dao.boardTotalPage();

			  //request.setAttribute("curpage", curpage);
			  //request.setAttribute("totalpage", totalpage);
			  request.setAttribute("list", list);
			  request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			  request.setAttribute("main_jsp", "../board/event_list.jsp");
			  return "../main/main.jsp";
		  }
		
		@RequestMapping("board/event_detail.do")
		  public String eventboard_detail(HttpServletRequest request,HttpServletResponse response)
		  {
			  String gebno=request.getParameter("gebno");
			  EventBoardDAO dao=new EventBoardDAO();
			  EventBoardVO vo=dao.eventboardDetailData(Integer.parseInt(gebno));
			  request.setAttribute("vo", vo);
			  request.setAttribute("main_jsp", "../board/event_detail.jsp"); 
			  return "../main/main.jsp";
		  }
		
	
	}

