package com.sist.vo;
/*
	GPNO    NOT NULL NUMBER        
	IMAGE   NOT NULL VARCHAR2(260) 
	TITLE   NOT NULL VARCHAR2(150) 
	NAME    NOT NULL VARCHAR2(60)  
	CONTENT          CLOB
 */
public class PictureVO {
	private int gpno;
	private int image, title, name, content;
	
	public int getGpno() {
		return gpno;
	}
	public void setGpno(int gpno) {
		this.gpno = gpno;
	}
	public int getImage() {
		return image;
	}
	public void setImage(int image) {
		this.image = image;
	}
	public int getTitle() {
		return title;
	}
	public void setTitle(int title) {
		this.title = title;
	}
	public int getName() {
		return name;
	}
	public void setName(int name) {
		this.name = name;
	}
	public int getContent() {
		return content;
	}
	public void setContent(int content) {
		this.content = content;
	}
}
