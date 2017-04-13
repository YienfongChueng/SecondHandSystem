package service.impl;

import org.springframework.transaction.annotation.Transactional;

import dao.ILoginDao;
import model.Admin;
import model.User;
import service.ILoginService;
@Transactional
public class LoginService implements ILoginService{

	private ILoginDao iLoginDao;
	
	public void setiLoginDao(ILoginDao iLoginDao) {
		this.iLoginDao = iLoginDao;
	}

	/**
	 * 通过用户帐户和密码查询用户
	 */
	@Override
	public User findByUser(User user) {
		return iLoginDao.findByUser(user);
	}

	/**
	 * 通过管理员帐户和密码查询管理员
	 */
	@Override
	public Admin findByAdmin(Admin admin) {
		return iLoginDao.findByAdmin(admin);
	}

	/**
	 * 通过用户名查询用户
	 */
	@Override
	public User findUserByName(String userName) {
		return this.iLoginDao.findUserByName(userName);
	}

	/**
	 * 保存用户信息
	 */
	@Override
	public void saveUser(User user) {
		this.iLoginDao.saveUser(user);
	}

	/**
	 * 修改用户密码
	 */
	@Override
	public void updatePed(User user) {
		this.iLoginDao.updatePed(user);
		
	}

	/**
	 * 通过用户id查询用户信息
	 */
	@Override
	public User searchUserInfoById(int uid) {
		
		return this.iLoginDao.searchUserInfoById(uid);
	}

	/**
	 * 修改用户信息
	 */
	@Override
	public void updateUser(User user) {
		this.iLoginDao.updateUser(user);
		
	}

	

}
