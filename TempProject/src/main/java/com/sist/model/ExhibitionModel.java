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
	   List <ExhibitionVO> list=dao.exhibitionAllListData(curpage);
	   for(ExhibitionVO vo:list)
	   {
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
	   
	 

		
	   return "../main/main.jsp";
   }  
   
   @RequestMapping("exhibition/exhibition_find.do")
   public String exhibition_find(HttpServletRequest request, HttpServletResponse response)
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
		   StringTokenizer st = new StringTokenizer(vo.getPeriod(), "~") ;
		   vo.setStartday(st.nextToken().trim());
		   vo.setEndday(st.nextToken().trim());
	   }
	   int count=dao.exhibitionitemFindTotalPage(tt);
	   //int totalpage=dao.exhibitionAllTotalPage();
	   int totalpage=(int)(Math.ceil(count/20.0));
	   final int BLOCK=10;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	   if(endPage>totalpage)
		   endPage=totalpage;
	   // 화면에 출력할 모든 데이터를 JSP로 전송 
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("list", list);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("startPage", startPage);
	   request.setAttribute("endPage", endPage);
	   request.setAttribute("count", count);
	   request.setAttribute("today", new SimpleDateFormat("yyyyMMdd").format(new Date()));
	   
	 //진행중 / 종료 띄우기

	      
		  //request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		   String today1 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		   //String today1 = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
		   
		   
	   request.setAttribute("today1", today1);
	 
	   request.setAttribute("tt", tt);
	   request.setAttribute("main_jsp", "../exhibition/exhibition_search.jsp");
	   return "../main/main.jsp";
   }

	   @RequestMapping("exhibition/exhibition_category.do") // if문 대신 사용
	   public String exhibition_category(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			   // 한글 변환
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		  
		   int curpage=Integer.parseInt(page);
		   String eno=request.getParameter("eno");
		   if(eno==null)
			   eno="1";
		   int eee=Integer.parseInt(eno);
		   ExhibitionDAO dao=new ExhibitionDAO();
		   String[] temp= {"","육아","스포츠","인테리어","예술","전기","기계","농축산"}; 
		   List<ExhibitionVO> list=dao.exhibitionCategoryListData(curpage,temp[eee]);
		   for(ExhibitionVO vo:list)
		   {
			   StringTokenizer st = new StringTokenizer(vo.getPeriod(), "~") ;
			   vo.setStartday(st.nextToken().trim());
			   vo.setEndday(st.nextToken().trim());
		   }
		   int count=dao.exhibitionCategoryTotalPage(eee);
		   int totalpage=(int)(Math.ceil(count/20.0));
		   //int totalpage=dao.exhibitionAllTotalPage();
		   
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   if(endPage>totalpage)
			   endPage=totalpage;
		   // 화면에 출력할 모든 데이터를 JSP로 전송 
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		   request.setAttribute("count", count);
		   request.setAttribute("eee",eee);
		   request.setAttribute("list", list);
		   request.setAttribute("today", new SimpleDateFormat("yyyyMMdd").format(new Date()));
		   //request.setAttribute("main_jsp", "../exhibition/exhibition_category.jsp");  // main.jsp에서 include되는 파일 지정 
		   
		   //진행중 / 종료 띄우기

		      
		   //request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		   String today1 = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
		   //String today1 = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
			   
			   
		   request.setAttribute("today1", today1);
		   
		   request.setAttribute("list", list);
		   request.setAttribute("main_jsp", "../exhibition/exhibition_category.jsp");
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
	   
   /*@RequestMapping("exhibition/exhibition_item_search.do")
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
   }*/
   
 /* @RequestMapping("exhibition/exhibition_category.do")
  public String exhibition_category(HttpServletRequest request,HttpServletResponse response)
  {
			try {
				request.setCharacterEncoding("UTF-8");
			} catch(Exception ex) {}
			String ec=request.getParameter("ec");
			System.out.println(ec);
			ExhibitionDAO dao=new ExhibitionDAO();
			List<ExhibitionVO> list=dao.exhibitionCategoryListData(ec);
			request.setAttribute("list", list);
			return "../exhibition/exhibition_all.jsp";
		}*/
	  
  }
  	









































