package dao.impl;

import java.util.List;

import model.Admin;
import model.Classify;
import model.Product;
import model.User;
import model.UserAndAdmin;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.IAdminInfoDao;

public class AdminInfoDao extends HibernateDaoSupport implements IAdminInfoDao {

	@Override
	public List<Admin> findAllAdminInfo(int begin, int pageSize) {
		DetachedCriteria dc=DetachedCriteria.forClass(Admin.class);
		@SuppressWarnings("unchecked")
		List<Admin> list=this.getHibernateTemplate().findByCriteria(dc, begin, pageSize);
		return list;
	}

	@Override
	public int findAdminCount() {
		String hql="select count(*) from Admin";
		@SuppressWarnings("unchecked")
		List<Long> list=this.getHibernateTemplate().find(hql);
		if(list.size()>0){
			return list.get(0).intValue();
		}
			return 0;
		
	}

	@Override
	public int findUserCount(String name) {
		StringBuffer br=new StringBuffer();
		
		String hql="select count(*) from User " ;
		if(name!=null){
			String uname="%"+name+"%";
			br.append("where userName like '"+uname+"'");
		}
		@SuppressWarnings("unchecked")
		List<Long> list=this.getHibernateTemplate().find(hql+br.toString());
		if(list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<User> findAllUserInfo(int begin, int pageSize,String name) {
		String uname="%"+name+"%";
		DetachedCriteria dc=DetachedCriteria.forClass(User.class)
				.add(Restrictions.like("userName", uname, MatchMode.ANYWHERE))
				.addOrder(Order.desc("uid"));
		@SuppressWarnings("unchecked")
		List<User> list=this.getHibernateTemplate().findByCriteria(dc, begin, pageSize);
		return list;
	}

	@Override
	public int findCateCount(String name) {
		StringBuffer br=new StringBuffer();
		String hql="select count(*) from Classify";
		if(name!=null){
			String uname="%"+name+"%";
			br.append(" where classifyName like '"+uname+"'");
		}
		@SuppressWarnings("unchecked")
		List<Long> list=this.getHibernateTemplate().find(hql+br.toString());
		if(list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Classify> findAllCateInfo(int begin, int pageSize, String name) {
		String uname="%"+name+"%";
		DetachedCriteria dc=DetachedCriteria.forClass(Classify.class)
				.add(Restrictions.like("classifyName", uname, MatchMode.ANYWHERE))
				.addOrder(Order.asc("ClassifySort"));;
		@SuppressWarnings("unchecked")
		List<Classify> list=this.getHibernateTemplate().findByCriteria(dc,begin,pageSize);
		return list;
	}

	@Override
	public int findProductCount(String name,int cate,int type) {
		StringBuffer br=new StringBuffer();
		String hql="select count(*) from Product p where 1=1";
		if(name!=""){
			String uname="%"+name+"%";
			br.append(" and p.proName like '"+uname+"'");
		}
		if(cate!=0){
			br.append(" and p.classify.cid ='"+cate+"'");
		}
		if(type!=2){
			br.append(" and p.type ='"+type+"'");		
		}
		@SuppressWarnings("unchecked")
		List<Long> list=this.getHibernateTemplate().find(hql+br.toString());
		if(list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Product> findAllProductInfo(int begin, int pageSize, String name,int cate,int type) {
		String uname="%"+name+"%";
		
		DetachedCriteria dc=DetachedCriteria.forClass(Product.class,"p")
				.add(Restrictions.like("p.proName", uname, MatchMode.ANYWHERE));
				if(cate!=0){
					dc.add(Restrictions.eq("p.classify.cid", cate));
				}
				if(type!=2){
					dc.add(Restrictions.eq("p.type", type));
				}
				dc.addOrder(Order.desc("p.createTime"));
		@SuppressWarnings("unchecked")
		List<Product> list=this.getHibernateTemplate().findByCriteria(dc,begin,pageSize);
		return list;
	}

	@Override
	public List<Classify> findAllCateList() {
		String hql="from Classify";
		@SuppressWarnings("unchecked")
		List<Classify> cateList=this.getHibernateTemplate().find(hql);
		return cateList;
	}

	@Override
	public Product searchProductDetail(int pid) {
		String hql=" from Product p where p.id=? ";
		
		@SuppressWarnings("unchecked")
		List<Product> list=this.getHibernateTemplate().find(hql,pid);
		if(list.size()>0){
			Product p=list.get(0);
			return p;
		}
		return null;
	}

	@Override
	public void delectProductById(int pid) {
		Product product=this.getHibernateTemplate().get(Product.class, pid);
		if(product!=null){
			this.getHibernateTemplate().delete(product);
		}
		
		
	}

	@Override
	public User searchUserDetail(int uid) {
		User user=this.getHibernateTemplate().get(User.class, uid);
		return user;
	}

	@Override
	public void delectCateById(int id) {
		Classify c=this.getHibernateTemplate().get(Classify.class, id);
		if(c!=null){
			this.getHibernateTemplate().delete(c);
		}
		
	}

	@Override
	public void delectAdminById(int id) {
		Admin a=this.getHibernateTemplate().get(Admin.class, id);
		if(a!=null){
			this.getHibernateTemplate().delete(a);
		}
		
	}

	@Override
	public void addAdmin(Admin admin) {
		this.getHibernateTemplate().save(admin);
		
	}

	@Override
	public Admin findAdminByName(String name) {
		String hql="from Admin where name=?";
		@SuppressWarnings("unchecked")
		List<Admin> a=this.getHibernateTemplate().find(hql,name);
		if(a.size()>0){
			return a.get(0);
		}
		return null;
	}

	@Override
	public Admin findAdminById(Integer aid) {
		return this.getHibernateTemplate().get(Admin.class, aid);
	}

	/**
	 * 修改管理员
	 * @param admin
	 */
	@Override
	public void updateAdmin(Admin admin) {
		this.getHibernateTemplate().update(admin);
		
	}

	/**
	 * 根据分类名称查询分类信息
	 * @param classifyName
	 * @return
	 */
	@Override
	public Classify findCateByName(String classifyName) {
		String hql="from Classify where classifyName=?";
		@SuppressWarnings("unchecked")
		List<Classify> list=this.getHibernateTemplate().find(hql,classifyName);
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}

	/**
	 * 新增分类
	 * @param cassify
	 */
	@Override
	public void addCate(Classify cassify) {
		this.getHibernateTemplate().save(cassify);
		
	}

	/**
	 * 修改分类
	 * @param cassify
	 */
	@Override
	public void updateCate(Classify cassify) {
		this.getHibernateTemplate().update(cassify);
	}

	/**
     * <p>Description: 后台删除商品发送通知给用户</p>
     * @param uaa
     */
    @Override
    public void saveSystemMessage(UserAndAdmin uaa) {
       this.getHibernateTemplate().save(uaa);
    }

	

}
