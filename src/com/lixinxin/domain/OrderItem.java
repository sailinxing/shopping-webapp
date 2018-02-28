package com.lixinxin.domain;

public class OrderItem {
//	oidvarchar(50) NOT NULL
//	pidvarchar(50) NOT NULL
	private String ono;
	private String pno;
	
	public String getOno() {
		return ono;
	}

	public void setOno(String ono) {
		this.ono = ono;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	@Override
	public String toString() {
		return "OrderItem [ono=" + ono + ", pno=" + pno + "]";
	}

	public OrderItem() {
		super();
	}
	
}
