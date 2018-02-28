package com.lixinxin.domain;

import java.util.Date;

public class Car {
	private int uid;
	private String name;
	private String adr;
	private String oid;
	private Date ordertime;
	private double totalprice;
	private String pid;
	private String pname;
	private double shop_price;
	private String pimage;
	private int is_hot;
	private String cid;
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAdr() {
		return adr;
	}
	public void setAdr(String adr) {
		this.adr = adr;
	}
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
	public double getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public double getShop_price() {
		return shop_price;
	}
	public void setShop_price(double shop_price) {
		this.shop_price = shop_price;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public int getIs_hot() {
		return is_hot;
	}
	public void setIs_hot(int is_hot) {
		this.is_hot = is_hot;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public Car() {
		super();
	}
	@Override
	public String toString() {
		return "Car [uid=" + uid + ", name=" + name + ", adr=" + adr + ", oid=" + oid + ", ordertime=" + ordertime
				+ ", totalprice=" + totalprice + ", pid=" + pid + ", pname=" + pname + ", shop_price=" + shop_price
				+ ", pimage=" + pimage + ", is_hot=" + is_hot + ", cid=" + cid + "]";
	}
	
	
}
