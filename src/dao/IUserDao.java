package dao;

import java.util.List;
import java.util.Map;

import model.Classify;
import model.Comment;
import model.MyCart;
import model.Order;
import model.Product;
import model.User;

public interface IUserDao {

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
	List<Product> searchProductList(Map<Object, String> map);

	/**
	 * 查询商品数量
	 * @param map
	 * @return
	 */
	int searchProductCount(Map<Object, String> map);

	/**
	 * 查询商品详情
	 * @param id
	 * @return
	 */
	Product getProductDetail(String id);

	/**
	 * 通过id查询某商品下的评论
	 * @param id
	 * @return
	 */
	List<Comment> getCommentList(String id,Map<Object, String> map);

	/**
	 * 通过id查询某商品下的评论数量
	 * @param map
	 * @return
	 */
	int searchCommentCount(String id);

	/**
	 * 通过分类id获取分类信息
	 * @param classifyId
	 */
	Classify getClassifyById(Integer classifyId);

	User getUserById(Integer creatorId);

    void updateProduct(Product product);

    /**
     * 获取我的购物车数量
     * @param uid
     * @return
     */
	int searchMyCartCount(int uid);

	/**
	 * 获取我的购物车
	 * @param map
	 * @return
	 */
	List<MyCart> getMyCartList(Map<Object, String> map);

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
     * <p>Description: 保存订单信息</p>
     * @param order
     */
    void saveOrder(Order order,String ids);

    /**
     * <p>Description: 清除购物车选中的商品</p>
     * @param ids
     */
    void deleteChooseFromCart(String ids);

}
