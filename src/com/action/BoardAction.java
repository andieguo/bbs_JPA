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
	private Integer parentid;//��̨�õ�
	private Integer boardid;//��̨�õ�
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
		int firstindex = (pageView.getCurrentpage()-1)*pageView.getMaxresult();//��ȡ��¼�Ŀ�ʼ����
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("createdate", "asc");//ֻ�ܹ���broad.parentΪnull�İ���������
		QueryResult<Board> qr = boardServiceImpl.getScrollData(Board.class, firstindex, pageView.getMaxresult(), jpql.toString(), params.toArray(), orderby);
		pageView.setQueryResult(qr);
		ActionContext.getContext().put("pageView", pageView);	
		return "success";
	}
	/**
	 * ��̨����ת���޸�ҳ�棨װ�����ݣ�
	 * @return
	 */
	public String editUI(){
		board = boardServiceImpl.find(Board.class, boardid);
		return "success";
	}
	/**
	 * ��̨����ת�����ҳ��
	 * @return
	 */
	public String addUI(){
		return "success";
	}
	/**
	 * ��̨�༭
	 * @return
	 */
	public String edit(){
		Board bd = boardServiceImpl.find(Board.class, boardid);
		board.setId(boardid);
		board.setAdmin(bd.getAdmin());
		board.setParent(bd.getParent());
		boardServiceImpl.update(board);
		return "toListBoards";//		��ӳɹ���ת����listҳ��
	}
	/**
	 * ��̨���
	 * @return
	 */
	public String add(){
		if(parentid != null &&  parentid > 0){
			board.setParent(new Board(parentid));
		}
		board.setCreatedate(new Date());
		board.setAdmin(new Admin(1));
		boardServiceImpl.save(board);
		return "toListBoards";//		��ӳɹ���ת����listҳ��	
	}
	
	public void validateAdd() {
		if("".equals(board.getName())||null==board.getName()){
			addFieldError("board.name", "������Ʋ���Ϊ��");
		}else if(board.getName().length()>20){
			addFieldError("board.name", "������Ʋ��ܳ���10���ַ�");
		}
		if("".equals(board.getInfo())||null==board.getInfo()){
			addFieldError("board.info", "����鲻��Ϊ��");
		}else if(board.getInfo().length()<2||board.getInfo().length()>100){
			addFieldError("board.info", "����鲻������2���ַ����ҳ���10���ַ�");
		}
	}
	public void validateEdit() {
		if("".equals(board.getName())||null==board.getName()){
			addFieldError("board.name", "������Ʋ���Ϊ��");
		}else if(board.getName().length()>20){
			addFieldError("board.name", "������Ʋ��ܳ���10���ַ�");
		}
		if("".equals(board.getInfo())||null==board.getInfo()){
			addFieldError("board.info", "����鲻��Ϊ��");
		}else if(board.getInfo().length()<2||board.getInfo().length()>100){
			addFieldError("board.info", "����鲻������2���ַ����ҳ���10���ַ�");
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
