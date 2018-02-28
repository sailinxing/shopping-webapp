package com.lixinxin.service;

import java.sql.SQLException;
import java.util.List;

import com.lixinxin.dao.OrderDao;
import com.lixinxin.domain.Order;

public class OrderService {

	public void addOrder(Order order) throws SQLException {
		OrderDao dao=new OrderDao();
		dao.addOrder(order);
	}

	public List<Order> findOrder(int uid) throws SQLException {
		OrderDao dao=new OrderDao();
		List<Order> orderList=dao.findOrder(uid);
		return orderList;
	}

	public Order findOrder(String oid) throws SQLException {
		OrderDao dao=new OrderDao();
		Order order=dao.findOrder(oid);
		return order;
	}

}
