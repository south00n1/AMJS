package com.sist.model;
import com.sist.vo.*;
import com.sist.dao.*;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class ReserveModel {
	@RequestMapping("reserve/reserve_main.do")
	public String reserve_main(HttpServletRequest request, HttpServletResponse response) {
		String geno=request.getParameter("geno");
		if(geno==null) geno="1";
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

		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("lastday", lastday);
		request.setAttribute("week", week-1);
		request.setAttribute("strWeek", strWeek);
		return "../reserve/reserve_date.jsp";
	}
	
	@RequestMapping("reserve/reserve_time.do")
	public String reserve_time(HttpServletRequest request, HttpServletResponse response) {
		
		return "../reserve/reserve_time.jsp";
	}
	
	@RequestMapping("reserve/reserve_pers.do")
	public String reserve_pers(HttpServletRequest request, HttpServletResponse response) {
		
		return "../reserve/reserve_pers.jsp";
	}
	
	@RequestMapping("reserve/reserve_seat.do")
	public String reserve_seat(HttpServletRequest request, HttpServletResponse response) {
		
		return "../reserve/reserve_seat.jsp";
	}
}