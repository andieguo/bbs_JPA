package com.service.impl;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import com.service.ReplyService;
import com.service.base.DaoSupport;

@Service
public class ReplyServiceImpl extends DaoSupport implements ReplyService {

	@Override
	public void setVisibleStatu(Integer[] replyids, boolean statu) {
		if(replyids!=null && replyids.length>0){
			StringBuffer jpql = new StringBuffer();
			for(int i=0;i<replyids.length;i++){
				jpql.append('?').append((i+2)).append(',');
			}
			jpql.deleteCharAt(jpql.length()-1);
			Query query = em.createQuery("update Reply o set o.visible = ?1 where o.id in(" +jpql.toString()+")");
			query.setParameter(1, statu);
			for(int i=0;i<replyids.length;i++){
				query.setParameter(i+2, replyids[i]);
			}
			query.executeUpdate();
		}
	}

}
