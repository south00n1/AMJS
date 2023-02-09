package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.AdminDAO;
import com.sist.dao.MemberDAO;
import com.sist.dao.MypageDAO;
import com.sist.dao.NoticeBoardDAO;
import com.sist.dao.ServiceDAO;
import com.sist.vo.AskVO;
import com.sist.vo.MemberVO;
import com.sist.vo.NoticeBoardVO;
import com.sist.vo.ReserveVO;

@Controller
public class AdminModel {
	private String[] prefix={"","서비스소식","서비스오픈","서비스종료","서비스점검","안내"};
	@RequestMapping("adminpage/adminpage_main.do")
	public String admin_main(HttpServletRequest request,HttpServletResponse response)
	{
		  request.setAttribute("admin_jsp", "../adminpage/admin_home.jsp");
		  request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		  return "../main/main.jsp";
	}
	
	@RequestMapping("adminpage/notice_list.do")
	  public String admin_notice_list(HttpServletRequest request,HttpServletResponse response)
	  {
		
			String page = request.getParameter("page");
			if (page == null) {
				page = "1";
			}
			int curpage = Integer.parseInt(page);
			// dao연결
			AdminDAO dao = new AdminDAO();
			List<NoticeBoardVO> list = dao.adminNoticeBoardList(curpage);
			int totalpage = dao.adminNoticeListTotalPage();
			
			final int BLOCK = 5;
			int startPage = ((curpage-1)/BLOCK*BLOCK) + 1;
			int endPage = ((curpage-1)/BLOCK * BLOCK) + BLOCK;
			if (endPage > totalpage)
				 endPage = totalpage;
			
		   for(NoticeBoardVO vo:list)
		   {
			   vo.setPrefix("["+prefix[vo.getType()]+"]");
		   }
		   
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("startPage", startPage);
		  request.setAttribute("endPage", endPage);
		  request.setAttribute("list", list);
		  request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		  
		  return "../adminpage/notice_list.jsp";
	  }
	
	@RequestMapping("adminpage/notice_insert.do")
	  public String admin_notice_insert(HttpServletRequest request,HttpServletResponse response)
	  {
		   return "../adminpage/notice_insert.jsp";
	  }
	
	@RequestMapping("adminpage/notice_insert_ok.do")
	  public String admin_notice_insert_ok(HttpServletRequest request,HttpServletResponse response)
	  {
		  // 사용자가 전송한 데이터 받기 
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String type=request.getParameter("type");
		  String name=request.getParameter("name");
		  String subject=request.getParameter("subject");
		  String content=request.getParameter("content");
		  String id=request.getParameter("id");
		  NoticeBoardVO vo=new NoticeBoardVO();
		  vo.setType(Integer.parseInt(type));
		  vo.setName(name);
		  vo.setSubject(subject);
		  vo.setContent(content);
		  vo.setId(id);
		  //DAO연결 => 오라클 
		  NoticeBoardDAO dao=new NoticeBoardDAO();
		  dao.noticeInsert(vo);
		  return "redirect:notice_list.do";
	  }
	
	@RequestMapping("adminpage/notice_update.do")
	  public String admin_notice_update(HttpServletRequest request,HttpServletResponse response)
	  {
		   String gnbno=request.getParameter("gnbno");
		   NoticeBoardDAO dao=new NoticeBoardDAO();
		   NoticeBoardVO vo=dao.noticeUpdateData(Integer.parseInt(gnbno));
		   request.setAttribute("vo", vo);

		   return "../adminpage/notice_update.jsp";
	  }
	  @RequestMapping("adminpage/notice_update_ok.do")
	  public String admin_notice_update_ok(HttpServletRequest request,HttpServletResponse response)
	  {
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex){}
		  String type=request.getParameter("type");
		  String name=request.getParameter("name");
		  String subject=request.getParameter("subject");
		  String content=request.getParameter("content");
		  String gnbno=request.getParameter("no");
		  
		  NoticeBoardVO vo=new NoticeBoardVO();
		  vo.setType(Integer.parseInt(type));
		  vo.setName(name);
		  vo.setSubject(subject);
		  vo.setContent(content);
		  vo.setGnbno(Integer.parseInt(gnbno));
		  NoticeBoardDAO dao=new NoticeBoardDAO();
		  // 메소드 호출 
		  dao.noticeUpdate(vo);
		  return "redirect:notice_list.do";
	  }
	  
	  @RequestMapping("adminpage/notice_delete.do")
	  public String admin_notice_delete(HttpServletRequest request,HttpServletResponse response)
	  {
		  String gnbno=request.getParameter("gnbno");
		  //DAO연동 
		  NoticeBoardDAO dao=new NoticeBoardDAO();
		  dao.noticeDelete(Integer.parseInt(gnbno));
		  return "redirect:notice_list.do";
	  }
	  
	  @RequestMapping("adminpage/admin_reserve_list.do")
	  public String admin_reserve_list(HttpServletRequest request,HttpServletResponse response) {
		  
		  String page = request.getParameter("page");
		  if (page == null) {
			  page = "1";
		  }
		  int curpage = Integer.parseInt(page);
		  AdminDAO dao = new AdminDAO();
		  List<ReserveVO> list = dao.adminpageReserveData(curpage);
		  
		  int totalpage = dao.adminpageReserveListTotalPage();
			
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
		  
		  request.setAttribute("list", list);
		  return "../adminpage/reserve_list.jsp";
	  }
	  @RequestMapping("adminpage/admin_reserve_list_ok.do")
	  public String admin_reserve_list_ok(HttpServletRequest request,HttpServletResponse response) {
		  
		  String gerno = request.getParameter("gerno");
		  String page = request.getParameter("page");
		  AdminDAO dao = new AdminDAO();
		  dao.reserveAdminOk(Integer.parseInt(gerno));
		  
		  return "redirect:../adminpage/admin_reserve_list.do";
	  }
	  
	  @RequestMapping("adminpage/faq_list.do")
	  public String admin_faq_list(HttpServletRequest request,HttpServletResponse response) 
	  {  
		  String page = request.getParameter("page");
			if (page == null) {
				page = "1";
			}
			int curpage = Integer.parseInt(page);
			// dao연결
			AdminDAO dao = new AdminDAO();
			List<AskVO> list = dao.adminpageMyqnaData(curpage);
			int totalpage = dao.adminMyqndListTotalPage();
			
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
		  
		  return "../adminpage/faq_list.jsp";
	  }
	  
	  @RequestMapping("adminpage/member_list.do")
	  public String member_list(HttpServletRequest request, HttpServletResponse response) {
		  
		  String page = request.getParameter("page");
			if (page == null) {
				page = "1";
			}
			int curpage = Integer.parseInt(page);
			// dao연결
			AdminDAO dao = new AdminDAO();
			List<MemberVO> list = dao.adminpageMemberList(curpage);
			int totalpage = dao.adminpageMemberListTotalPage();
			
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
		  
		  return "../adminpage/member_list.jsp";
	  }
	  @RequestMapping("adminpage/member_delete_list.do")
	  public String admin_member_delete(HttpServletRequest request,HttpServletResponse response)
	  {
		  String id=request.getParameter("id");
		  //DAO연동 
		  AdminDAO dao=new AdminDAO();
		  dao.adminpageMemberDelete(id);
		  return "redirect:../adminpage/member_list.do";
	  }

}
