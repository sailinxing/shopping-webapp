package com.lixinxin.service;

import java.sql.SQLException;

import com.lixinxin.dao.UserDao;
import com.lixinxin.domain.User;

public class UserService {
	public User login(String username, String password) {
		UserDao dao=new UserDao();
		User user = dao.login(username,password);
		return user;
	}
	public int register(User user) {
		UserDao dao=new UserDao();		
		int rows = dao.register(user);
		return rows;
	}

	public User findUser(String username) throws SQLException {
		UserDao dao=new UserDao();	
		User user=dao.findUser(username);
		return user;
	}	
}
