package dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import model.Admin;
import model.User;
import dao.ILoginDao;

public class LoginDao extends HibernateDaoSupport implements ILoginDao {

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

	

}
