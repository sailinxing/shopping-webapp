package com.lixinxin.Utils;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import com.mchange.v2.c3p0.ComboPooledDataSource;


public class C3P0Utils {
	private static ComboPooledDataSource pool=new ComboPooledDataSource();
	private static ThreadLocal<Connection> tl=new ThreadLocal<>();
	public static Connection getConnection(){
		Connection conn=null;
		try {
			conn=pool.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static Connection getCurrentConnection(){
		Connection conn= tl.get();
		if(conn==null){
			tl.set(C3P0Utils.getConnection());
		} 
		conn=tl.get();
		return conn;
	}
	public static DataSource getDataSource(){		
		return pool;
	}
	public static void startTransaction() throws SQLException{
		Connection  conn= C3P0Utils.getCurrentConnection();		
		conn.setAutoCommit(false);
	}
	public static void commit() throws SQLException{
		Connection  conn=C3P0Utils.getCurrentConnection();
		conn.commit();
	}
	public static void rollback() throws SQLException{
		Connection  conn=C3P0Utils.getCurrentConnection();
		conn.rollback();
	}
}
