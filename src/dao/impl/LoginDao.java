package dao.impl;

import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import model.Admin;
import model.User;
import dao.ILoginDao;

public class LoginDao extends HibernateDaoSupport implements ILoginDao {

	/**
	 * 通过账号和密码查询用户
	 */
	@Override
	public User findByUser(User user) {
		String hql="from User u where u.userName=? and u.password=?";
		
		@SuppressWarnings("unchecked")
		
		List<User> list=this.getHibernateTemplate().find(hql,user.getUserName(),user.getPassword());
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	/**
	 * 通过账号和密码查询管理员
	 */
	@Override
	public Admin findByAdmin(Admin admin) {
		String hql="from Admin a where a.name=? and a.password=?";
		@SuppressWarnings("unchecked")
		List<Admin> list=this.getHibernateTemplate().find(hql, admin.getName(),admin.getPassword());
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	/**
	 * 通过用户名查询用户
	 */
	@Override
	public User findUserByName(String userName) {
		String hql="from User where userName=?";
		@SuppressWarnings("unchecked")
		List<User> list=this.getHibernateTemplate().find(hql,userName);
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}

	/**
	 * 保存用户信息
	 */
	@Override
	public void saveUser(User user) {
		this.getHibernateTemplate().save(user);
	}

	/**
	 * 修改用户密码
	 */
	@Override
	public void updatePed(User user) {
		User u=this.getHibernateTemplate().get(User.class, user.getUid());
		u.setPassword(user.getPassword());
		this.getHibernateTemplate().update(u);
		
	}

	/**
	 * 通过用户id查询用户信息
	 */
	@Override
	public User searchUserInfoById(int uid) {
		User u=this.getHibernateTemplate().get(User.class, uid);
		return u;
	}

	/**
	 * 修改用户信息
	 */
	@Override
	public void updateUser(User user) {
		this.getHibernateTemplate().update(user);
		
	}

	

}
