package model;

import java.util.Date;

public class Reply {

	Integer id;
	Integer commentId;//评论id
	Integer userId;//回复者id
	Date createTime;//回复时间
	java.lang.String reply;//回复内容
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getCommentId() {
		return commentId;
	}
	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public java.lang.String getReply() {
		return reply;
	}
	public void setReply(java.lang.String reply) {
		this.reply = reply;
	}
	
	
}
