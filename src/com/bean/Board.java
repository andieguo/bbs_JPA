package com.bean;

import java.util.ArrayList;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Board{
	/**°æ¿éid*/
	private Integer id;
	/**°æ¿éÃû³Æ*/
	private String name;
	/**°æ¿éËµÃ÷*/
	private String info;
	private boolean visible = true;
	private Date createdate = new Date();
	private List<Board> childboards = new ArrayList<Board>();
	private Board parent;
	private Set<Topic> topics = new HashSet<Topic>();
	private Admin admin;
	
	public Board(Integer id) {
		super();
		this.id = id;
	}
	public Board(String name) {
		super();
		this.name = name;
	}
	public Board() {
		super();
	}
	@OneToMany(cascade={CascadeType.REFRESH,CascadeType.REMOVE},mappedBy="board")
	public Set<Topic> getTopics() {
		return topics;
	}
	
	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}
	@Id @GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(length=20,nullable=false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(nullable=false)
	public boolean isVisible() {
		return visible;
	}
	public void setVisible(boolean visible) {
		this.visible = visible;
	}
	@Column(nullable=false)
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="parentid")
	public Board getParent() {
		return parent;
	}
	public void setParent(Board parent) {
		this.parent = parent;
	}
	@OneToMany(cascade={CascadeType.REMOVE,CascadeType.REMOVE},mappedBy="parent")
	public List<Board> getChildboards() {
		return childboards;
	}
	public void setChildboards(List<Board> childboards) {
		this.childboards = childboards;
	}
	@ManyToOne(cascade=CascadeType.REFRESH,optional=false)
	@JoinColumn(name="adminid")
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	@Column(length=100)
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	
}
