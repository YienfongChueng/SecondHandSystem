package dao;

import java.util.List;
import java.util.Map;

import model.Classify;
import model.Comment;
import model.PageBean;
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

}
