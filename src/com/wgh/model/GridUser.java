package com.wgh.model;

public class GridUser {
	
	private int id = 0;
    private int userid = 0;
    private int grid = 0;
	private String firstline = "";
	private String secondline = "";
	private String thirdline = "";
	private String fourthline = "";
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getGrid() {
		return grid;
	}
	
	public void setGrid(int grid) {
		this.grid = grid;
	}
	
	public int getUserid() {
		return userid;
	}
	
	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	public String getFirstline() {
		return firstline;
	}
	
	public void setFirstline(String firstline) {
		this.firstline = firstline;
	}
	
	public String getSecondline() {
		return secondline;
	}
	
	public void setSecondline(String secondline) {
		this.secondline = secondline;
	}
	
	public String getThirdline() {
		return thirdline;
	}
	
	public void setThirdline(String thirdline) {
		this.thirdline = thirdline;
	}
	
	public String getFourthline() {
		return fourthline;
	}
	
	public void setFourthline(String fourthline) {
		this.fourthline = fourthline;
	}
}
