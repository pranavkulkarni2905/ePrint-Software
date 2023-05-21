package com.print.model;

public class User {

	int id;
	String email;
	String password;
	String name;
	String degree;
	String branch;
	String phone;
	String verified;
	String registration_timestamp;
	String logout_time;
	String loginStatus;
	
	public User(String email, String password, String name, String degree, String branch, String phone) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.degree = degree;
		this.branch = branch;
		this.phone = phone;
	}
	
	public User(int id,String email, String password, String name, String degree, String branch, String phone, String verified,
			String registration_timestamp, String logout_time,String loginStatus) {
		super();
		this.id=id;
		this.email = email;
		this.password = password;
		this.name = name;
		this.degree = degree;
		this.branch = branch;
		this.phone = phone;
		this.verified = verified;
		this.registration_timestamp = registration_timestamp;
		this.logout_time = logout_time;
		this.loginStatus=loginStatus;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getVerified() {
		return verified;
	}

	public void setVerified(String verified) {
		this.verified = verified;
	}

	public String getRegistration_timestamp() {
		return registration_timestamp;
	}

	public void setRegistration_timestamp(String registration_timestamp) {
		this.registration_timestamp = registration_timestamp;
	}

	public String getLogout_time() {
		return logout_time;
	}

	public void setLogout_time(String logout_time) {
		this.logout_time = logout_time;
	}

	public String getLoginStatus() {
		return loginStatus;
	}

	public void setLoginStatus(String loginStatus) {
		this.loginStatus = loginStatus;
	}
	
	
	
}
