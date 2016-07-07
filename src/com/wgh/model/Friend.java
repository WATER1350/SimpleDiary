package com.wgh.model;

public class Friend {
	private int userid = 0;// 用户ID
    private int friendid = 0; //朋友ID
    
    public void setUserid(int userid) {
    	this.userid = userid;
    }
    
    public int getUserid() {
    	return userid;
    }
    
    public void setFriendid(int friendid) {
    	this.friendid = friendid;
    }
    
    public int getFriend() {
    	return friendid;
    }
}
