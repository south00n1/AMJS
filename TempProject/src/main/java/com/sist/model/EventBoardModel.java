package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.EventBoardDAO;
import com.sist.vo.EventBoardVO;

@Controller
	public class EventBoardModel {
		@RequestMapping("board/event_list.do")
		  public String eventboard_list(HttpServletRequest request,HttpServletResponse response)
		  {

			  String page=request.getParameter("page");
			  if(page==null)
				  page="1";

			  int curpage=Integer.parseInt(page);
			  EventBoardDAO dao=new EventBoardDAO();
			  List<EventBoardVO> list=dao.boardListData(curpage);
			  
			  ////////////////////////////////////////////
			  int count=dao.eventboardRowCount();
			  int totalpage=(int)(Math.ceil(count/20.0));
			  final int BLOCK=10;
			  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			  if(endPage>totalpage)
				   endPage=totalpage;
			  request.setAttribute("curpage", curpage);
			  request.setAttribute("totalpage", totalpage);
			  request.setAttribute("startPage", startPage);
			  request.setAttribute("endPage", endPage);
			  request.setAttribute("count", count);
			  /////////////////////////////////////////////
			  //int totalpage=dao.boardTotalPage();

			  //request.setAttribute("curpage", curpage);
			  //request.setAttribute("totalpage", totalpage);
			  request.setAttribute("list", list);
			  request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			  request.setAttribute("main_jsp", "../board/event_list.jsp");
			  return "../main/main.jsp";
		  }
	
	}

