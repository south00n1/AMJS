package com.sist.model;
import com.sist.vo.*;
import com.sist.dao.*;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class ReserveModel {
	@RequestMapping("reserve/reserve_main.do")
	public String reserve_main(HttpServletRequest request, HttpServletResponse response) {
		String geno=request.getParameter("geno");
		if(geno==null) geno="3";
		request.setAttribute("geno", geno);
		request.setAttribute("main_jsp", "../reserve/reserve_main.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("reserve/reserve_list.do")
	public String reserve_list(HttpServletRequest request, HttpServletResponse response) {
		String geno=request.getParameter("geno");
		ExhibitionDAO dao=new ExhibitionDAO();
		ExhibitionVO vo=dao.ExhibitionDetailData(Integer.parseInt(geno));
		request.setAttribute("vo", vo);
		return "../reserve/reserve_list.jsp";
	}
	
	@RequestMapping("reserve/reserve_date.do")
	public String reserve_date(HttpServletRequest request, HttpServletResponse response) {
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
		String today=sdf.format(date);
		StringTokenizer st=new StringTokenizer(today,"-");
		String strYear=st.nextToken();
		String strMonth=st.nextToken();
		String strDay=st.nextToken();
		
		String syear=request.getParameter("year");
		String smonth=request.getParameter("month");
		if(syear==null) syear=strYear;
		if(smonth==null) smonth=strMonth;
		
		int year=Integer.parseInt(syear);
		int month=Integer.parseInt(smonth);
		int day=Integer.parseInt(strDay);
		
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1);
		cal.set(Calendar.DATE, 1);
		int week=cal.get(Calendar.DAY_OF_WEEK);
		String[] strWeek= {"일","월","화","수","목","금","토"};
		int lastday=cal.getActualMaximum(Calendar.DATE);

		ReserveDAO dao=new ReserveDAO();
		String geno=request.getParameter("geno");
		String period=dao.reserveDayData(Integer.parseInt(geno));
		int[] temp=dao.reserveDate(period);
		int[] rdays=new int[32];
		for(int s:temp) {
			if(s>=day) rdays[s]=1;
			else if(s<day) rdays[s]=2;
		}
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("lastday", lastday);
		request.setAttribute("week", week-1);
		request.setAttribute("strWeek", strWeek);
		request.setAttribute("rdays", rdays);
		return "../reserve/reserve_date.jsp";
	}
	
	@RequestMapping("reserve/reserve_time.do")
	public String reserve_time(HttpServletRequest request, HttpServletResponse response) {
		String day=request.getParameter("day");
		ReserveDAO dao=new ReserveDAO();
		String rtime=dao.reserveTimeData(Integer.parseInt(day));
		StringTokenizer st=new StringTokenizer(rtime,",");
		List<String> rtimes=new ArrayList<String>();
		while(st.hasMoreTokens()) {
			String ss=dao.reserveTimeRealData(Integer.parseInt(st.nextToken()));
			rtimes.add(ss);
		}
		request.setAttribute("rtimes", rtimes);
		return "../reserve/reserve_time.jsp";
	}
	
	@RequestMapping("reserve/reserve_pers.do")
	public String reserve_pers(HttpServletRequest request, HttpServletResponse response) {
		return "../reserve/reserve_pers.jsp";
	}
	
	@RequestMapping("reserve/pay.do")
	public String reserve_pay(HttpServletRequest request, HttpServletResponse response) {
		String geno=request.getParameter("reserveno");
		String rdate=request.getParameter("reservedate");
		String rtime=request.getParameter("reservetime");
		String inwon=request.getParameter("reservepers");
		request.setAttribute("geno", geno);
		request.setAttribute("rdate", rdate);
		request.setAttribute("rtime", rtime);
		request.setAttribute("inwon", inwon);
		request.setAttribute("main_jsp", "../reserve/pay.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("reserve/reserve_ok.do")
	public String reserve_ok(HttpServletRequest request, HttpServletResponse response) {
		String geno=request.getParameter("reserveno");
		String rdate=request.getParameter("reservedate");
		String rtime=request.getParameter("reservetime");
		String inwon=request.getParameter("reservepers");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		ReserveDAO dao=new ReserveDAO();
		ReserveVO vo=new ReserveVO();
		vo.setGeno(Integer.parseInt(geno));
		vo.setRdate(rdate);
		vo.setRtime(rtime);
		vo.setInwon(Integer.parseInt(inwon));
		vo.setId(id);
		dao.reserveOk(vo);
		return "redirect:../mypage/mypage_reserve_list.do";
	}

	@RequestMapping("reserve/reserve_exhib.do")
	public String reserve_exhib(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch(Exception ex) {}
		String ed=request.getParameter("ed");
		ReserveDAO dao=new ReserveDAO();
		List<ExhibitionVO> list=dao.exhibitionListData(ed);
		request.setAttribute("list", list);
		return "../reserve/reserve_exhibition.jsp";
	}
}