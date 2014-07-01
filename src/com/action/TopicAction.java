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
	private String query;//查询标记
	private Integer topicid;
	private Integer boardid;
	private Board board;
	private Integer page = 1;//当前页
	/**
	 * 后台管理员调用删除
	 * @return
	 */
	public String delete(){
		topic = topicServiceImpl.find(Topic.class, topicid);
		board = topic.getBoard();//用于传递参数，重定向到"toList";
		topic.setVisible(false);
		topicServiceImpl.update(topic);
		return "toList";
	}
	public String selectTopicUI(){//似乎没有必要
		String jpql = "o.parent is null";//初始时，显示所有的顶级目录；故parent is null
		Object[] params = new Object[0];
		if(boardid!=null&& boardid>0){
			jpql = "o.parent.id=?1";//将其所要单击的id给parant.id 即访问该id下的所有下级目录;
			params = new Object[]{boardid};
			//创建导航
			Board type = boardServiceImpl.find(Board.class,boardid);
			List<Board> types = new ArrayList<Board>();
			types.add(type);//将当前type添加进types
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
	 * 跳转到编辑话题页面
	 * @return
	 */
	public String editUI(){
		if(ActionContext.getContext().getSession().get("admin")!=null){	//后台更新版块的状态
			topic =  topicServiceImpl.find(Topic.class, topicid);//很关键
			return "success";
		}else{
			topic = topicServiceImpl.find(Topic.class, topic.getId());//很关键
			return "edit";
		}
		
	}
	/**
	 * 跳转到发表话题页面
	 * @return
	 */
	public String postUI(){
		board = boardServiceImpl.find(Board.class, board.getId());
		return "topic";
	}
	/**
	 * 浏览话题
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
		if(ActionContext.getContext().getSession().get("admin")==null){//前台显示部分
			jpql = new StringBuffer("o.visible = true");
		}
		jpql.append(" and o.board.id=?"+(params.size()+1));
		params.add(board.getId());
		
		board = boardServiceImpl.find(Board.class, board.getId());//很关键
		
		PageView<Topic> pageView = new PageView<Topic>(8,page);
		int firstindex = (pageView.getCurrentpage()-1)*pageView.getMaxresult();//获取记录的开始索引
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("publishTime", "asc");
		QueryResult<Topic> qr = topicServiceImpl.getScrollData(Topic.class, firstindex, pageView.getMaxresult(), jpql.toString(), params.toArray(), orderby);
		pageView.setQueryResult(qr);
		ActionContext.getContext().put("pageView", pageView);
	
		return "success";
	}
	/**
	 * 编辑话题
	 * @return
	 */
	public String edit(){	
		if(ActionContext.getContext().getSession().get("admin")!=null){	//后台更新版块的状态
			System.out.println("进入后台管理===========");
			Topic tp2 = topicServiceImpl.find(Topic.class, topicid);//很关键
			board = tp2.getBoard();//用于传递参数，重定向到"toList";
			tp2.setVisible(topic.getVisible());
			topicServiceImpl.update(tp2);	
			return "toList";		
		}else {//前台用户更新（前台实现了只对用户自己的版块显示更新按钮）==============================测试
			Topic tp = topicServiceImpl.find(Topic.class, topic.getId());//很关键
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
	 * 发表话题
	 * @return
	 */
	public String post(){
		User user = (User) ActionContext.getContext().getSession().get("user");
		topicServiceImpl.save(new Topic(topic.getTitle(),topic.getContent(),new Board(board.getId()),user));
		return "toListTopics";
	}
	
	public void validatePost() {
		if("".equals(topic.getContent())||null==topic.getContent()){
			addFieldError("topic.content", "话题的内容不能为空");
		}else if(topic.getContent().length()>300){
			addFieldError("topic.content", "话题的内容不能超过300个字符");
		}
		if("".equals(topic.getTitle())||null==topic.getTitle()){
			addFieldError("topic.title", "话题的标题不能为空");
		}else if(topic.getTitle().length()>30){
			addFieldError("topic.title", "话题的标题不能超过30个字符");
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
