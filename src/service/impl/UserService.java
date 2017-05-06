package service.impl;

import java.util.List;
import java.util.Map;

import model.Classify;
import model.Comment;
import model.MyCart;
import model.Order;
import model.PageBean;
import model.Product;
import model.Reply;
import model.User;

import org.springframework.transaction.annotation.Transactional;

import service.IUserService;
import dao.IUserDao;
@Transactional
public class UserService implements IUserService {

	private IUserDao iUserDao;

	public void setiUserDao(IUserDao iUserDao) {
		this.iUserDao = iUserDao;
	}
	Integer currPage=1;
	/**
	 * 发布供求信息
	 */
	@Override
	public void saveProduct(Product product) {
		this.iUserDao.saveProduct(product);
		
	}

	/**
	 * 查询分类列表
	 */
	@Override
	public List<Classify> searchClassifyList() {
		
		return this.iUserDao.searchClassifyList();
	}

	/**
	 * 查询商品
	 */
	@Override
	public PageBean<Product> searchProductList(Map<Object, String> map) {
		PageBean<Product> pageBean=new PageBean<Product>();
		//封装当前页
		currPage=Integer.parseInt(map.get("currPage"));
		pageBean.setCurrPage(currPage);
		//封装每页记录数
		int pageSize=12;
		pageBean.setPageSize(pageSize);
		//封装总记录数
		int totalCount=this.iUserDao.searchProductCount(map);
		pageBean.setTotalCount(totalCount);
		//封装总页数
		double tc=totalCount;
		Double num=Math.ceil(tc/pageSize);
		if(num==0){
			num=(double) 1;
		}
		pageBean.setTotalPage(num.intValue());
		//封装每页显示的数据
		int begin=(currPage-1)*pageSize;
		map.put("begin", begin+"");
		map.put("pageSize", pageSize+"");
		List<Product> list=this.iUserDao.searchProductList(map);
		pageBean.setList(list);
		return pageBean;
		
	}

	/**
	 * 查询商品详情
	 */
	@Override
	public Product getProductDetail(String id) {
		
		return this.iUserDao.getProductDetail(id);
	}

