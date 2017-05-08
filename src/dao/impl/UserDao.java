package dao.impl;

import java.util.List;
import java.util.Map;

import model.Classify;
import model.Comment;
import model.MyCart;
import model.Product;
import model.Reply;
import model.User;
import model.UserAndAdmin;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dao.IUserDao;

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
		//dc.addOrder(Order.desc("createTime"));
		dc.add(Restrictions.ne("proHassum", 0));
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
		String count_hql="select count(*) from Product where 1=1 and proHassum!='0'";
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
		dc.addOrder(Order.desc("creatTime"));
		 dc.setResultTransformer(dc.DISTINCT_ROOT_ENTITY);
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
		String count_hql="select count(distinct id) from Comment where product.id='"+pid+"'";
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

	@SuppressWarnings("unchecked")
	@Override
	public int searchMyCartCount(int uid) {
		String hql="select count(distinct id) from MyCart where userId=?";
		List<Long> list=this.getHibernateTemplate().find(hql,uid);
		if(list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	/**
	 * 分页查询我的购物车列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<MyCart> getMyCartList(Map<Object, String> map) {
		DetachedCriteria dc=DetachedCriteria.forClass(MyCart.class);
		dc.add(Restrictions.eq("userId",Integer.parseInt(map.get("userId"))));
		dc.addOrder(Order.desc("createTime"));
		dc.setResultTransformer(dc.DISTINCT_ROOT_ENTITY);
		List<MyCart> list=this.getHibernateTemplate().findByCriteria(dc,Integer.parseInt(map.get("begin")),Integer.parseInt(map.get("pageSize")));
		return list;
	}

	/**
	 * 获取购物车列表，不分页
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<MyCart> getMyCartList(Integer uid) {
		String hql="from MyCart where userId=?";
		return  this.getHibernateTemplate().find(hql,uid);
		
	}

	/**
	 * 保存或更新购物车
	 */
	@Override
	public void saveOrUpdate(MyCart cart) {
		this.getHibernateTemplate().saveOrUpdate(cart);
	}


	/**
	 * 清空或删除某一购物车
	 * @param id
	 * @param uid
	 */
	@Override
	public void deleteCart(String id, Integer uid) {
		StringBuffer sb=new StringBuffer();
		if(id!=""&&id!=null){
			sb.append(" and id='"+Integer.parseInt(id)+"'");
		}else{
			sb.append(" and userId='"+uid+"'");
		}
		String hql="delete from MyCart where 1=1"+sb.toString();
		SessionFactory factory=this.getHibernateTemplate().getSessionFactory();
		Session session=factory.openSession();
		Query query=session.createQuery(hql);
		query.executeUpdate();
		session.close();
		
	}

	/**
	 * 查询用户勾选的商品信息列表
	 * @param ids
	 * @return  
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getComfirmProductList(String ids) {
		String hql="from Product where id IN ("+ids+")";
		return this.getHibernateTemplate().find(hql);
	}

	 /**
     * <p>Description: 查询用户勾选购物车里的商品信息</p>
     * @param ids
     * @return
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<MyCart> getMyCartChooseList(String ids,int uid) {
        String hql="from MyCart where productId IN ("+ids+") and userId="+uid;
        return this.getHibernateTemplate().find(hql);
    }

    /**
     * 保存订单信息
     */
    @Override
    public void saveOrder(model.Order order,String ids,int uid) {
       this.getHibernateTemplate().save(order);
       String hql="delete from MyCart where productId IN ("+ids+") and userId="+uid;
       SessionFactory factory=this.getHibernateTemplate().getSessionFactory();
       Session session=factory.openSession();
       Query query=session.createQuery(hql);
       query.executeUpdate();
       session.close();
    }

   /**
    * 清除购物车已购买的商品
    */
    @Override
    public void deleteChooseFromCart(String ids) {
      
    }

    /**
     * <p>Description: 查询我的订单数量(卖出的)</p>
     * @param parseInt
     * @return
     */
@Override
public int searchMyOrderCount(String uid) {
    String hql="select count(distinct id) from Order where creatorId LIKE ?";
    List<Long> list=this.getHibernateTemplate().find(hql,"%"+uid+"%");
    if(list.size()>0){
        return list.get(0).intValue();
    }
    return 0;
}

/**
 * <p>Description: 查询我的订单列表(卖出的)</p>
 * @param map
 * @return
 */
@SuppressWarnings("unchecked")
@Override
public List<model.Order> getMyOrderList(Map<Object, String> map) {
    DetachedCriteria dc=DetachedCriteria.forClass(model.Order.class);
    dc.add(Restrictions.like("creatorId",map.get("userId"),MatchMode.ANYWHERE));
    //dc.setProjection(Projections.distinct(Projections.property("id")));
    dc.addOrder(Order.desc("createTime"));
    dc.setResultTransformer(dc.DISTINCT_ROOT_ENTITY);
    List<model.Order> list=this.getHibernateTemplate().findByCriteria(dc,Integer.parseInt(map.get("begin")),Integer.parseInt(map.get("pageSize")));
    return list;
}

/**
 * <p>Description: 买入的订单数量</p>
 * @param parseInt
 * @return
 */
@Override
public int searchBuyOrderCount(int uid) {
    String hql="select count(distinct id) from Order where user.uid = ?";
    List<Long> list=this.getHibernateTemplate().find(hql,uid);
    if(list.size()>0){
        return list.get(0).intValue();
    }
    return 0;
}

/**
 * <p>Description: 买入的订单列表</p>
 * @param map
 * @return
 */
@Override
public List<model.Order> getBuyOrderList(Map<Object, String> map) {
    DetachedCriteria dc=DetachedCriteria.forClass(model.Order.class);
    dc.add(Restrictions.eq("user.uid",Integer.parseInt(map.get("userId"))));
    dc.addOrder(Order.desc("createTime"));
    dc.setResultTransformer(dc.DISTINCT_ROOT_ENTITY);
    List<model.Order> list=this.getHibernateTemplate().findByCriteria(dc,Integer.parseInt(map.get("begin")),Integer.parseInt(map.get("pageSize")));
    return list;
}

/**
 * <p>Description: 查询我发布的商品列表数量</p>
 * @param parseInt
 * @return
 */
@Override
public int searchMyProductCount(int uid) {
    String hql="select count(*) from Product where user.uid = ?";
    List<Long> list=this.getHibernateTemplate().find(hql,uid);
    if(list.size()>0){
        return list.get(0).intValue();
    }
    return 0;
}

/**
 * <p>Description: 查询我发布的商品列表信息</p>
 * @param map
 * @return
 */
@Override
public List<Product> getMyProductList(Map<Object, String> map) {
    DetachedCriteria dc=DetachedCriteria.forClass(model.Product.class);
    dc.add(Restrictions.eq("user.uid",Integer.parseInt(map.get("userId"))));
    dc.addOrder(Order.desc("createTime"));
    List<model.Product> list=this.getHibernateTemplate().findByCriteria(dc,Integer.parseInt(map.get("begin")),Integer.parseInt(map.get("pageSize")));
    return list;
}

/**
 * <p>Description: 新增一条评论</p>
 * @param comm
 */
@Override
public void saveComment(Comment comm) {
   this.getHibernateTemplate().save(comm);
    
}

/**
 * <p>Description: 查询评论详情</p>
 * @param id
 * @return
 */
@Override
public Comment searchCommentDetail(int id) {
    String hql="from Comment where id=?";
    List<Comment> list=this.getHibernateTemplate().find(hql,id);
    if(list.size()>0){
        Comment c=list.get(0);
        return c;
    }
    return null;
}

/**
 * <p>Description: 新增一条评论</p>
 * @param r
 */
@Override
public void saveReply(Reply r) {
    this.getHibernateTemplate().save(r);
}

/**
 * <p>Description: 通过oid删除我卖出的订单</p>
 * @param oid
 */
@Override
public void deleteMySellOrder(String oid) {
   String hql="delete from Order where id='"+oid+"'";
   SessionFactory factory=this.getHibernateTemplate().getSessionFactory();
   Session session=factory.openSession();
   Query query=session.createQuery(hql);
   query.executeUpdate();
   session.close();
    
}

/**
 * <p>Description: 删除我发布的商品</p>
 * @param pid
 */
@Override
public void delectProductById(int pid) {
    Product product=this.getHibernateTemplate().get(Product.class, pid);
    if(product!=null){
        this.getHibernateTemplate().delete(product);
    }
    
}

/**
 * <p>Description: 评论数量</p>
 * @param parseInt
 * @param string
 * @return
 */
@Override
public int searchCommentCount(int uid, String flag) {
    StringBuffer sb=new StringBuffer();
    String hql="select count(distinct id) from Comment where 1=1 ";
    if(flag=="0"||"0".equals(flag)){
       sb.append(" and user.uid="+uid);
    }else{
        sb.append(" and receiverId="+uid);
    }
    List<Long> list=this.getHibernateTemplate().find(hql+sb.toString());
    if(list.size()>0){
        return list.get(0).intValue();
    }
    return 0;
}

/**
 * <p>Description: 评论列表查询</p>
 * @param map
 * @return
 */
@Override
public List<Comment> getCommentList(Map<Object, String> map) {
    DetachedCriteria dc=DetachedCriteria.forClass(model.Comment.class);
    String flag=map.get("flag");
    if(flag=="0"||"0".equals(flag)){
        dc.add(Restrictions.eq("user.uid",Integer.parseInt( map.get("userId"))));
    }else{
        dc.add(Restrictions.eq("receiverId", Integer.parseInt(map.get("userId"))));
    }
    dc.setResultTransformer(dc.DISTINCT_ROOT_ENTITY);
    List<model.Comment> list=this.getHibernateTemplate().findByCriteria(dc,Integer.parseInt(map.get("begin")),Integer.parseInt(map.get("pageSize")));
    return list;
}

/**
 * <p>Description: 保存用户消息</p>
 * @param map
 * @return
 */
@Override
public void saveUserMessage(UserAndAdmin uaa) {
	this.getHibernateTemplate().save(uaa);
}

@Override
public int searchMessageCount(int uid, String flag) {
	StringBuffer sb=new StringBuffer();
    String hql="select count(*) from UserAndAdmin where 1=1 ";
    if(flag=="0"||"0".equals(flag)){
       sb.append(" and status='0' and userId="+uid);
    }else{
        sb.append(" and status='1' and userId="+uid);
    }
    List<Long> list=this.getHibernateTemplate().find(hql+sb.toString());
    if(list.size()>0){
        return list.get(0).intValue();
    }
    return 0;
}

@Override
public List<UserAndAdmin> getMessageList(Map<Object, String> map) {
	DetachedCriteria dc=DetachedCriteria.forClass(model.UserAndAdmin.class);
    String flag=map.get("flag");
    if(flag=="0"||"0".equals(flag)){
        dc.add(Restrictions.eq("userId",Integer.parseInt( map.get("userId"))));
        dc.add(Restrictions.eq("status",0));
    }else{
    	dc.add(Restrictions.eq("userId",Integer.parseInt( map.get("userId"))));
        dc.add(Restrictions.eq("status",1));
    }
    List<model.UserAndAdmin> list=this.getHibernateTemplate().findByCriteria(dc,Integer.parseInt(map.get("begin")),Integer.parseInt(map.get("pageSize")));
    return list;
}

/**
 * 通过id删除消息
 */
@Override
public void deleteMessage(int id) {
   String hql="delete from UserAndAdmin where id="+id;
   SessionFactory factory=this.getHibernateTemplate().getSessionFactory();
   Session session=factory.openSession();
   Query query=session.createQuery(hql);
   query.executeUpdate();
   session.close();
	
}


}
