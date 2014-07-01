package com.action;

import java.util.ArrayList;



import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.bean.Board;
import com.bean.Topic;
import com.bean.User;
import com.bean.base.PageView;
import com.bean.base.QueryResult;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.BoardService;
import com.service.TopicService;

@SuppressWarnings("serial")
@Controller @Scope("prototype")
public class TopicAction extends ActionSupport {
	@Resource private TopicService topicServiceImpl;	
	@Resource private BoardService boardServiceImpl;
	private Topic topic;
	private String query;//��ѯ���
	private Integer topicid;
	private Integer boardid;
	private Board board;
	private Integer page = 1;//��ǰҳ
	/**
	 * ��̨����Ա����ɾ��
	 * @return
	 */
	public String delete(){
		topic = topicServiceImpl.find(Topic.class, topicid);
		board = topic.getBoard();//���ڴ��ݲ������ض���"toList";
		topic.setVisible(false);
		topicServiceImpl.update(topic);
		return "toList";
	}
	public String selectTopicUI(){//�ƺ�û�б�Ҫ
		String jpql = "o.parent is null";//��ʼʱ����ʾ���еĶ���Ŀ¼����parent is null
		Object[] params = new Object[0];
		if(boardid!=null&& boardid>0){
			jpql = "o.parent.id=?1";//������Ҫ������id��parant.id �����ʸ�id�µ������¼�Ŀ¼;
			params = new Object[]{boardid};
			//��������
			Board type = boardServiceImpl.find(Board.class,boardid);
			List<Board> types = new ArrayList<Board>();
			types.add(type);//����ǰtype��ӽ�types
			while(type.getParent()!=null){
				types.add(type.getParent());
				type=type.getParent();
			}
			Board[] values = new Board[types.size()];
			for(int i = types.size()-1;i>=0;i--){
				values[types.size()-i-1]= types.get(i);
			}
			ActionContext.getContext().put("menuboards", values);
			
		}
		ActionContext.getContext().put("boards",boardServiceImpl.getScrollData(Board.class, -1, -1, jpql, params).getResultlist());
		return "selsectTopic";
	}
	public String queryUI(){
		return "success";
	}
	/**
	 * ��ת���༭����ҳ��
	 * @return
	 */
	public String editUI(){
		if(ActionContext.getContext().getSession().get("admin")!=null){	//��̨���°���״̬
			topic =  topicServiceImpl.find(Topic.class, topicid);//�ܹؼ�
			return "success";
		}else{
			topic = topicServiceImpl.find(Topic.class, topic.getId());//�ܹؼ�
			return "edit";
		}
		
	}
	/**
	 * ��ת��������ҳ��
	 * @return
	 */
	public String postUI(){
		board = boardServiceImpl.find(Board.class, board.getId());
		return "topic";
	}
	/**
	 * �������
	 * @return
	 */
	public String list(){
		StringBuffer jpql = new StringBuffer("1=?1");
		List<Object> params = new ArrayList<Object>();
		params.add(1);
		if("true".equals(query)){
			if(topic.getTitle()!=null && !"".equals(topic.getTitle().trim())){
				jpql.append(" and o.title like ?"+(params.size()+1));
				System.out.println(topic.getTitle());
				params.add("%" +topic.getTitle()+"%");	
			}
		}
		if(ActionContext.getContext().getSession().get("admin")==null){//ǰ̨��ʾ����
			jpql = new StringBuffer("o.visible = true");
		}
		jpql.append(" and o.board.id=?"+(params.size()+1));
		params.add(board.getId());
		
		board = boardServiceImpl.find(Board.class, board.getId());//�ܹؼ�
		
		PageView<Topic> pageView = new PageView<Topic>(8,page);
		int firstindex = (pageView.getCurrentpage()-1)*pageView.getMaxresult();//��ȡ��¼�Ŀ�ʼ����
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("publishTime", "asc");
		QueryResult<Topic> qr = topicServiceImpl.getScrollData(Topic.class, firstindex, pageView.getMaxresult(), jpql.toString(), params.toArray(), orderby);
		pageView.setQueryResult(qr);
		ActionContext.getContext().put("pageView", pageView);
	
		return "success";
	}
	/**
	 * �༭����
	 * @return
	 */
	public String edit(){	
		if(ActionContext.getContext().getSession().get("admin")!=null){	//��̨���°���״̬
			System.out.println("�����̨����===========");
			Topic tp2 = topicServiceImpl.find(Topic.class, topicid);//�ܹؼ�
			board = tp2.getBoard();//���ڴ��ݲ������ض���"toList";
			tp2.setVisible(topic.getVisible());
			topicServiceImpl.update(tp2);	
			return "toList";		
		}else {//ǰ̨�û����£�ǰ̨ʵ����ֻ���û��Լ��İ����ʾ���°�ť��==============================����
			Topic tp = topicServiceImpl.find(Topic.class, topic.getId());//�ܹؼ�
			board = tp.getBoard();
			User user = tp.getUser();
			topic.setTitle(topic.getTitle());
			topic.setContent(topic.getContent());
			topic.setUser(user);
			topic.setBoard(board);
			topicServiceImpl.update(topic);	
			return "toListTopics";	
		}
	}
	/**
	 * ������
	 * @return
	 */
	public String post(){
		User user = (User) ActionContext.getContext().getSession().get("user");
		topicServiceImpl.save(new Topic(topic.getTitle(),topic.getContent(),new Board(board.getId()),user));
		return "toListTopics";
	}
	
	public void validatePost() {
		if("".equals(topic.getContent())||null==topic.getContent()){
			addFieldError("topic.content", "��������ݲ���Ϊ��");
		}else if(topic.getContent().length()>300){
			addFieldError("topic.content", "��������ݲ��ܳ���300���ַ�");
		}
		if("".equals(topic.getTitle())||null==topic.getTitle()){
			addFieldError("topic.title", "����ı��ⲻ��Ϊ��");
		}else if(topic.getTitle().length()>30){
			addFieldError("topic.title", "����ı��ⲻ�ܳ���30���ַ�");
		}
	}
	
	public Topic getTopic() {
		return topic;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	public Board getBoard() {
		return board;
	}
	public void setBoard(Board board) {
		this.board = board;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getTopicid() {
		return topicid;
	}
	public void setTopicid(Integer topicid) {
		this.topicid = topicid;
	}
	public Integer getBoardid() {
		return boardid;
	}
	public void setBoardid(Integer boardid) {
		this.boardid = boardid;
	}
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
}
