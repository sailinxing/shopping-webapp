package com.lixinxin.domain;

import java.util.Date;

public class Order implements Comparable<Order> {
	// oidvarchar(50) NOT NULL
	// ordertimedatetime NULL
	// statevarchar(20) NULL
	// totalpricedouble NULL
	// uidint(11) NOT NULL

	private String oid;
	private Date ordertime;
	private String state;
	private double totalprice;
	private int uno;

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public Date getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public double getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}	

	@Override
	public String toString() {
		return "Order [oid=" + oid + ", ordertime=" + ordertime + ", state=" + state + ", totalprice=" + totalprice
				+ ", uno=" + uno + "]";
	}

	@Override
	public int compareTo(Order o) {
		if (o instanceof Order) {
			Order obj = (Order) o;
			int num = this.ordertime.compareTo(obj.ordertime);
			if(num==0){
				num=new Double(this.totalprice).compareTo(new Double(obj.totalprice));
			}
			return num;
		}
		return 0;
	}
}
