package com.bean;

public enum Sex {
	MAN{public String getName(){return "��";}},
	WOMEN{public String getName(){return "Ů";}};
	public abstract String getName();
}
