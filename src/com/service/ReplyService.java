package com.service;

import com.service.base.DAO;

public interface ReplyService extends DAO {

	public void setVisibleStatu(Integer[] replyids ,boolean statu);
}
