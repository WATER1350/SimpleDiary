package com.wgh.model;

public class Reply {
	private int id = 0;
	private int whoid = 0;
	private String whoname = "";
	private int whoesid = 0;
	private String whoesname = "";
	private String replyContent = "";
	private int diaryid = 0;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getWhoid() {
		return whoid;
	}

	public void setWhoid(int whoid) {
		this.whoid = whoid;
	}

	public String getWhoname() {
		return whoname;
	}

	public void setWhoname(String whoname) {
		this.whoname = whoname;
	}

	public int getWhoesid() {
		return whoesid;
	}

	public void setWhoesid(int whoesid) {
		this.whoesid = whoesid;
	}
	
	public String getWhoesname() {
		return whoesname;
	}
	
	public void setWhoesname(String whoesname) {
		this.whoesname = whoesname;
	}
	
	public String getReplyContent() {
		return replyContent;
	}
	
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	
	public int getDiaryid() {
		return diaryid;
	}
	
	public void setDiaryid(int diaryid) {
		this.diaryid = diaryid;
	}
	
}
