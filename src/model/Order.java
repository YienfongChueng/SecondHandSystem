package model;

import java.util.Date;

public class Order {

	Integer id;
	Integer productId;//商品id
	Date buyTime;//购买时间
	Integer buyNum;//购买数量
	Integer status;//订单状态（0：待付款 1：待发货 2：待收货）
	java.lang.String receiver;//收件人名称
	java.lang.String address;//送货地址
	java.lang.String payWay;//支付方式
	java.lang.String sendWay;//送货方式
	Double totalPrice;//总价
	java.lang.String orderNum;//订单号
	java.lang.String comment;//简单留言
	Integer phone;//联系电话
	java.lang.String email;//邮件
	Integer creatorId;//商品发布者id
	Integer buyUserId;//购买用户id
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Date getBuyTime() {
		return buyTime;
	}
	public void setBuyTime(Date buyTime) {
		this.buyTime = buyTime;
	}
	public Integer getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(Integer buyNum) {
		this.buyNum = buyNum;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public java.lang.String getReceiver() {
		return receiver;
	}
	public void setReceiver(java.lang.String receiver) {
		this.receiver = receiver;
	}
	public java.lang.String getAddress() {
		return address;
	}
	public void setAddress(java.lang.String address) {
		this.address = address;
	}
	public java.lang.String getPayWay() {
		return payWay;
	}
	public void setPayWay(java.lang.String payWay) {
		this.payWay = payWay;
	}
	public java.lang.String getSendWay() {
		return sendWay;
	}
	public void setSendWay(java.lang.String sendWay) {
		this.sendWay = sendWay;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public java.lang.String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(java.lang.String orderNum) {
		this.orderNum = orderNum;
	}
	public java.lang.String getComment() {
		return comment;
	}
	public void setComment(java.lang.String comment) {
		this.comment = comment;
	}
	public Integer getPhone() {
		return phone;
	}
	public void setPhone(Integer phone) {
		this.phone = phone;
	}
	public java.lang.String getEmail() {
		return email;
	}
	public void setEmail(java.lang.String email) {
		this.email = email;
	}
	public Integer getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(Integer creatorId) {
		this.creatorId = creatorId;
	}
	public Integer getBuyUserId() {
		return buyUserId;
	}
	public void setBuyUserId(Integer buyUserId) {
		this.buyUserId = buyUserId;
	}
	
	
	
	
}
