package com.lixinxin.service;

import java.sql.SQLException;
import java.util.List;

import com.lixinxin.dao.OrderItemDao;
import com.lixinxin.domain.OrderItem;

public class OrderItemService {

	public void addOrderitem(OrderItem orderItem) throws SQLException {
		OrderItemDao dao=new OrderItemDao();
		dao.addOrderitem(orderItem);
	}

	public List<OrderItem> findOrderItem(String oid) throws SQLException {
		OrderItemDao dao=new OrderItemDao();
		List<OrderItem> orderItemList=dao.findOrderItem(oid);
		return orderItemList;
	}

}
