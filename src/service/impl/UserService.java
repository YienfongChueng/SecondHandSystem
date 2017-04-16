package service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import dao.IUserDao;
import model.Classify;
import model.Comment;
import model.PageBean;
import model.Product;
import service.IUserService;
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
	
}
