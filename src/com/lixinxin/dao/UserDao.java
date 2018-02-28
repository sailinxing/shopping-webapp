package com.lixinxin.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.lixinxin.Utils.C3P0Utils;
import com.lixinxin.domain.User;

public class UserDao {
	public User login(String username, String password) {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from user where username=? and password=?";
		User user = null;
		try {
			user = qr.query(sql, new BeanHandler<User>(User.class), username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	public int register(User user) {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="insert into user(username,password,name,email,birthday,sex,telephone,introduce,job,adr) values(?,?,?,?,?,?,?,?,?,?)";
		int rows = 0;
		try {
			rows = qr.update(sql,user.getUsername(),user.getPassword(),user.getName(),user.getEmail(),
					user.getBirthday(),user.getSex(),user.getTelephone(),user.getIntroduce(),user.getJob(),user.getAdr());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rows;
	}

	public User findUser(String username) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from user where username=?";
		User user = qr.query(sql,new BeanHandler<User>(User.class),username);
		return user;
	}
}
