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
	private Integer replyid ;//��̨��ʾ������ϸ��ϢʱҪ��
	private Integer[] replyids;
	private String content;//��ѯ������
	private Reply reply;
	private User user;
	private Topic topic;
	private Integer page = 1;
	private String query;//��ѯ���

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
			
			if("visible".equals(query)){// ��̨������,��ѯ���е����ӣ���ʾ������ʾ�ģ�
				jpql.append(" and o.visible= true and o.topic.id in ( select p.id from Topic p where p.visible = true and p.board.id in ( select b.id from Board b where b.visible = true )))");
			}else{// ��̨������,��ѯ���е����ӣ�ȫ����ʾ�ģ�
				jpql.append(" and o.topic.id in ( select p.id from Topic p where p.board.id in ( select b.id from Board b )))");
			}
		} else {
			jpql = new StringBuffer("o.visible=?"+(params.size()+1));
			params = new ArrayList<Object>();
			params.add(true);
			jpql.append(" and o.topic.id=?" + (params.size() + 1));
			params.add(topic.getId());
			// ֮ǰtopic����ֻ������һ��id���ԣ��ʵ���topicServiceImpl�õ�topicʵ��	
			// ActionContext.getContext().put("topic",
			// topic);//������ʡ�ԣ���Ϊ��getTopic()���� jspҳ����Ե���getTopic()�������topicʵ��
			
		}
		PageView<Reply> pageView = new PageView<Reply>(8, page);
		int firstindex = (pageView.getCurrentpage() - 1)
				* pageView.getMaxresult();// ��ȡ��¼�Ŀ�ʼ����
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
	 * ����ɾ��
	 * @return
	 */
	public String delete(){
		//replyServiceImpl.delete(Reply.class, replyid);//����ɾ��
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
			addFieldError("reply.content", "���ӵ����ݲ���Ϊ��");
		}else if(reply.getContent().length()>300){
			addFieldError("reply.content", "���ӵ����ݲ��ܳ���300���ַ�");
		}
		if("".equals(reply.getTitle())||null==reply.getTitle()){
			addFieldError("reply.title", "���ӱ��ⲻ��Ϊ��");
		}else if(reply.getTitle().length()>30){
			addFieldError("reply.title", "����ı��ⲻ�ܳ���30���ַ�");
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
