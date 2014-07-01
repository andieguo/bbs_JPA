package com.service.base;

import java.util.LinkedHashMap;

import com.bean.base.QueryResult;

public interface DAO {

	/**
	 * ����
	 * @param object
	 */
	public void save(Object object);
	/**
	 * ����
	 * @param object
	 */
	public void update(Object object);
	/**
	 * ɾ��
	 * @param entityid
	 */
	public <T> void  delete(Class<T> entityClass,Object entityid);
	/**
	 * ɾ��
	 * @param entityids
	 */
	public <T> void delete(Class<T> entityClass,Object[] entityids);
	/**
	 * ����
	 * @param entityClass
	 * @param entityid
	 * @return
	 */
	public <T> T find(Class<T> entityClass,Object entityid);
	
	public <T> QueryResult<T> getScrollData(Class<T> entityClass);
	public <T> QueryResult<T> getScrollData(Class<T> entityClass,String wherejpql,Object[] queryParams);
	public <T> QueryResult<T> getScrollData(Class<T> entityClass,int firstindex,int maxresult);
	public <T> QueryResult<T> getScrollData(Class<T> entityClass,int firstindex,int maxresult,String wherejpql,Object[] queryParams);
	public <T> QueryResult<T> getScrollData(Class<T> entityClass,int firstindex,int maxresult,LinkedHashMap<String, String> orderby);
	public <T> QueryResult<T> getScrollData(Class<T> entityClass,int firstindex,int maxresult,
			String wherejpql,Object[] queryParams,LinkedHashMap<String, String> orderby);
}
