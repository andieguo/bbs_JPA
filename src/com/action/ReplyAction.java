package com.action;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.bean.Reply;
import com.bean.Topic;
import com.bean.User;
import com.bean.base.PageView;
import com.bean.base.QueryResult;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.ReplyService;
import com.service.TopicService;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class ReplyAction extends ActionSupport {
	@Resource
	private ReplyService replyServiceImpl;
	@Resource
	private TopicService topicServiceImpl;
	private Integer replyid ;//后台显示帖子详细信息时要用
	private Integer[] replyids;
	private String content;//查询的内容
	private Reply reply;
	private User user;
	private Topic topic;
	private Integer page = 1;
	private String query;//查询标记

	public String list() throws Exception {
		StringBuffer jpql = new StringBuffer("1=?1");
		List<Object> params = new ArrayList<Object>();
		params.add(1);

		if("true".equals(query)){
			content = URLEncoder.encode(reply.getContent(), "GBK");
			if(reply.getContent()!=null && !"".equals(reply.getContent().trim())){
				jpql.append(" and o.content like ?"+(params.size()+1));
				params.add("%" +reply.getContent()+"%");	
			}
		}
		if (ActionContext.getContext().getSession().get("admin") != null) {
			
			if("visible".equals(query)){// 后台管理部分,查询所有的帖子（显示正常显示的）
				jpql.append(" and o.visible= true and o.topic.id in ( select p.id from Topic p where p.visible = true and p.board.id in ( select b.id from Board b where b.visible = true )))");
			}else{// 后台管理部分,查询所有的帖子（全部显示的）
				jpql.append(" and o.topic.id in ( select p.id from Topic p where p.board.id in ( select b.id from Board b )))");
			}
		} else {
			jpql = new StringBuffer("o.visible=?"+(params.size()+1));
			params = new ArrayList<Object>();
			params.add(true);
			jpql.append(" and o.topic.id=?" + (params.size() + 1));
			params.add(topic.getId());
			// 之前topic对象只接受了一个id属性，故调用topicServiceImpl得到topic实体	
			// ActionContext.getContext().put("topic",
			// topic);//这句可以省略，因为有getTopic()方法 jsp页面可以调用getTopic()方法获得topic实例
			
		}
		PageView<Reply> pageView = new PageView<Reply>(8, page);
		int firstindex = (pageView.getCurrentpage() - 1)
				* pageView.getMaxresult();// 获取记录的开始索引
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("publishTime", "asc");
		QueryResult<Reply> qr = replyServiceImpl.getScrollData(Reply.class,
				firstindex, pageView.getMaxresult(), jpql.toString(),
				params.toArray(), orderby);
		pageView.setQueryResult(qr);
		ActionContext.getContext().put("pageView", pageView);
		if(topic!=null){
			topic = topicServiceImpl.find(Topic.class, topic.getId());
		}
		return "success";
	}
	/**
	 * 批量删除
	 * @return
	 */
	public String delete(){
		//replyServiceImpl.delete(Reply.class, replyid);//物理删除
		replyServiceImpl.setVisibleStatu(replyids, false);
		return "toList";
	}
	
	public String detailUI(){
		reply = replyServiceImpl.find(Reply.class, replyid);
		return "success";
	}
	
	public String postUI() {
		topic = topicServiceImpl.find(Topic.class, topic.getId());
		return "post";
	}

	public String post() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		replyServiceImpl.save(new Reply(reply.getTitle(), reply.getContent(),
				user, new Topic(topic.getId())));
		return "toListReplys";
	}

	
	public void validatePost() {
		if("".equals(reply.getContent())||null==reply.getContent()){
			addFieldError("reply.content", "帖子的内容不能为空");
		}else if(reply.getContent().length()>300){
			addFieldError("reply.content", "帖子的内容不能超过300个字符");
		}
		if("".equals(reply.getTitle())||null==reply.getTitle()){
			addFieldError("reply.title", "帖子标题不能为空");
		}else if(reply.getTitle().length()>30){
			addFieldError("reply.title", "话题的标题不能超过30个字符");
		}
	}
	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getReplyid() {
		return replyid;
	}

	public void setReplyid(Integer replyid) {
		this.replyid = replyid;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public Integer[] getReplyids() {
		return replyids;
	}

	public void setReplyids(Integer[] replyids) {
		this.replyids = replyids;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
