package model;

public class User {

	Integer uid;
	java.lang.String userName;
	java.lang.String headPic;
	java.lang.String schoolClass;//班级
	Integer sex;//性别（男：0   女：1）
	java.lang.String address;
	Integer phone;
	java.lang.String password;
	java.lang.String qusetion;//密码找回的设置问题
	java.lang.String answer;//密码找回设置答案
	java.lang.String message;//密码找回的返回信息
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
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
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public java.lang.String getAddress() {
		return address;
	}
	public void setAddress(java.lang.String address) {
		this.address = address;
	}
	public Integer getPhone() {
		return phone;
	}
	public void setPhone(Integer phone) {
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
