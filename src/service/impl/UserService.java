package service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import dao.IUserDao;
import model.Classify;
import model.Product;
import service.IUserService;
@Transactional
public class UserService implements IUserService {

	private IUserDao iUserDao;

	public void setiUserDao(IUserDao iUserDao) {
		this.iUserDao = iUserDao;
	}

	/**
	 * 发布供求信息
	 */
	@Override
	public void saveProduct(Product product) {
		this.iUserDao.saveProduct(product);
		
	}

	/**
	 * 查询分类列表
	 */
	@Override
	public List<Classify> searchClassifyList() {
		
		return this.iUserDao.searchClassifyList();
	}
	
}
