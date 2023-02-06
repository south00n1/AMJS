package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.ReviewBoardDAO;
import com.sist.vo.ReviewBoardReplyVO;
import com.sist.vo.ReviewBoardVO;

@Controller
public class ReviewBoardModel {

	@RequestMapping("board/review_list.do")
	  public String reviewboard_list(HttpServletRequest request,HttpServletResponse response)
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
		  ReviewBoardDAO dao=new ReviewBoardDAO();
		  List<ReviewBoardVO> list=dao.reviewboardFindData(curpage,ss);
		  
		  ////////////////////////////////////////////
		  int count=dao.reviewboardRowCount();
		  int totalpage=(int)(Math.ceil(count/20.0));
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
		  String no=request.getParameter("no");
		  ReviewBoardDAO dao=new ReviewBoardDAO();
		  ReviewBoardVO vo=dao.boardDetailData(Integer.parseInt(no));
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../board/review_detail.jsp"); 
		  List<ReviewBoardReplyVO> list=dao.replyListData(Integer.parseInt(no));
		  request.setAttribute("list", list);
		  request.setAttribute("count", list.size());
		  return "../main/main.jsp";
	  }
	  
	  @RequestMapping("board/review_update.do")
	  public String reviewboard_update(HttpServletRequest request,HttpServletResponse response)
	  {
		  String no=request.getParameter("no");
		  ReviewBoardDAO dao=new ReviewBoardDAO();
		  ReviewBoardVO vo=dao.boardUpdateData(Integer.parseInt(no));
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../board/review_update.jsp");
		  return "../main/main.jsp";
	  }
	  
	  @RequestMapping("board/review_update_ok.do")
	  public String reviewboard_update_ok(HttpServletRequest request,HttpServletResponse response)
	  {
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String no=request.getParameter("no");
		  String name=request.getParameter("name");
		  String subject=request.getParameter("subject");
		  String display_name=request.getParameter("display_name");
		  String content=request.getParameter("content");
		  String pwd=request.getParameter("pwd");
		  
		  ReviewBoardVO vo=new ReviewBoardVO();
		  vo.setno(Integer.parseInt(no));
		  vo.setName(name);
		  vo.setSubject(subject);
		  vo.setDisplay_name(display_name);
		  vo.setContent(content);
		  vo.setPwd(pwd);
		  
		  ReviewBoardDAO dao=new ReviewBoardDAO();
		  boolean bCheck=dao.boardUpdate(vo);
		  if(bCheck==true)
		  {
			  request.setAttribute("res", "yes");
		  }
		  else
		  {
			  request.setAttribute("res", "no");
		  }
		  return "../board/review_update_ok.jsp";
	  }
	  
	  @RequestMapping("board/review_delete.do")
	  public String reviewboard_delete(HttpServletRequest request,HttpServletResponse response)
	  {
		  String no=request.getParameter("no");
		  String pwd=request.getParameter("pwd");
		  ReviewBoardDAO dao=new ReviewBoardDAO();
		  boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
		  if(bCheck==true)
		  {
			  request.setAttribute("res", "yes");
		  }
		  else
		  {
			  request.setAttribute("res", "no");
		  }
		  return "../board/review_update_ok.jsp";
	  }
	  
	  @RequestMapping("board/reply_insert.do")
	  public String reply_insert(HttpServletRequest request,HttpServletResponse response)
	  {
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String bno=request.getParameter("bno");
		  String msg=request.getParameter("msg");
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  String name=(String)session.getAttribute("name");
		  ReviewBoardReplyVO vo=new ReviewBoardReplyVO();
		  vo.setbno(Integer.parseInt(bno));
		  vo.setMsg(msg);
		  vo.setId(id);
		  vo.setName(name);
		  ReviewBoardDAO dao=new ReviewBoardDAO();
		  dao.replyInsert(vo);
		  return "redirect:review_detail.do?no="+bno; //의심 (no)
	  }
	  
	  @RequestMapping("board/reply_update.do")
	  public String reply_update(HttpServletRequest request,HttpServletResponse response)
	  {
		  try
		  {
	          request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String bno=request.getParameter("bno");
		  String rno=request.getParameter("rno");
		  String msg=request.getParameter("msg");
		  //DAO연결
		  ReviewBoardDAO dao=new ReviewBoardDAO();
		  dao.replyUpdate(Integer.parseInt(rno), msg);
		  return "redirect:review_detail.do?no="+bno;
	  }
	  
	  @RequestMapping("board/reply_reply_insert.do")
	  public String reply_reply_insert(HttpServletRequest request,HttpServletResponse response)
	  {
		  try
		  {
	          request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String bno=request.getParameter("bno");
		  String pno=request.getParameter("pno");// 댓글 번호 => 상위번호 
		  String msg=request.getParameter("msg");
		  
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  String name=(String)session.getAttribute("name");
		  
		  ReviewBoardReplyVO vo=new ReviewBoardReplyVO();
		  vo.setbno(Integer.parseInt(bno));
		  vo.setId(id);
		  vo.setName(name);
		  vo.setMsg(msg);
		  ReviewBoardDAO dao=new ReviewBoardDAO();
		  // 답변 => 메소드 호출 
		  dao.replyReplyInsert(Integer.parseInt(pno), vo);
		  return "redirect:review_detail.do?no="+bno;
	  }
	  
	  @RequestMapping("board/reply_delete.do")
	  public String reply_delete(HttpServletRequest request,HttpServletResponse response)
	  {
		  String rno=request.getParameter("rno");
		  String bno=request.getParameter("bno");
		  ReviewBoardDAO dao=new ReviewBoardDAO();
		  // 삭제 처리 
		  dao.replyDelete(Integer.parseInt(rno));
		  return "redirect:review_detail.do?no="+bno;
	  }
	  
}
