package com.lixinxin.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.lixinxin.Utils.C3P0Utils;
import com.lixinxin.domain.Order;


public class OrderDao {

	public void addOrder(Order order) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="insert into orders values(?,?,?,?,?)";
		qr.update(sql,order.getOid(),order.getOrdertime(),order.getState(),order.getTotalprice(),order.getUno());
	}

	public List<Order> findOrder(int uid) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from orders where uno=?";
		List<Order> orderList=qr.query(sql, new BeanListHandler<Order>(Order.class),new Integer(uid).toString());
		return orderList;
	}

	public Order findOrder(String oid) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from orders where oid=?";
		Order order=qr.query(sql, new BeanHandler<Order>(Order.class),oid);
		return order;
	}

}
