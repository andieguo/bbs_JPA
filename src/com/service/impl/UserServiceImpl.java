package com.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import com.bean.User;
import com.service.UserService;
import com.service.base.DaoSupport;

@Service
public class UserServiceImpl extends DaoSupport implements UserService {
	
	@SuppressWarnings("unchecked")
	public User login(String name,String pass){
		
			List<User> users = null;
			try {
				Query query = em.createQuery("select o from User o where o.name = ?0 and o.pass = ?1");
				query.setParameter(0, name);
				query.setParameter(1, pass);
				users = query.getResultList();
				//System.out.println(users.size());//≤‚ ‘”√¿˝
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(users.size()!=0){
				return users.get(0);		
			}
			else{
				return null;
			}
			
	}
}
