package action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import model.Classify;
import model.Comment;
import model.MyCart;
import model.Order;
import model.OrderItem;
import model.PageBean;
import model.Product;
import model.Reply;
import model.User;

import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;

import service.IUserService;
import util.AddJson;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ProductAction extends ActionSupport implements ModelDriven<Product>{

	IUserService iUserService;
	public void setiUserService(IUserService iUserService) {
		this.iUserService = iUserService;
	}
	Product product=new Product();
	@Override
	public Product getModel() {
		return product;
	}
	HttpServletRequest req=ServletActionContext.getRequest();
	AddJson json=new AddJson();
	private int currPage=1;//当前页
	
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	private File proPictureFile;
	private String proPictureFileFileName;
	private String proPictureContentType;
	private final int BUFFER_SIZE=16*1024;
	private Integer classifyId;
	
	public Integer getClassifyId() {
		return classifyId;
	}
	public void setClassifyId(Integer classifyId) {
		this.classifyId = classifyId;
	}
	public File getProPictureFile() {
		return proPictureFile;
	}
	public void setProPictureFile(File proPictureFile) {
		this.proPictureFile = proPictureFile;
	}
	
	public String getProPictureContentType() {
		return proPictureContentType;
	}
	public void setProPictureContentType(String proPictureContentType) {
		this.proPictureContentType = proPictureContentType;
	}
	public String getProPictureFileFileName() {
		return proPictureFileFileName;
	}
	public void setProPictureFileFileName(String proPictureFileFileName) {
		this.proPictureFileFileName = proPictureFileFileName;
	}
	/**
	 * 发布供求信息
	 */
	public String addProduct() throws Exception{
		String newFileName=new Date().getTime()+getExtention(proPictureFileFileName);
		String path=ServletActionContext.getServletContext().getRealPath("/upload");
		File picFile=new File(path);
		if(!picFile.exists()){
			picFile.mkdir();
		}
		FileUtil.copyFile(proPictureFile, new File(picFile,newFileName));
		//copy(proPictureFile,picFile);
		product.setProPicture(newFileName);
		product.setCreateTime(new Date());
		product.setProClicknum(0);
		Classify c=this.iUserService.getClassifyById(product.getClassifyId());
		User u=this.iUserService.getUserById(product.getCreatorId());
		product.setClassify(c);
		product.setUser(u);
		this.iUserService.saveProduct(product);
		this.addActionMessage("发布成功！");
		return "uploadSuccess";
		
	}
	/**
	 * 上传文件（io流实现）
	 * @param src
	 * @param dst
	 * @throws Exception 
	 */
	private void copy(File src, File dst)throws Exception {
		InputStream in=null;
		OutputStream out=null;
		try {
			in=new BufferedInputStream(new FileInputStream(src),BUFFER_SIZE);
			out=new BufferedOutputStream(new FileOutputStream(dst),BUFFER_SIZE);
			byte[] buffer=new byte[BUFFER_SIZE];
			while(in.read(buffer)>0){
				out.write(buffer);
			}
		} catch (Exception e) {
			throw e;
		}finally{
			try {
				in.close();
			} catch (Exception e2) {
				
			}
			try {
				out.close();
			} catch (Exception e2) {
				
			}
		}
		
	}
	/**
	 * 截图文件后缀名称
	 * @param filename
	 * @return
	 */
	private String getExtention(String filename) {
		int pos=filename.lastIndexOf(".");
		return filename.substring(pos);
	}
	/**
	 * 查询分类列表
	 * @throws IOException 
	 */
	public void searchClassifyList() throws IOException{
		List<Classify> list=this.iUserService.searchClassifyList();
		this.json.toJsonArray(list);
	}
	
	/**
	 * 查询商品列表
	 */
	public void searchProductList() throws Exception{
		String keyword=req.getParameter("keyword");
		String cid=req.getParameter("cid");
		String conditon=req.getParameter("condition");
		Map<Object,String> map=new HashMap<Object,String>();
		if(keyword!=null&&keyword!=""){
			map.put("keyword", keyword);
		}
		if(cid!=null&&cid!=""){
			map.put("cid", cid);
		}
		if(conditon!=null&&conditon!=""){
			map.put("conditon", conditon);
		}
		map.put("currPage", currPage+"");
		PageBean<Product> proList=this.iUserService.searchProductList(map);
		this.json.toJsonObj(proList);
	}
	
	/**
	 * 查询商品详情
	 */
	public void getProductDetail() throws Exception{
		String id=req.getParameter("id");
		Product product=this.iUserService.getProductDetail(id);
		this.json.toJson(product);
		int clickNum=product.getProClicknum();
		product.setProClicknum(clickNum+1);
		this.iUserService.updateProduct(product);
	}
	/**
	 * 通过id查询某商品下的评论
	 */
	public void getCommentList() throws Exception{
		String id=req.getParameter("id");
		Map<Object, String> map=new HashMap<Object, String>();
		map.put("currPage", currPage+"");
		PageBean<Comment> comment=this.iUserService.getCommentList(id,map);
		this.json.toJson(comment);
	}
	
	/**
	 * 添加进购物车
	 * @throws Exception
	 */
	public void addToCart() throws Exception {
		String id=req.getParameter("id");
		int num=Integer.parseInt(req.getParameter("num"));
		User user=(User) req.getSession().getAttribute("User");
		if(user==null){
			throw new Exception("用户帐户为空，请重新登录！");
		}else{
			boolean same=false;
			List<MyCart> cart=this.iUserService.getMyCartList(user.getUid());
			Product product=this.iUserService.getProductDetail(id);
			for(MyCart mycart:cart){
				if(mycart.getProductId()==Integer.parseInt(id)){
					mycart.setNum(mycart.getNum()+1);
					mycart.setCount(mycart.getCount()+product.getProPrice());
					mycart.setTotal(mycart.getTotal()+mycart.getCount());
					same=true;
					this.iUserService.saveOrUpdate(mycart);
				}
			}
			if(!same){
				MyCart myCart=new MyCart();
				myCart.setCreateTime(new Date());
				myCart.setProductId(product.getId());
				myCart.setProductName(product.getProName());
				myCart.setProductDesc(product.getProDesc());
				myCart.setProductPic(product.getProPicture());
				myCart.setUserId(user.getUid());
				myCart.setNum(num);
				myCart.setCount(product.getProPrice()*num);
				myCart.setTotal(product.getProPrice()*num);
				this.iUserService.saveOrUpdate(myCart);
			}
			
			
		}
		
	}
	
	/**
	 * 通过id删除购物车
	 * @throws Exception 
	 */
	public void deleteCartById() throws Exception{
		String id=req.getParameter("id");
		User user=(User) req.getSession().getAttribute("User");
		if(user==null){
			throw new Exception("用户帐户为空，请重新登录！");
		}else{
			this.iUserService.deleteCart(id,user.getUid());
		}
	}
	
	/**
	 * 清空购物车
	 * @throws Exception 
	 */
	public void deleteCartAll() throws Exception{
		User user=(User) req.getSession().getAttribute("User");
		if(user==null){
			throw new Exception("用户帐户为空，请重新登录！");
		}else{
			this.iUserService.deleteCart("",user.getUid());
		}
	}
	
	/**
	 * 分页查询购物车
	 * @throws Exception 
	 */
	public void searchCartByPage() throws Exception{
		User user=(User) req.getSession().getAttribute("User");
		if(user==null){
			throw new Exception("用户帐户为空，请重新登录！");
		}else{
			Map<Object, String> map=new HashMap<Object, String>();
			map.put("currPage", currPage+"");
			map.put("userId", user.getUid()+"");
			PageBean<MyCart> cart=this.iUserService.getMyCart(map);
			this.json.toJson(cart);
		}
	}
	
	/**
	 * 订单确认--首先查询用户选择要付款的商品列表信息
	 */
	public void getMyCartChooseList() throws Exception{
		User user=(User) req.getSession().getAttribute("User");
		if(user==null){
			throw new Exception("用户帐户为空，请重新登录！");
		}else{
			String ids=req.getParameter("ids");
			//List<Product> list=this.iUserService.getComfirmProductList(ids);
			List<MyCart> mycartList=this.iUserService.getMyCartChooseList(ids);
			this.json.toJsonArray(mycartList);
		}
	}
	
	/**
	 * 提交订单
	 */
	private String personName;
	private String address;
	private String phone;
	private String totalMoney;
	private String creatorIds;
	private String ids;
	private String amount;
	public void addOrder()throws Exception{
		User user=(User) req.getSession().getAttribute("User");
		if(user==null){
			throw new Exception("用户帐户为空，请重新登录！");
		}else{
		    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
            String orderNum = format.format(new Date())+String.valueOf(System.currentTimeMillis());
			Order order=new Order();
			order.setId(orderNum);
			order.setCreateTime(new Date());
			order.setUser(user);
			order.setPersonName(personName);
			order.setAddress(address);
			order.setPhone(phone);
			order.setAmount(Double.parseDouble(amount));
			order.setStatus(0);//默认待付款
			order.setPayWay("校内见面交易");
			order.setCreatorId(creatorIds);
			List<MyCart> mycartList=this.iUserService.getMyCartChooseList(ids);
			Set<OrderItem> orderItemList=new HashSet<OrderItem>();
			for(MyCart c:mycartList){
			    int pid=c.getProductId();
			    Product product=this.iUserService.getProductDetail(pid+"");
			    OrderItem orderItem=new OrderItem();
			    orderItem.setCount(c.getCount());
			    orderItem.setNum(c.getNum());
			    orderItem.setProduct(product);
			    orderItem.setOrder(order);
			    orderItemList.add(orderItem);
			    int hassum=product.getProHassum()-c.getNum();
			    if(hassum==0){
			        product.setProHassum(0);
			    }else{
			        product.setProHassum(hassum);
			    }
			    this.iUserService.updateProduct(product);
			}
			order.setOrderItem(orderItemList);
			this.iUserService.saveOrder(order,ids);
		}
	}

	/**
     * 分页查询我卖出的订单
     * @throws Exception 
     */
    public void searchMySellOrderByPage() throws Exception{
        User user=(User) req.getSession().getAttribute("User");
        if(user==null){
            throw new Exception("用户帐户为空，请重新登录！");
        }else{
            Map<Object, String> map=new HashMap<Object, String>();
            map.put("currPage", currPage+"");
            map.put("userId", user.getUid()+"");
            PageBean<Order> order=this.iUserService.searchMySellOrderByPage(map);
            this.json.toJson(order);
        }
    }
	
    /**
     * 分页查询我买到的订单
     * @throws Exception 
     */
    public void searchMyBuyOrderByPage() throws Exception{
        User user=(User) req.getSession().getAttribute("User");
        if(user==null){
            throw new Exception("用户帐户为空，请重新登录！");
        }else{
            Map<Object, String> map=new HashMap<Object, String>();
            map.put("currPage", currPage+"");
            map.put("userId", user.getUid()+"");
            PageBean<Order> order=this.iUserService.searchMyBuyOrderByPage(map);
            this.json.toJson(order);
        }
    }
    
    /**
     * 分页查询我发布的商品列表信息
     * @throws Exception 
     */
    public void searchMyProductByPage() throws Exception{
        User user=(User) req.getSession().getAttribute("User");
        if(user==null){
            throw new Exception("用户帐户为空，请重新登录！");
        }else{
            Map<Object, String> map=new HashMap<Object, String>();
            map.put("currPage", currPage+"");
            map.put("userId", user.getUid()+"");
            PageBean<Product> myproList=this.iUserService.searchMyProductByPage(map);
            this.json.toJson(myproList);
        }
    }
    
    /**
     * 
     * <p>Description: 新增评论数据</p>
     * @return
     * @throws Exception 
     */
    public void addComment() throws Exception{
        User user=(User) req.getSession().getAttribute("User");
        if(user==null){
            throw new Exception("用户帐户为空，请重新登录！");
        }else{
            String content=req.getParameter("content");
            String id=req.getParameter("id");
            Product pro=this.iUserService.getProductDetail(id);
            Comment comm=new Comment();
            comm.setContent(content);
            comm.setCreatTime(new Date());
            comm.setProduct(pro);
            comm.setUser(user);
            comm.setStatus(0);
            this.iUserService.saveComment(comm);
        }
    }
    
    /**
     * 
     * <p>Description: 新增一条回复</p>
     * @return
     * @throws Exception 
     */
    public void addReply() throws Exception{
        User user=(User) req.getSession().getAttribute("User");
        if(user==null){
            throw new Exception("用户帐户为空，请重新登录！");
        }else{
            String cid=req.getParameter("cid");
            String rcontent=req.getParameter("repContent");
            Comment comment=this.iUserService.searchCommentDetail(cid);
            Reply r=new Reply();
            r.setCreateTime(new Date());
            r.setReplyContent(rcontent);
            r.setUser(user);
            r.setComment(comment);
            this.iUserService.saveReply(r);
        }
    }
    
    
    
	public String getCreatorIds() {
		return creatorIds;
	}
	public void setCreatorIds(String creatorIds) {
		this.creatorIds = creatorIds;
	}
	public String getPersonName() {
		return personName;
	}
	public void setPersonName(String personName) {
		this.personName = personName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(String totalMoney) {
		this.totalMoney = totalMoney;
	}
    public String getIds() {
        return ids;
    }
    public void setIds(String ids) {
        this.ids = ids;
    }
    public String getAmount() {
        return amount;
    }
    public void setAmount(String amount) {
        this.amount = amount;
    }
	
}
