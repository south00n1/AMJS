package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.ReviewBoardDAO;
import com.sist.vo.ReviewBoardVO;

@Controller
public class ReviewBoardModel {

	@RequestMapping("board/review_list.do")
	  public String reviewboard_list(HttpServletRequest request,HttpServletResponse response)
	  {

		  String page=request.getParameter("page");
		  if(page==null)
			  page="1";

		  int curpage=Integer.parseInt(page);
		  ReviewBoardDAO dao=new ReviewBoardDAO();
		  List<ReviewBoardVO> list=dao.boardListData(curpage);
		  
		  ////////////////////////////////////////////
		  int count=dao.reviewboardRowCount();
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
		  request.setAttribute("main_jsp", "../board/review_list.jsp");
		  return "../main/main.jsp";
	  }
	  @RequestMapping("board/review_insert.do")
	  public String reviewboard_insert(HttpServletRequest request,HttpServletResponse response)
	  {
		  request.setAttribute("main_jsp", "../board/review_insert.jsp");
		  return "../main/main.jsp";
	  }
	  @RequestMapping("board/review_insert_ok.do")
	  public String reviewboard_insert_ok(HttpServletRequest request,HttpServletResponse response)
	  {
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex){}
		  String name=request.getParameter("name");
		  String subject=request.getParameter("subject");
		  String display_name=request.getParameter("display_name");
		  String content=request.getParameter("content");
		  String pwd=request.getParameter("pwd");
		  ReviewBoardVO vo=new ReviewBoardVO();
		  vo.setName(name);
		  vo.setSubject(subject);
		  vo.setDisplay_name(display_name);
		  vo.setContent(content);
		  vo.setPwd(pwd);
		  ReviewBoardDAO dao=new ReviewBoardDAO();
		  dao.boardInsert(vo); 
		  return "redirect:review_list.do";

	  }
	  @RequestMapping("board/review_detail.do")
	  public String reviewboard_detail(HttpServletRequest request,HttpServletResponse response)
	  {
		  String grbno=request.getParameter("grbno");
		  ReviewBoardDAO dao=new ReviewBoardDAO();
		  ReviewBoardVO vo=dao.boardDetailData(Integer.parseInt(grbno));
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../board/review_detail.jsp"); 
		  return "../main/main.jsp";
	  }
}
