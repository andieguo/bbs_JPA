package com.service;

import com.bean.Admin;
import com.service.base.DAO;

public interface AdminService extends DAO{

	public Admin login(String name,String pass);
}
