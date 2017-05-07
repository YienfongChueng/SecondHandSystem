package dao;

import java.util.List;
import java.util.Map;

import model.Classify;
import model.Comment;
import model.MyCart;
import model.Order;
import model.Product;
import model.Reply;
import model.User;
import model.UserAndAdmin;

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
    List<MyCart> getMyCartChooseList(String ids,int uid);

    /**
     * <p>Description: 保存订单信息</p>
     * @param order
     */
    void saveOrder(Order order,String ids,int uid);

    /**
     * <p>Description: 清除购物车选中的商品</p>
     * @param ids
     */
    void deleteChooseFromCart(String ids);

    /**
     * <p>Description: 查询我的订单数量(卖出的)</p>
     * @param uid
     * @return
     */
    int searchMyOrderCount(String uid);

    /**
     * <p>Description: 查询我的订单列表(卖出的)</p>
     * @param map
     * @return
     */
    List<Order> getMyOrderList(Map<Object, String> map);

    /**
     * <p>Description: 买入的订单数量</p>
     * @param parseInt
     * @return
     */
    int searchBuyOrderCount(int parseInt);

    /**
     * <p>Description: 买入的订单列表</p>
     * @param map
     * @return
     */
    List<Order> getBuyOrderList(Map<Object, String> map);

    /**
     * <p>Description: 查询我发布的商品列表数量</p>
     * @param parseInt
     * @return
     */
    int searchMyProductCount(int parseInt);

    /**
     * <p>Description: 查询我发布的商品列表信息</p>
     * @param map
     * @return
     */
    List<Product> getMyProductList(Map<Object, String> map);

    /**
     * <p>Description: 新增一条评论</p>
     * @param comm
     */
    void saveComment(Comment comm);

    /**
     * <p>Description: 查询评论详情</p>
     * @param id
     * @return
     */
    Comment searchCommentDetail(int id);

    /**
     * <p>Description: 新增一条评论</p>
     * @param r
     */
    void saveReply(Reply r);

    /**
     * <p>Description: 通过oid删除我卖出的订单</p>
     * @param oid
     */
    void deleteMySellOrder(String oid);

    /**
     * <p>Description: 删除我发布的商品</p>
     * @param pid
     */
    void delectProductById(int pid);

    /**
     * <p>Description: 评论数量</p>
     * @param parseInt
     * @param string
     * @return
     */
    int searchCommentCount(int uid, String flag);

    /**
     * <p>Description: 评论列表查询</p>
     * @param map
     * @return
     */
    List<Comment> getCommentList(Map<Object, String> map);

    /**
     * <p>Description: 保存用户消息</p>
     * @param map
     * @return
     */
	void saveUserMessage(UserAndAdmin uaa);

	/**
     * <p>Description: 保存用户消息数量</p>
     * @param map
     * @return
     */
	int searchMessageCount(int uid, String flag);

	/**
     * <p>Description: 保存用户消息</p>
     * @param map
     * @return
     */
	List<UserAndAdmin> getMessageList(Map<Object, String> map);

	/**
	 * 通过id删除消息
	 */
	void deleteMessage(int id);


    
}
