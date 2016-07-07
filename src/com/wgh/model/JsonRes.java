package com.wgh.model;

import java.util.List;

public class JsonRes {
	private Boolean success = false;
	private String message = "";
	private Object model = null;
	private List rows = null;
	private int results = 0;
	
	public Boolean getSuccess() {
		return success;
	}
	
	public void setSuccess(Boolean success) {
		this.success = success;
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public Object getModel() {
		return model;
	}
	
	public void setModel(Object model) {
		this.model = model;
	}
	
	public List getRows() {
		return rows;
	}
	
	public void setRows(List rows) {
		this.rows = rows;
	}
	
	public int getResults() {
		return results;
	}
	
	public void setResults(int results) {
		this.results =results;
	}

}
