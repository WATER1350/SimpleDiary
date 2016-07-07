package com.wgh.model;

import java.util.ArrayList;
import java.util.Date;

import com.wgh.model.Reply;

import java.util.List;

public class Diary {
	private int id = 0;// 日记ID号
	private String title = "";// 日记标题
	private String address = "";// 日记图片地址
	private Date writeTime = null;// 写日记的时间
	private int userid = 0;// 用户ID
	private String username = "";// 用户名
	private String detail = "";// 日记正文
	private int visibility = 0;
	private int type = 0;
	private List<Reply> replyList;
	
	public Diary() {
		super();
		replyList = new ArrayList<Reply>();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getWriteTime() {
		return writeTime;
	}

	public void setWriteTime(Date writeTime) {
		this.writeTime = writeTime;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	public String getDetail() {
		return detail;
	}
	
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	public int getVisibility() {
		return visibility;
	}
	
	public void setVisibility(int visibility) {
		this.visibility = visibility;
	}
	
	public List<Reply> getReplyList() {
		return replyList;
	}
	
	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}
	
	public void setType(int type) {
		this.type =type;
	}
    
	public int getType() {
		return type;
	}
}
