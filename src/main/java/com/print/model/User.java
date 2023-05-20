package com.print.model;

public class User {

	String email;
	String password;
	String name;
	String degree;
	String branch;
	String phone;
	
	
	public User(String email, String password, String name, String degree, String branch, String phone) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.degree = degree;
		this.branch = branch;
		this.phone = phone;
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
	
}
