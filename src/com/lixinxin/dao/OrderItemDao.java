package com.lixinxin.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.lixinxin.Utils.C3P0Utils;
import com.lixinxin.domain.OrderItem;

public class OrderItemDao {

	public void addOrderitem(OrderItem orderItem) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="insert into orderitem values(?,?)";
		qr.update(sql,orderItem.getOno(),orderItem.getPno());
		
	}

	public List<OrderItem> findOrderItem(String oid) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from orderitem where ono=?";
		List<OrderItem> orderItemList=qr.query(sql,new BeanListHandler<OrderItem>(OrderItem.class),oid);	
		return orderItemList;
	}

}
