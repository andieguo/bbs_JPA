package com.service.base;

import java.util.LinkedHashMap;

import com.bean.base.QueryResult;

public interface DAO {

	/**
	 * 保存
	 * @param object
	 */
	public void save(Object object);
	/**
	 * 更新
	 * @param object
	 */
	public void update(Object object);
	/**
	 * 删除
	 * @param entityid
	 */
	public <T> void  delete(Class<T> entityClass,Object entityid);
	/**
	 * 删除
	 * @param entityids
	 */
	public <T> void delete(Class<T> entityClass,Object[] entityids);
	/**
	 * 查找
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
