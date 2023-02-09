package com.sist.model;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

@Controller
public class QuickModel {
	@RequestMapping("quick/pic_cookie.do")
	public String pic_cookie(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		Cookie[] cookies=request.getCookies();
		
		PictureDAO pdao=new PictureDAO();
		List<PictureVO> pList=new ArrayList<PictureVO>();
		if(cookies!=null) {
			if(id==null) {
				for(int i=cookies.length-1;i>=0;i--) {
					if(cookies[i].getName().startsWith("guest_picture")) {
						String pc=cookies[i].getValue();
						PictureVO pvo=pdao.pictureDetailData(Integer.parseInt(pc));
						pList.add(pvo);
					}
				}
			} else {
				for(int i=cookies.length-1;i>=0;i--) {
					if(cookies[i].getName().startsWith(id+"_picture")) {
						String pc=cookies[i].getValue();
						PictureVO pvo=pdao.pictureDetailData(Integer.parseInt(pc));
						pList.add(pvo);
					}
				}
			}
		}
		request.setAttribute("id", id);
		request.setAttribute("pList", pList);
		return "../main/main.jsp";
	}
}
