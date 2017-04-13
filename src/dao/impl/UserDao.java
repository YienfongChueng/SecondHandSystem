package dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.IUserDao;
import model.Classify;
import model.Product;

public class UserDao extends HibernateDaoSupport implements IUserDao {

	/**
	 * 发布供求信息
	 */
	@Override
	public void saveProduct(Product product) {
		
		
	}

	/**
	 * 查询分类列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Classify> searchClassifyList() {
		String hql="from Classify";
		return this.getHibernateTemplate().find(hql);
	}

}
