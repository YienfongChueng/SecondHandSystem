package dao;

import model.Admin;
import model.User;

public interface ILoginDao {

	/**
	 * 通过用户名和密码查询用户
	 * @param user
	 * @return
	 */
	User findByUser(User user);
	
	/**
	 * 通过账号和密码查询管理员
	 * @param admin
	 * @return
	 */
	Admin findByAdmin(Admin admin);
	
	/**
	 * 通过用户名查询用户
	 * @param userName
	 * @return
	 */
	User findUserByName(String userName);
	
	/**
	 * 保存用户信息
	 * @param user
	 */
	void saveUser(User user);

	/**
	 * 修改用户密码
	 * @param user
	 */
	void updatePed(User user);
}
