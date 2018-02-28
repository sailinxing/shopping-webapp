package com.lixinxin.service;

import java.sql.SQLException;
import java.util.List;

import com.lixinxin.dao.CarDao;
import com.lixinxin.domain.Car;



public class CarService {


	public List<Car> findCarByOid(String oid) throws SQLException {
		 CarDao dao=new  CarDao();
		 List<Car> carList=dao.findCarByOid(oid);
		return carList;
	}

}
