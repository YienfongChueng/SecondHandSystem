package service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import dao.IAdminInfoDao;
import model.Admin;
import model.Classify;
import model.PageBean;
import model.Product;
import model.User;
import service.IAdminInfoService;
@Transactional
public class AdminInfoService implements IAdminInfoService {

	IAdminInfoDao iAdminInfoDao;
	public void setiAdminInfoDao(IAdminInfoDao iAdminInfoDao) {
		this.iAdminInfoDao = iAdminInfoDao;
	}
	/**
	 * 分页查询管理员列表
	 * @param currPage
	 * @return
	 */
	@Override
	public PageBean<Admin> findAllAdminInfo(int currPage) {
		PageBean<Admin> pageBean=new PageBean<Admin>();
		//封装当前页
		pageBean.setCurrPage(currPage);
		//封装每页记录数
		int pageSize=3;
		pageBean.setPageSize(pageSize);
		//封装总记录数
		int totalCount=this.iAdminInfoDao.findAdminCount();
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
		List<Admin> list=this.iAdminInfoDao.findAllAdminInfo(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}
	/**
	 * 分页查询用户列表
	 * @param currPage
	 * @param name
	 * @return
	 */
	@Override
	public PageBean<User> findAllUserInfo(int currPage,String name) {
		PageBean<User> pageBean=new PageBean<User>();
		//封装当前页
		pageBean.setCurrPage(currPage);
		//封装每页记录数
		int pageSize=10;
		pageBean.setPageSize(pageSize);
		//封装总记录数
		int totalCount=this.iAdminInfoDao.findUserCount(name);
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
		List<User> list=this.iAdminInfoDao.findAllUserInfo(begin,pageSize,name);
		pageBean.setList(list);
		return pageBean;
	}
	/**
	 * 分页查询分类列表
	 * @param currPage
	 * @param name
	 * @return
	 */
	@Override
	public PageBean<Classify> findAllCateInfo(int currPage, String name) {
		PageBean<Classify> pageBean=new PageBean<Classify>();
		//封装当前页
		pageBean.setCurrPage(currPage);
		//封装每页记录数
		int pageSize=5;
		pageBean.setPageSize(pageSize);
		//封装总记录数
		int totalCount=this.iAdminInfoDao.findCateCount(name);
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
		List<Classify> list=this.iAdminInfoDao.findAllCateInfo(begin,pageSize,name);
		pageBean.setList(list);
		return pageBean;
	}
	/**
	 * 分页 查询商品列表
	 * @param currPage
	 * @param name
	 * @param cate
	 * @param type
	 * @return
	 */
	@Override
	public PageBean<Product> findAllProductInfo(int currPage, String name,int cate,int type) {
		PageBean<Product> pageBean=new PageBean<Product>();
		//封装当前页
		pageBean.setCurrPage(currPage);
		//封装每页记录数
		int pageSize=10;
		pageBean.setPageSize(pageSize);
		//封装总记录数
		int totalCount=this.iAdminInfoDao.findProductCount(name,cate,type);
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
		List<Product> list=this.iAdminInfoDao.findAllProductInfo(begin,pageSize,name,cate,type);
		pageBean.setList(list);
		return pageBean;
	}
	
	/**
	 * 分类列表查询，用于下列展示
	 * @return
	 */
	@Override
	public List<Classify> findAllCateList() {
		List<Classify> cateList=this.iAdminInfoDao.findAllCateList();
		return cateList;
	}
	/**
	 * 通过id查询商品详情
	 * @param pid
	 * @return
	 */
	@Override
	public Product searchProductDetail(int pid) {
		Product product=this.iAdminInfoDao.searchProductDetail(pid);
		return product;
	}
	/**
	 * 通过id删除商品
	 * @param pid
	 */
	@Override
	public void delectProductById(int pid) {
		this.iAdminInfoDao.delectProductById(pid);
		
	}
	/**
	 * 通过id查询用户详情
	 * @param uid
	 * @return
	 */
	@Override
	public User searchUserDetail(int uid) {
		User u=this.iAdminInfoDao.searchUserDetail(uid);
		return u;
	}
	/**
	 * 通过id删除分类
	 * @param id
	 */
	@Override
	public void delectCateById(int id) {
		this.iAdminInfoDao.delectCateById(id);
		
	}
	/**
	 * 通过id删除管理员
	 * @param id
	 */
	@Override
	public void delectAdminById(int id) {
		this.iAdminInfoDao.delectAdminById(id);
		
	}
	/**
	 * 新增管理员
	 * @param admin
	 */
	@Override
	public void addAdmin(Admin admin) {
		this.iAdminInfoDao.addAdmin(admin);
		
	}
	/**
	 * 通过管理员账号查询管理员信息
	 * @param name
	 * @return
	 */
	@Override
	public Admin findAdminByName(String name) {
		
		return this.iAdminInfoDao.findAdminByName(name);
	}
	/**
	 * 通过id查询管理员信息
	 * @param aid
	 * @return
	 */
	@Override
	public Admin findAdminById(Integer aid) {
		
		return this.iAdminInfoDao.findAdminById(aid);
	}
	/**
	 * 修改管理员
	 * @param admin
	 */
	@Override
	public void updateAdmin(Admin admin) {
		this.iAdminInfoDao.updateAdmin(admin);
		
	}
	/**
	 * 根据分类名称查询分类信息
	 * @param classifyName
	 * @return
	 */
	@Override
	public Classify findCateByName(String classifyName) {
		Classify c=this.iAdminInfoDao.findCateByName(classifyName);
		return c;
	}
	/**
	 * 新增分类
	 * @param cassify
	 */
	@Override
	public void addCate(Classify cassify) {
		this.iAdminInfoDao.addCate(cassify);
		
	}
	/**
	 * 修改分类
	 * @param cassify
	 */
	@Override
	public void updateCate(Classify cassify) {
		this.iAdminInfoDao.updateCate(cassify);
		
	}

	

}
