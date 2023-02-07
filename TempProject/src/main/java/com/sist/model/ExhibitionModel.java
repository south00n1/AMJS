package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.StringTokenizer;

// Spring
@Controller
public class ExhibitionModel {
   @RequestMapping("exhibition/exhibition_all.do") // if문 대신 사용
   public String exhibitionAll(HttpServletRequest request,HttpServletResponse response)
   {
	   try
	   {
		   // 한글 변환
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   String tt=request.getParameter("tt");
	   if(tt==null)
		   tt="";
	   
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   int curpage=Integer.parseInt(page);
	   ExhibitionDAO dao=new ExhibitionDAO();
	   ArrayList<ExhibitionVO> list=dao.exhibitionItemFindData(curpage,tt);
	   
	   for(ExhibitionVO vo:list)
	   {
		   //System.out.println(vo.getPeriod());
		   StringTokenizer st = new StringTokenizer(vo.getPeriod(), "~") ;
		   vo.setStartday(st.nextToken().trim());
		   vo.setEndday(st.nextToken().trim());
	   }
	   int count=dao.exhibitionRowCount();
	   int totalpage=(int)(Math.ceil(count/20.0));
	   //int totalpage=dao.exhibitionAllTotalPage();
	   
	   final int BLOCK=10;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	   if(endPage>totalpage)
		   endPage=totalpage;
	   // 화면에 출력할 모든 데이터를 JSP로 전송 
	   request.setAttribute("tt", tt);
	   request.setAttribute("list", list);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("startPage", startPage);
	   request.setAttribute("endPage", endPage);
	   request.setAttribute("count", count);
	   request.setAttribute("today", new SimpleDateFormat("yyyyMMdd").format(new Date()));
	   request.setAttribute("main_jsp", "../exhibition/exhibition_all.jsp");  // main.jsp에서 include되는 파일 지정 
	   
	   //진행중 / 종료 띄우기

	      
	  //request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	   String today1 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	   //String today1 = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	   
	   
	   request.setAttribute("today1", today1);
	   
	   
	   //request.setAttribute("sd", st.nextToken().trim());
	   //request.setAttribute("ed", st.nextToken().trim());
	 
	      
	      
	  
	         
	         
	         
	   /* Calendar today = Calendar.getInstance();
      Calendar s_day = Calendar.getInstance();
      Calendar d_day = Calendar.getInstance();
      
      
      String period = "2023-02-05 ~ 2023-02-07";
      StringTokenizer st = new StringTokenizer(period, "~");
      
      String start = st.nextToken().trim();
      String end = st.nextToken().trim();
      
      String st_year =start.substring(0,4);
      String st_month =start.substring(5,7);
      String st_day =start.substring(8);
      
      String e_year =end.substring(0,4);
      String e_month =end.substring(5,7);
      String e_day =end.substring(8);
      
      
      d_day.set(Integer.parseInt(e_year), Integer.parseInt(e_month)-1, Integer.parseInt(e_day));
      s_day.set(Integer.parseInt(st_year), Integer.parseInt(st_month)-1, Integer.parseInt(st_day));
      
      long l_s_day = s_day.getTimeInMillis() / (24 * 60 * 60 * 1000);
      long l_today = today.getTimeInMillis() / (24 * 60 * 60 * 1000); 
      long l_d_day = d_day.getTimeInMillis() / (24 * 60 * 60 * 1000);
      
      SimpleDateFormat sd = new SimpleDateFormat();
      

	 */
	   return "../main/main.jsp";
   }  
   
   
   @RequestMapping("exhibition/exhibition_before_detail.do")
   public String exhibition_before_detail(HttpServletRequest request,HttpServletResponse response)
   {
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   
	   String user="";
	   
	   if(id==null)
		   user="guest";
	   else
		   user=id;
	   
	   String geno=request.getParameter("geno");
	   try
	   {
		   Cookie cookie=new Cookie(user+"_exhibition"+geno,geno);
		   cookie.setPath("/");
		   cookie.setMaxAge(60*60*24);  // 쿠키를 하루동안 저장
		   response.addCookie(cookie); // 브라우저로 들어감
	   }catch(Exception ex) {}

	   return "redirect:../exhibition/exhibition_detail.do?geno="+geno;
   }
   
   
   @RequestMapping("exhibition/exhibition_detail.do")
	public String exhibition_exhibitiondetail(HttpServletRequest request, HttpServletResponse response) {
		String geno = request.getParameter("geno");
		ExhibitionDAO dao = new ExhibitionDAO();
		ExhibitionVO vo = dao.ExhibitionDetailData(Integer.parseInt(geno));
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../exhibition/exhibition_detail.jsp");
		ArrayList<ExhibitionVO> list=dao.exhibitionAllListData(Integer.parseInt(geno));
		LikeDAO ldao=new LikeDAO();
		for(ExhibitionVO evo:list)
		{
			evo.setCount(ldao.ExhibitionLikeCount(evo.getGeno()));
		}
		request.setAttribute("list", list);
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		int mc=ldao.myLikeCount(Integer.parseInt(geno), id);
		int tc=ldao.ExhibitionLikeCount(Integer.parseInt(geno));
		request.setAttribute("like_count", mc);
		request.setAttribute("like_total", tc);
		

		return "../main/main.jsp";
	}
   
   @RequestMapping("exhibition/exhibition_item_search.do")
   public String exhibition_item(HttpServletRequest request,HttpServletResponse response)
   {
	   try
	   {
		   // 한글 변환
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   String tt=request.getParameter("tt");
	   if(tt==null)
		   tt="";
	   
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   
	   // 현재페이지 설정
	   int curpage=Integer.parseInt(page);
	   // DAO에서 해당 페이지의 데이터 읽기
	   ExhibitionDAO dao=new ExhibitionDAO();
	   ArrayList<ExhibitionVO> list=dao.exhibitionItemFindData(curpage,tt);
	   return "../main/main.jsp";
   }
   
  /*@RequestMapping("exhibition_inprogress.do")
  public String exhibition_inprogress(HttpServletRequest request,HttpServletResponse response)
  {
	  ExhibitionVO vo=new ExhibitionVO();
	  request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	  
	  return "../main/main.jsp";
	  
  }*/
  	
}








































