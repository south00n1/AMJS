package com.sist.vo;

/*
	JNO NOT NULL NUMBER       
	NO           NUMBER       
	ID           VARCHAR2(20)
 */
public class JjimVO {
	private int jno, no;
	private String id;
	
	public int getJno() {
		return jno;
	}
	public void setJno(int jno) {
		this.jno = jno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
