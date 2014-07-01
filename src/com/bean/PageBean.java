package com.bean;

public class PageBean {
	private String query;
	private int page;
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public int getPage() {
		return page<1? 1 : page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
}
