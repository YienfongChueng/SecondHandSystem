package service;

import java.util.List;
import java.util.Map;

import model.Classify;
import model.Comment;
import model.MyCart;
import model.Order;
import model.PageBean;
import model.Product;
import model.User;

public interface IUserService {

	/**
	 * 发布供求信息
	 * @param product
	 */
	void saveProduct(Product product);

	/**
	 * 查询分类列表
	 * @return
	 */
	List<Classify> searchClassifyList();

	/**
	 * 查询商品
	 * @param map
	 * @return
	 */
	PageBean<Product> searchProductList(Map<Object, String> map);

	/**
	 * 查询商品详情
	 * @param id
	 * @return
	 */
	Product getProductDetail(String id);

	/**
	 * 通过商品id查询该商品下的评论
	 * @param id
	 * @return
	 */
	PageBean<Comment> getCommentList(String id,Map<Object, String> map);

	/**
	 * 通过分类id获取分类信息
	 * @param classifyId
	 */
	Classify getClassifyById(Integer classifyId);

	User getUserById(Integer creatorId);

	void updateProduct(Product product);

	/**
	 * 获取我的购物车列表
	 */
	PageBean<MyCart> getMyCart(Map<Object, String> map);

	/**
	 * 获取购物车列表，不分页
	 * @param uid
	 * @return
	 */
	List<MyCart> getMyCartList(Integer uid);

	/**
	 * 保存或更新购物车
	 * @param cart
	 */
	void saveOrUpdate(MyCart cart);

	/**
	 * 清空或删除某一购物车
	 * @param id
	 * @param uid
	 */
	void deleteCart(String id, Integer uid);

	/**
	 * 查询用户勾选的商品信息列表
	 * @param ids
	 * @return
	 */
	List<Product> getComfirmProductList(String ids);

    /**
     * <p>Description: 查询用户勾选购物车里的商品信息</p>
     * @param ids
     * @return
     */
    List<MyCart> getMyCartChooseList(String ids);

    /**
     * <p>Description: 级联保存订单和订单子表</p>
     * @param order
     */
    void saveOrder(Order order,String ids);

	
	

}
