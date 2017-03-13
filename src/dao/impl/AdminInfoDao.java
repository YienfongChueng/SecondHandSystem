package dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import model.Admin;
import dao.IAdminInfoDao;

public class AdminInfoDao extends HibernateDaoSupport implements IAdminInfoDao {

	@Override
	public List<Admin> findAllAdminInfo(int begin, int pageSize) {
		DetachedCriteria dc=DetachedCriteria.forClass(Admin.class);
		List<Admin> list=this.getHibernateTemplate().findByCriteria(dc, begin, pageSize);
		return list;
	}

	@Override
	public int findAdminCount() {
		String hql="select count(*) from Admin";
		List<Long> list=this.getHibernateTemplate().find(hql);
		if(list.size()>0){
			return list.get(0).intValue();
		}else{
			return 0;
		}
	}

	

}
