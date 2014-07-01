package com.bean;

public enum Sex {
	MAN{public String getName(){return "ÄÐ";}},
	WOMEN{public String getName(){return "Å®";}};
	public abstract String getName();
}
