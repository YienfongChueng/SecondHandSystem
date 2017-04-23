package model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.alibaba.fastjson.annotation.JSONField;

public class Comment {

	private Integer id;
	private Date creatTime;//评论时间
	private java.lang.String content;//评论内容
	private Integer status;//0未读，1已读
	private User user;
	private Product product;
	//@JSONField(serialize = false) 
	private Set<Reply> reply=new HashSet<Reply>();
	public Comment() {
	}
	
	public Set<Reply> getReply() {
		return reply;
	}


	public void setReply(Set<Reply> reply) {
		this.reply = reply;
	}



	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Date getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}
	
	public java.lang.String getContent() {
		return content;
	}
	public void setContent(java.lang.String content) {
		this.content = content;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
	
}
