package com.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User{
	private int id;
	private String name;
	private String pass;
	private String headname;
	private Date regTime = new Date();
	private Sex gender = Sex.MAN;
	private Boolean visible = true;
	
	
	public User(String name, String pass) {
		super();
		this.name = name;
		this.pass = pass;
	}
	public User(String name, String pass, String headname) {
		super();
		this.name = name;
		this.pass = pass;
		this.headname = headname;
	}
	public User() {
		super();
	}
	public User(int id) {
		super();
		this.id = id;
	}
	@Id @GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(nullable=false , length=20)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(nullable=false ,length=20)
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	@Column(length=20)
	public String getHeadname() {
		return headname;
	}
	public void setHeadname(String headname) {
		this.headname = headname;
	}
	@Column(nullable=false)
	public Date getRegTime() {
		return regTime;
	}
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
	@Enumerated(EnumType.STRING) @Column(length=5,nullable=false)
	public Sex getGender() {
		return gender;
	}
	public void setGender(Sex gender) {
		this.gender = gender;
	}
	@Column(nullable=false,length=5)
	public Boolean getVisible() {
		return visible;
	}
	public void setVisible(Boolean visible) {
		this.visible = visible;
	}

	
	
}
