package com.sist.vo;
/*
	GERNO NOT NULL NUMBER       
	RDATE NOT NULL VARCHAR2(30) 
	RTIME NOT NULL VARCHAR2(20) 
	INWON NOT NULL NUMBER       
	OK    NOT NULL VARCHAR2(10) 
	GENO           NUMBER       
	ID             VARCHAR2(20) 
 */
public class ReserveVO {
	private int gerno, inwon, geno;
	private String rdate, rtime, ok, id;
	
	public int getGerno() {
		return gerno;
	}
	public void setGerno(int gerno) {
		this.gerno = gerno;
	}
	public int getInwon() {
		return inwon;
	}
	public void setInwon(int inwon) {
		this.inwon = inwon;
	}
	public int getGeno() {
		return geno;
	}
	public void setGeno(int geno) {
		this.geno = geno;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public String getOk() {
		return ok;
	}
	public void setOk(String ok) {
		this.ok = ok;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
