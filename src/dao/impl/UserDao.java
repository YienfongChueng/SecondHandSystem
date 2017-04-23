package dao.impl;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.IUserDao;
import model.Classify;
import model.Comment;
import model.PageBean;
import model.Product;
import model.User;

public class UserDao extends HibernateDaoSupport implements IUserDao {

	/**
	 * 发布供求信息
	 */
	@Override
	public void saveProduct(Product product) {
		this.getHibernateTemplate().saveOrUpdate (product);
		
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

	/**
	 * 查询商品
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> searchProductList(Map<Object, String> map) {
		String proName=map.get("keyword");
		String cid=map.get("cid");
		String condition=map.get("conditon");
		DetachedCriteria dc=DetachedCriteria.forClass(Product.class);
		if(proName!=null){
			proName="%"+map.get("keyword")+"%";
			dc.add(Restrictions.like("proName",proName, MatchMode.ANYWHERE));
		}
		if(cid!=null){
			dc.add(Restrictions.eq("classify.cid",Integer.parseInt(cid)));
		}
		if(condition!=null){
			switch(condition){
			case "5":
				dc.add(Restrictions.eq("type",1));
				break;
			case "4":
				dc.add(Restrictions.eq("type",0));
				break;
			case "1":
				dc.addOrder(Order.desc("proClicknum"));
				break;
			case "2":
				dc.addOrder(Order.asc("proPrice"));
				break;
			case "3":
				dc.addOrder(Order.desc("proPrice"));
				break;
			}
		}
						
		List<Product> list=this.getHibernateTemplate().findByCriteria(dc,Integer.parseInt(map.get("begin")),Integer.parseInt(map.get("pageSize")));
		return list;
	}

	/**
	 * 查询商品数量
	 */
	@SuppressWarnings("unchecked")
	@Override
	public int searchProductCount(Map<Object, String> map) {
		StringBuffer br=new StringBuffer();
		StringBuffer order=new StringBuffer();
		String proName=map.get("keyword");
		String cid=map.get("cid");
		String condition=map.get("conditon");
		String count_hql="select count(*) from Product where 1=1";
		if(proName!=null){
			proName="%"+map.get("keyword")+"%";
			br.append(" and proName like '"+proName+"'");
		}
		if(cid!=null){
			br.append(" and classify.cid='"+Integer.parseInt(cid)+"'");
		}
		if(condition!=null){
			order.append(" order by createTime DESC");
			switch(condition){
			case "1":
				order.append(" ,proClicknum DESC");
				break;
			case "2":
				order.append(" ,proPrice ASC");
				break;
			case "3":
				order.append(" ,proPrice DESC");
				break;
			case "4":
				br.append(" and type=0");
				break;
			case "5":
				br.append(" and type=1");
				break;
			}
		}
		List<Long> list=this.getHibernateTemplate().find(count_hql+br.toString()+order.toString());
		if(list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	/**
	 * 查询商品详情
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Product getProductDetail(String id) {
		int pid=0;
		if(id!=null&&id!=""){
			pid=Integer.parseInt(id);
		}
		String hql=" from Product where id=?";
		List<Product> list=this.getHibernateTemplate().find(hql,pid);
		if(list.size()>0){
			Product p=list.get(0);
			return p;
		}
		return null;
	}

	/**
	 * 通过id查询某商品下的评论
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> getCommentList(String id,Map<Object, String> map) {
		int pid=0;
		if(id!=null&&id!=""){
			pid=Integer.parseInt(id);
		}
		DetachedCriteria dc=DetachedCriteria.forClass(Comment.class);
		dc.add(Restrictions.eq("product.id",pid));
		List<Comment> list=this.getHibernateTemplate().findByCriteria(dc,Integer.parseInt(map.get("begin")),Integer.parseInt(map.get("pageSize")));
		return list;
	}

	/**
	 * 通过id查询某商品下的评论数量
	 * @param map
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public int searchCommentCount(String id) {
		int pid=0;
		if(id!=null&&id!=""){
			pid=Integer.parseInt(id);
		}
		String count_hql="select count(*) from Comment where product.id='"+pid+"'";
		List<Long> list=this.getHibernateTemplate().find(count_hql);
		if(list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public Classify getClassifyById(Integer classifyId) {
		String hql="from Classify where cid=?";
		@SuppressWarnings("unchecked")
		List<Classify> c=this.getHibernateTemplate().find(hql, classifyId);
		if(c.size()>0){
			Classify cla=c.get(0);
			return cla;
		}
		return null;
	}

	@Override
	public User getUserById(Integer creatorId) {
		String hql="from User where uid=?";
		@SuppressWarnings("unchecked")
		List<User> u=this.getHibernateTemplate().find(hql, creatorId);
		if(u.size()>0){
			User user=u.get(0);
			return user;
		}
		return null;
	}

	@Override
	public void updateProduct(Product product) {
		this.getHibernateTemplate().update(product);
		
	}

}
