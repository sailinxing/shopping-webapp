package com.lixinxin.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.lixinxin.Utils.C3P0Utils;
import com.lixinxin.domain.Car;

public class CarDao {	
	public List<Car> findCarByOid(String oid) throws SQLException {
		QueryRunner qr=new QueryRunner(C3P0Utils.getDataSource());
		String sql="select uid,name,adr,oid,ordertime,totalprice,pid,pname,shop_price,pimage,is_hot,cid from user,orders,orderitem,product where uid=uno and oid=ono and pno=pid and oid=?";
		List<Car> carList = qr.query(sql, new BeanListHandler<Car>(Car.class),oid);
		return carList;
	}
}
