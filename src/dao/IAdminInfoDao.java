package dao;

import java.util.List;

import model.Admin;
import model.Classify;
import model.Product;
import model.User;

public interface IAdminInfoDao {

	/**
	 * 查询管理员数量
	 * @return
	 */
	int findAdminCount();
	
	/**
	 * 分页查询管理员列表
	 * @param begin
	 * @param pageSize
	 * @return
	 */
	List<Admin> findAllAdminInfo(int begin, int pageSize);

	/**
	 * 查询用户数量
	 * @param name
	 * @return
	 */
	int findUserCount(String name);

	/**
	 * 分页查询用户列表
	 * @param begin
	 * @param pageSize
	 * @param name
	 * @return
	 */
	List<User> findAllUserInfo(int begin, int pageSize,String name);

	/**
	 * 查询分类数量
	 * @param name
	 * @return
	 */
	int findCateCount(String name);

	/**
	 * 分页查询分类列表
	 * @param begin
	 * @param pageSize
	 * @param name
	 * @return
	 */
	List<Classify> findAllCateInfo(int begin, int pageSize, String name);

	/**
	 * 查询商品数量
	 * @param name
	 * @param cate
	 * @param type
	 * @return
	 */
	int findProductCount(String name, int cate, int type);

	/**
	 * 查询商品列表
	 * @param begin
	 * @param pageSize
	 * @param name
	 * @param cate
	 * @param type
	 * @return
	 */
	List<Product> findAllProductInfo(int begin, int pageSize, String name, int cate, int type);

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
	 * 通过管理员帐户查询
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
