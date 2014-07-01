package com.action;

import java.util.ArrayList;


import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.bean.Admin;
import com.bean.Board;

import com.bean.base.PageView;
import com.bean.base.QueryResult;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.BoardService;


@SuppressWarnings("serial")
@Controller @Scope("prototype")
public class BoardAction extends ActionSupport {
	@Resource private BoardService boardServiceImpl;
	private Board board;
	private Integer parentid;//后台用到
	private Integer boardid;//后台用到
	private Integer page = 1;
	public String list(){
		StringBuffer jpql = new StringBuffer("o.visible=?1");
		List<Object> params = new ArrayList<Object>();
		params.add(true);
		if(board!=null){
			if(board.getId()!= null&&board.getId()>0 ){
				jpql.append(" and o.parent.id=?"+(params.size()+1));
				params.add(board.getId());
			}
		}else{
			jpql.append(" and o.parent is null");
		}
		PageView<Board> pageView = new PageView<Board>(12,page);
		int firstindex = (pageView.getCurrentpage()-1)*pageView.getMaxresult();//获取记录的开始索引
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("createdate", "asc");//只能够对broad.parent为null的版块进行排序
		QueryResult<Board> qr = boardServiceImpl.getScrollData(Board.class, firstindex, pageView.getMaxresult(), jpql.toString(), params.toArray(), orderby);
		pageView.setQueryResult(qr);
		ActionContext.getContext().put("pageView", pageView);	
		return "success";
	}
	/**
	 * 后台：跳转到修改页面（装载数据）
	 * @return
	 */
	public String editUI(){
		board = boardServiceImpl.find(Board.class, boardid);
		return "success";
	}
	/**
	 * 后台：跳转到添加页面
	 * @return
	 */
	public String addUI(){
		return "success";
	}
	/**
	 * 后台编辑
	 * @return
	 */
	public String edit(){
		Board bd = boardServiceImpl.find(Board.class, boardid);
		board.setId(boardid);
		board.setAdmin(bd.getAdmin());
		board.setParent(bd.getParent());
		boardServiceImpl.update(board);
		return "toListBoards";//		添加成功后转发到list页面
	}
	/**
	 * 后台添加
	 * @return
	 */
	public String add(){
		if(parentid != null &&  parentid > 0){
			board.setParent(new Board(parentid));
		}
		board.setCreatedate(new Date());
		board.setAdmin(new Admin(1));
		boardServiceImpl.save(board);
		return "toListBoards";//		添加成功后转发到list页面	
	}
	
	public void validateAdd() {
		if("".equals(board.getName())||null==board.getName()){
			addFieldError("board.name", "版块名称不能为空");
		}else if(board.getName().length()>20){
			addFieldError("board.name", "版块名称不能超过10个字符");
		}
		if("".equals(board.getInfo())||null==board.getInfo()){
			addFieldError("board.info", "版块简介不能为空");
		}else if(board.getInfo().length()<2||board.getInfo().length()>100){
			addFieldError("board.info", "版块简介不能少于2个字符并且超过10个字符");
		}
	}
	public void validateEdit() {
		if("".equals(board.getName())||null==board.getName()){
			addFieldError("board.name", "版块名称不能为空");
		}else if(board.getName().length()>20){
			addFieldError("board.name", "版块名称不能超过10个字符");
		}
		if("".equals(board.getInfo())||null==board.getInfo()){
			addFieldError("board.info", "版块简介不能为空");
		}else if(board.getInfo().length()<2||board.getInfo().length()>100){
			addFieldError("board.info", "版块简介不能少于2个字符并且超过10个字符");
		}
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
	public Integer getParentid() {
		return parentid;
	}
	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}
	public Integer getBoardid() {
		return boardid;
	}
	public void setBoardid(Integer boardid) {
		this.boardid = boardid;
	}
}
