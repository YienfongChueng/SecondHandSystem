package service;

import java.util.List;
import java.util.Map;

import model.User;
import model.Classify;
import model.Comment;
import model.PageBean;
import model.Product;

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

}