	/**
	 * 通过id查询某商品下的评论
	 */
	@Override
	public PageBean<Comment> getCommentList(String id,Map<Object, String> map) {
		PageBean<Comment> pageBean=new PageBean<Comment>();
		//封装当前页
		currPage=Integer.parseInt(map.get("currPage"));
		pageBean.setCurrPage(currPage);
		//封装每页记录数
		int pageSize=10;
		pageBean.setPageSize(pageSize);
		//封装总记录数
		int totalCount=this.iUserDao.searchCommentCount(id);
		pageBean.setTotalCount(totalCount);
		//封装总页数
		double tc=totalCount;
		Double num=Math.ceil(tc/pageSize);
		if(num==0){
			num=(double) 1;
		}
		pageBean.setTotalPage(num.intValue());
		//封装每页显示的数据
		int begin=(currPage-1)*pageSize;
		map.put("begin", begin+"");
		map.put("pageSize", pageSize+"");
		List<Comment> list=this.iUserDao.getCommentList(id,map);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public Classify getClassifyById(Integer classifyId) {
		return this.iUserDao.getClassifyById(classifyId);
		
	}

	@Override
	public User getUserById(Integer creatorId) {
		
		return this.iUserDao.getUserById(creatorId);
	}

	@Override
	public void updateProduct(Product product) {
		this.iUserDao.updateProduct(product);
		
	}

	/**
	 * 获取我的购物车列表
	 */
	@Override
	public PageBean<MyCart> getMyCart(Map<Object, String> map) {
		PageBean<MyCart> pageBean=new PageBean<MyCart>();
		//封装当前页
		currPage=Integer.parseInt(map.get("currPage"));
		pageBean.setCurrPage(currPage);
		//封装每页记录数
		int pageSize=5;
		pageBean.setPageSize(pageSize);
		//封装总记录数
		int totalCount=this.iUserDao.searchMyCartCount(Integer.parseInt(map.get("userId")));
		pageBean.setTotalCount(totalCount);
		//封装总页数
		double tc=totalCount;
		Double num=Math.ceil(tc/pageSize);
		if(num==0){
			num=(double) 1;
		}
		pageBean.setTotalPage(num.intValue());
		//封装每页显示的数据
		int begin=(currPage-1)*pageSize;
		map.put("begin", begin+"");
		map.put("pageSize", pageSize+"");
		List<MyCart> list=this.iUserDao.getMyCartList(map);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public List<MyCart> getMyCartList(Integer uid) {
		
		return this.iUserDao.getMyCartList(uid);
	}

	/**
	 * 保存或更新购物车
	 */
	@Override
	public void saveOrUpdate(MyCart cart) {
		this.iUserDao.saveOrUpdate(cart);
		
	}
	
	/**
	 * 清空或删除某一购物车
	 * @param id
	 * @param uid
	 */
	@Override
	public void deleteCart(String id, Integer uid) {
		this.iUserDao.deleteCart(id,uid);
		
	}

	/**
	 * 查询用户勾选的商品信息列表
	 * @param ids
	 * @return
	 */
	@Override
	public List<Product> getComfirmProductList(String ids) {
		
		return this.iUserDao.getComfirmProductList(ids);
	}

	 /**
     * <p>Description: 查询用户勾选购物车里的商品信息</p>
     * @param ids
     * @return
     */
    @Override
    public List<MyCart> getMyCartChooseList(String ids) {
        List<MyCart> cartlist=this.iUserDao.getMyCartChooseList(ids);
        if(cartlist!=null){
            for(MyCart cart:cartlist){
                Product p=this.iUserDao.getProductDetail(cart.getProductId().toString());
                cart.setCreatorId(p.getUser().getUid());
                cart.setCreatorName(p.getUser().getUserName());
                cart.setCreatorPhone(p.getUser().getPhone());
                cart.setSinglePrice(p.getProPrice());
            }
        }
        return cartlist;
    }

    /**
     * <p>Description: 级联保存订单和订单子表</p>
     * @param order
     */
    @Override
    public void saveOrder(Order order,String ids) {
       this.iUserDao.saveOrder(order,ids);
    }

    /**
     * <p>Description: 分页查询我卖出的订单</p>
     * @param map
     * @return
     */
    @Override
    public PageBean<Order> searchMySellOrderByPage(Map<Object, String> map) {
        PageBean<Order> pageBean=new PageBean<Order>();
        //封装当前页
        currPage=Integer.parseInt(map.get("currPage"));
        pageBean.setCurrPage(currPage);
        //封装每页记录数
        int pageSize=5;
        pageBean.setPageSize(pageSize);
        //封装总记录数
        int totalCount=this.iUserDao.searchMyOrderCount(map.get("userId"));
        pageBean.setTotalCount(totalCount);
        //封装总页数
        double tc=totalCount;
        Double num=Math.ceil(tc/pageSize);
        if(num==0){
            num=(double) 1;
        }
        pageBean.setTotalPage(num.intValue());
        //封装每页显示的数据
        int begin=(currPage-1)*pageSize;
        map.put("begin", begin+"");
        map.put("pageSize", pageSize+"");
        List<Order> list=this.iUserDao.getMyOrderList(map);
        pageBean.setList(list);
        return pageBean;
    }

    /**
     * <p>Description: 分页查询我卖出的订单</p>
     * @param map
     * @return
     */
    @Override
    public PageBean<Order> searchMyBuyOrderByPage(Map<Object, String> map) {
        PageBean<Order> pageBean=new PageBean<Order>();
        //封装当前页
        currPage=Integer.parseInt(map.get("currPage"));
        pageBean.setCurrPage(currPage);
        //封装每页记录数
        int pageSize=5;
        pageBean.setPageSize(pageSize);
        //封装总记录数
        int totalCount=this.iUserDao.searchBuyOrderCount(Integer.parseInt(map.get("userId")));
        pageBean.setTotalCount(totalCount);
        //封装总页数
        double tc=totalCount;
        Double num=Math.ceil(tc/pageSize);
        if(num==0){
            num=(double) 1;
        }
        pageBean.setTotalPage(num.intValue());
        //封装每页显示的数据
        int begin=(currPage-1)*pageSize;
        map.put("begin", begin+"");
        map.put("pageSize", pageSize+"");
        List<Order> list=this.iUserDao.getBuyOrderList(map);
        pageBean.setList(list);
        return pageBean;
    }

    /**
     * <p>Description: 查询我发布的商品列表信息</p>
     * @param map
     * @return
     */
    @Override
    public PageBean<Product> searchMyProductByPage(Map<Object, String> map) {
        PageBean<Product> pageBean=new PageBean<Product>();
        //封装当前页
        currPage=Integer.parseInt(map.get("currPage"));
        pageBean.setCurrPage(currPage);
        //封装每页记录数
        int pageSize=5;
        pageBean.setPageSize(pageSize);
        //封装总记录数
        int totalCount=this.iUserDao.searchMyProductCount(Integer.parseInt(map.get("userId")));
        pageBean.setTotalCount(totalCount);
        //封装总页数
        double tc=totalCount;
        Double num=Math.ceil(tc/pageSize);
        if(num==0){
            num=(double) 1;
        }
        pageBean.setTotalPage(num.intValue());
        //封装每页显示的数据
        int begin=(currPage-1)*pageSize;
        map.put("begin", begin+"");
        map.put("pageSize", pageSize+"");
        List<Product> list=this.iUserDao.getMyProductList(map);
        pageBean.setList(list);
        return pageBean;
    }

    /**
     * <p>Description: 新增一条评论</p>
     * @param comm
     */
    @Override
    public void saveComment(Comment comm) {
       this.iUserDao.saveComment(comm);
        
    }

    /**
     * <p>Description: 查询评论详情</p>
     * @param cid
     * @return
     */
    @Override
    public Comment searchCommentDetail(String cid) {
      int id=Integer.parseInt(cid);
        return this.iUserDao.searchCommentDetail(id);
    }

    
    /**
     * <p>Description: 新增一条回复</p>
     * @param r
     */
    @Override
    public void saveReply(Reply r) {
     this.iUserDao.saveReply(r);
        
    }

    /**
     * <p>Description: 通过oid删除我卖出的订单</p>
     * @param oid
     */
    @Override
    public void deleteMySellOrder(String oid) {
      this.iUserDao.deleteMySellOrder(oid);
        
    }

    /**
     * <p>Description: 删除我发布的商品</p>
     * @param pid
     */
    @Override
    public void delectProductById(int pid) {
        this.iUserDao.delectProductById(pid);
        
    }

    /**
     * <p>Description: 分页查询评论</p>
     * @param map
     * @return
     */
    @Override
    public PageBean<Comment> searchCommentByPage(Map<Object, String> map) {
        PageBean<Comment> pageBean=new PageBean<Comment>();
        //封装当前页
        currPage=Integer.parseInt(map.get("currPage"));
        pageBean.setCurrPage(currPage);
        //封装每页记录数
        int pageSize=5;
        pageBean.setPageSize(pageSize);
        //封装总记录数
        int totalCount=this.iUserDao.searchCommentCount(Integer.parseInt(map.get("userId")),map.get("flag"));
        pageBean.setTotalCount(totalCount);
        //封装总页数
        double tc=totalCount;
        Double num=Math.ceil(tc/pageSize);
        if(num==0){
            num=(double) 1;
        }
        pageBean.setTotalPage(num.intValue());
        //封装每页显示的数据
        int begin=(currPage-1)*pageSize;
        map.put("begin", begin+"");
        map.put("pageSize", pageSize+"");
        List<Comment> list=this.iUserDao.getCommentList(map);
        pageBean.setList(list);
        return pageBean;
    }

    

 
	
	
}
