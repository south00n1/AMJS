package com.sist.vo;

import java.sql.Date;

public class replyVO {

	private int gbrno,gruop_id,group_step,group_tab,root,depth,grbno;
	private String name,msg,id;
	private Date regdate;
	public int getGbrno() {
		return gbrno;
	}
	public void setGbrno(int gbrno) {
		this.gbrno = gbrno;
	}
	public int getGruop_id() {
		return gruop_id;
	}
	public void setGruop_id(int gruop_id) {
		this.gruop_id = gruop_id;
	}
	public int getGroup_step() {
		return group_step;
	}
	public void setGroup_step(int group_step) {
		this.group_step = group_step;
	}
	public int getGroup_tab() {
		return group_tab;
	}
	public void setGroup_tab(int group_tab) {
		this.group_tab = group_tab;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getGrbno() {
		return grbno;
	}
	public void setGrbno(int grbno) {
		this.grbno = grbno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
