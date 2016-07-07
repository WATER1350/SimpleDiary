package com.wgh.model;

public class Music {
	
    private int id = 0;
    private int userid = 0;
    private String musicname = "";
    private int auto = 1;
    
    public int getAuto() {
    	return auto;
    }
    
    public void setAuto(int auto) {
    	this.auto = auto;
    }
    
    public  int getId() {
    	return id;
    }
    
    public void setId(int id) {
    	this.id = id;
    }
    
    public int getUserid() {
    	return userid;
    }
    
    public void setUserid(int userid) {
    	this.userid = userid;
    }
    
    public String getMusicname() {
    	return musicname;
    }
    
    public void setMusicname(String musicname) {
    	this.musicname = musicname;
    }

}
