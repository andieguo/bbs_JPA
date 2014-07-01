package com.service.impl;

import java.util.List;
import javax.persistence.Query;

import org.springframework.stereotype.Service;

import com.bean.Admin;
import com.service.AdminService;
import com.service.base.DaoSupport;

@Service
public class AdminServiceImpl extends DaoSupport implements AdminService {
	public Admin login(String name,String pass){
		
		List<Admin> admins = null;
		try {
			Query query = em.createQuery("select o from Admin o where o.name = ?0 and o.password = ?1");
			query.setParameter(0, name);
			query.setParameter(1, pass);
			admins = query.getResultList();
			//System.out.println(users.size());//≤‚ ‘”√¿˝
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(admins.size()!=0){
			return admins.get(0);		
		}
		else{
			return null;
		}
		
}
}
