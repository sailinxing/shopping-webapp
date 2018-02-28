package com.lixinxin.domain;


public class User {
//	uidint(11) NOT NULL
//	usernamevarchar(20) NULL
//	passwordvarchar(20) NULL
//	namevarchar(20) NULL
//	emailvarchar(30) NULL
//	birthday NULL
//	sexvarchar(10) NULL
//	telephonevarchar(30) NULL
//	introducevarchar(100) NULL
//	jobvarchar(30) NULL
//	adrvarchar(30) NULL
	private int uid;
	private String username;
	private String password;
	private String name;
	private String email;
	private String birthday;
	private String sex;
	private String telephone;
	private String introduce;
	private String job;
	private String adr;
	
	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password=" + password + ", name=" + name + ", email="
				+ email + ", birthday=" + birthday + ", sex=" + sex + ", telephone=" + telephone + ", introduce="
				+ introduce + ", job=" + job + ", adr=" + adr + "]";
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getAdr() {
		return adr;
	}

	public void setAdr(String adr) {
		this.adr = adr;
	}

	public User() {
		super();
	}

	
	
}
