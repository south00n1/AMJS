package com.sist.vo;

import java.util.Date;

public class ReviewBoardLikeVO {
	 	private int lno,gno, no, hit;
	    private String id, subject, name;
	    private Date regdate;
	    
		public int getHit() {
			return hit;
		}
		public void setHit(int hit) {
			this.hit = hit;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		public int getNo() {
			return no;
		}
		public void setNo(int no) {
			this.no = no;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getLno() {
			return lno;
		}
		public void setLno(int lno) {
			this.lno = lno;
		}
		public int getGno() {
			return gno;
		}
		public void setGno(int gno) {
			this.gno = gno;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
	   
}
