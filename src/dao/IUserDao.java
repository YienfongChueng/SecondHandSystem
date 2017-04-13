package dao;

import java.util.List;

import model.Classify;
import model.Product;

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

}
