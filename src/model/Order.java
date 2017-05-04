package model;

import java.util.HashSet;
import java.util.Set;

public class Order {

	private String id;
	private Integer status;//订单状态（0：待付款 1:已完成  ）
	private java.util.Date createTime;//订单生成时间
	private java.lang.String address;//送货地址
	private java.lang.String personName;//收货人
	private String phone;//联系电话
	private Double amount;//订单金额
	private java.lang.String payWay;//付款方式
	private String creatorId;//发布者id
	private Set<OrderItem> orderItem=new HashSet<OrderItem>();
	private User user;

	public Order() {
	}


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	public String getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(String creatorId) {
		this.creatorId = creatorId;
	}

	public java.lang.String getPayWay() {
		return payWay;
	}


	public void setPayWay(java.lang.String payWay) {
		this.payWay = payWay;
	}


	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public Integer getStatus() {
		return status;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}


	public java.util.Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}


	public java.lang.String getAddress() {
		return address;
	}


	public void setAddress(java.lang.String address) {
		this.address = address;
	}


	public java.lang.String getPersonName() {
		return personName;
	}


	public void setPersonName(java.lang.String personName) {
		this.personName = personName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public Double getAmount() {
		return amount;
	}


	public void setAmount(Double amount) {
		this.amount = amount;
	}


    public Set<OrderItem> getOrderItem() {
        return orderItem;
    }


    public void setOrderItem(Set<OrderItem> orderItem) {
        this.orderItem = orderItem;
    }


   
	
}
