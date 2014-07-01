package com.bean;

import java.util.Date;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
@Entity
public class Reply  {

	private int id;
	private String title = "Ä¬ÈÏ±êÌâ";
	private String content;
	private Boolean visible = true;
	private Date publishTime = new Date();
	private Date modifyTime  = new Date();
	private User user;
	private Topic topic;
	
	public Reply(String title, String content, User user, Topic topic) {
		super();
		this.title = title;
		this.content = content;
		this.user = user;
		this.topic = topic;
	}
	public Reply() {
		super();
	}
	@Id @GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(nullable=false,length=30)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column(nullable=false,length=300)
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Column(nullable=false)
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	@Column(nullable=false)
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	@ManyToOne(cascade=CascadeType.REFRESH,optional=false)
	@JoinColumn(name="userid")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@ManyToOne(cascade=CascadeType.REFRESH,optional=false)
	@JoinColumn(name="topicid")
	public Topic getTopic() {
		return topic;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	@Column(nullable=false)
	public Boolean getVisible() {
		return visible;
	}
	public void setVisible(Boolean visible) {
		this.visible = visible;
	}
	@Override
	public String toString() {
		return "Reply [id=" + id + ", title=" + title + ", content=" + content
				+ ", visible=" + visible + ", publishTime=" + publishTime
				+ ", modifyTime=" + modifyTime + ", user=" + user + ", topic="
				+ topic + "]";
	}
}
