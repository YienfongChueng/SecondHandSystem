package model;

import java.util.HashSet;
import java.util.Set;

public class User {

	private java.lang.Integer uid;
	private java.lang.String userName;
	private java.lang.String headPic;
	private java.lang.String schoolClass;//班级
	private java.lang.Integer sex;//性别（男：0   女：1）
	private java.lang.String address;
	private java.lang.Integer phone;
	private java.lang.String password;
	private java.lang.String qusetion;//密码找回的设置问题
	private java.lang.String answer;//密码找回设置答案
	private java.lang.String message;//密码找回的返回信息
	
	public java.lang.Integer getUid() {
		return uid;
	}
	public void setUid(java.lang.Integer uid) {
		this.uid = uid;
	}
	public java.lang.String getUserName() {
		return userName;
	}
	public void setUserName(java.lang.String userName) {
		this.userName = userName;
	}
	public java.lang.String getHeadPic() {
		return headPic;
	}
	public void setHeadPic(java.lang.String headPic) {
		this.headPic = headPic;
	}
	public java.lang.String getSchoolClass() {
		return schoolClass;
	}
	public void setSchoolClass(java.lang.String schoolClass) {
		this.schoolClass = schoolClass;
	}
	public java.lang.Integer getSex() {
		return sex;
	}
	public void setSex(java.lang.Integer sex) {
		this.sex = sex;
	}
	public java.lang.String getAddress() {
		return address;
	}
	public void setAddress(java.lang.String address) {
		this.address = address;
	}
	public java.lang.Integer getPhone() {
		return phone;
	}
	public void setPhone(java.lang.Integer phone) {
		this.phone = phone;
	}
	public java.lang.String getPassword() {
		return password;
	}
	public void setPassword(java.lang.String password) {
		this.password = password;
	}
	public java.lang.String getQusetion() {
		return qusetion;
	}
	public void setQusetion(java.lang.String qusetion) {
		this.qusetion = qusetion;
	}
	public java.lang.String getAnswer() {
		return answer;
	}
	public void setAnswer(java.lang.String answer) {
		this.answer = answer;
	}
	public java.lang.String getMessage() {
		return message;
	}
	public void setMessage(java.lang.String message) {
		this.message = message;
	}
	
	
}
