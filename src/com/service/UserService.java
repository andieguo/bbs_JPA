package com.service;

import com.bean.User;
import com.service.base.DAO;

public interface UserService extends DAO {
	public User login(String name,String pass);
}
