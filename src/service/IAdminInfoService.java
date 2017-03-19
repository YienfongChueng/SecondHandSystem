package service;
import java.util.List;

import model.Admin;
import model.Classify;
import model.PageBean;
import model.Product;
import model.User;

public interface IAdminInfoService {

	/**
	 * 查询管理员列表
	 * @param currPage
	 * @return
	 */
	PageBean<Admin> findAllAdminInfo(int currPage);

	/**
	 * 查询用户列表
	 * @param currPage
	 * @param name
	 * @return
	 */
	PageBean<User> findAllUserInfo(int currPage,String name);

	/**
	 * 查询分类列表
	 * @param currPage
	 * @param name
	 * @return
	 */
	PageBean<Classify> findAllCateInfo(int currPage, String name);

	/**
	 * 查询商品列表
	 * @param currPage
	 * @param name
	 * @param cate
	 * @param type
	 * @return
	 */
	PageBean<Product> findAllProductInfo(int currPage, String name, int cate, int type);

	/**
	 * 分类列表查询
	 * @return
	 */
	List<Classify> findAllCateList();

	/**
	 * 查询商品详情
	 * @param pid
	 * @return
	 */
	Product searchProductDetail(int pid);

	/**
	 * 删除商品
	 * @param pid
	 */
	void delectProductById(int pid);

	/**
	 * 查询用户详情
	 * @param uid
	 * @return
	 */
	User searchUserDetail(int uid);

	/**
	 * 删除分类
	 * @param id
	 */
	void delectCateById(int id);

	/**
	 * 删除管理员
	 * @param id
	 */
	void delectAdminById(int id);

	/**
	 * 新增管理员
	 * @param admin
	 */
	void addAdmin(Admin admin);

	/**
	 * 通过账号查询管理员信息
	 * @param name
	 * @return
	 */
	Admin findAdminByName(String name);

	/**
	 * 通过id查询管理员信息
	 * @param aid
	 * @return
	 */
	Admin findAdminById(Integer aid);

	/**
	 * 修改管理员
	 * @param admin
	 */
	void updateAdmin(Admin admin);

	/**
	 * 根据分类名称查询分类信息
	 * @param classifyName
	 * @return
	 */
	Classify findCateByName(String classifyName);

	/**
	 * 新增分类
	 * @param cassify
	 */
	void addCate(Classify cassify);

	/**
	 * 修改分类
	 * @param cassify
	 */
	void updateCate(Classify cassify);

}
