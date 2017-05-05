package model;

import java.util.Date;

public class Reply {

	private Integer id;
	private Date createTime;//回复时间
	private java.lang.String replyContent;//回复内容
	private User user;
	private Comment comment;
	public Reply() {

	}
	
	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
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
	
	
	
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

    public java.lang.String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(java.lang.String replyContent) {
        this.replyContent = replyContent;
    }
	
	
	
	
}
