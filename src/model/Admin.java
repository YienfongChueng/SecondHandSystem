package model;

public class Admin {

	private Integer aid;
	private java.lang.String name;
	private java.lang.String password;
	private java.lang.Integer role;//角色，0超级管理员  1系统管理员
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public java.lang.String getName() {
		return name;
	}
	public void setName(java.lang.String name) {
		this.name = name;
	}
	public java.lang.String getPassword() {
		return password;
	}
	public void setPassword(java.lang.String password) {
		this.password = password;
	}
	public java.lang.Integer getRole() {
		return role;
	}
	public void setRole(java.lang.Integer role) {
		this.role = role;
	}
	
	
}
