package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.FaqDAO;
import com.sist.dao.NoticeBoardDAO;
import com.sist.dao.ReserveDAO;
import com.sist.dao.ReviewBoardDAO;
import com.sist.vo.FaqVO;
import com.sist.vo.NoticeBoardVO;
import com.sist.vo.ReviewBoardVO;

@Controller
public class NoticeBoardModel {
	private String[] prefix={"","서비스소식","서비스오픈","서비스종료","서비스점검","안내"};
	
	
	@RequestMapping("board/notice_list.do")
	  public String noticeboard_list(HttpServletRequest request,HttpServletResponse response)
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
		  NoticeBoardDAO dao=new NoticeBoardDAO();
		  List<NoticeBoardVO> list=dao.noticeboardFindData(curpage,ss);
		  
		   for(NoticeBoardVO vo:list)
		   {
			   vo.setPrefix("["+prefix[vo.getType()]+"]");
		   }
		  
		  ////////////////////////////////////////////
		  int count=dao.noticeboardRowCount();
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
		  /////////////////////////////////////////////
		  //int totalpage=dao.boardTotalPage();

		  //request.setAttribute("curpage", curpage);
		  //request.setAttribute("totalpage", totalpage);
		  request.setAttribute("list", list);
		  request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		  request.setAttribute("main_jsp", "../board/notice_list.jsp");
		  return "../main/main.jsp";
	  }
	
	@RequestMapping("board/notice_detail.do")
	  public String noticeboard_detail(HttpServletRequest request,HttpServletResponse response)
	  {
		  String gnbno=request.getParameter("gnbno");
		  NoticeBoardDAO dao=new NoticeBoardDAO();
		  NoticeBoardVO vo=dao.boardDetailData(Integer.parseInt(gnbno));
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../board/notice_detail.jsp"); 
		  return "../main/main.jsp";
	  }
	
	
	// select박스 활용 모델
	@RequestMapping("baord/notice_type.do")
	public String notice_type(HttpServletRequest request, HttpServletResponse response) {
		String type=request.getParameter("type");
		if(type==null) type="0";
		String page=request.getParameter("page");
	    if(page==null) page="1";	
	    int curpage=Integer.parseInt(page);
		NoticeBoardDAO dao=new NoticeBoardDAO();
		List<NoticeBoardVO> list=dao.boardListData(Integer.parseInt(type), curpage);
		int count=dao.noticeboardRowCount(Integer.parseInt(type));
		int totalpage=(int)(Math.ceil(count/10.0));
		request.setAttribute("type", type);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
		return "../board/notice_list.jsp";
	}
}
