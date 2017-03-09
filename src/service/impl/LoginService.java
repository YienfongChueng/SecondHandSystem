package service.impl;

import org.springframework.transaction.annotation.Transactional;

import dao.ILoginDao;
import model.Admin;
import model.User;
import service.ILoginService;
@Transactional
public class LoginService implements ILoginService{

	private ILoginDao iLoginDao;
	
	public void setiLoginDao(ILoginDao iLoginDao) {
		this.iLoginDao = iLoginDao;
	}

	@Override
	public User findByUser(User user) {
		
		return iLoginDao.findByUser(user);
	}

	@Override
	public Admin findByAdmin(Admin admin) {
		
		return iLoginDao.findByAdmin(admin);
	}

	

}
