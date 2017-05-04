package model;

import java.util.Date;

public class MyCart {

	private Integer id;
	private Integer userId;
	private Integer productId;
	private String productName;
	private Integer num;
	private Date createTime;
	private Double count;
	private Double total;
	private String productPic;
	private String productDesc;
	private String creatorName;
	private String creatorPhone;
	private Integer creatorId;
	private Double singlePrice;
	
	public String getProductPic() {
		return productPic;
	}
	public void setProductPic(String productPic) {
		this.productPic = productPic;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Double getCount() {
		return count;
	}
	public void setCount(Double count) {
		this.count = count;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
    public String getCreatorName() {
        return creatorName;
    }
    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }
    public String getCreatorPhone() {
        return creatorPhone;
    }
    public void setCreatorPhone(String creatorPhone) {
        this.creatorPhone = creatorPhone;
    }
    public Integer getCreatorId() {
        return creatorId;
    }
    public void setCreatorId(Integer creatorId) {
        this.creatorId = creatorId;
    }
    public Double getSinglePrice() {
        return singlePrice;
    }
    public void setSinglePrice(Double singlePrice) {
        this.singlePrice = singlePrice;
    }
    
	
}
