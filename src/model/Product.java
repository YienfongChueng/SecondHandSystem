package model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Product {

	private Integer id;
	private java.lang.String proName;//商品名称
	private java.lang.String proPicture;//商品图片
	private Date createTime;//发布时间
	private Double proPrice;//商品单价
	private Integer proHassum;//商品剩余量
	private java.lang.String proDesc;//商品描述
	private Integer proClicknum;//商品点击数量
	/*private Integer creatorId;//发布者id
	private Integer classifyId;//分类id
*/	private Integer type;//0供信息，1求信息
	private Classify classify;//关联实体类
	private User user;//关联实体类

	
	public Classify getClassify() {
		return classify;
	}
	public void setClassify(Classify classify) {
		this.classify = classify;
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
	public java.lang.String getProName() {
		return proName;
	}
	public void setProName(java.lang.String proName) {
		this.proName = proName;
	}
	public java.lang.String getProPicture() {
		return proPicture;
	}
	public void setProPicture(java.lang.String proPicture) {
		this.proPicture = proPicture;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Double getProPrice() {
		return proPrice;
	}
	public void setProPrice(Double proPrice) {
		this.proPrice = proPrice;
	}
	public Integer getProHassum() {
		return proHassum;
	}
	public void setProHassum(Integer proHassum) {
		this.proHassum = proHassum;
	}
	public java.lang.String getProDesc() {
		return proDesc;
	}
	public void setProDesc(java.lang.String proDesc) {
		this.proDesc = proDesc;
	}
	public Integer getProClicknum() {
		return proClicknum;
	}
	public void setProClicknum(Integer proClicknum) {
		this.proClicknum = proClicknum;
	}
	
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
	
	
	
}
