package service;

import model.Admin;
import model.User;

public interface ILoginService {

	User findByUser(User user);
	Admin findByAdmin(Admin admin);
}
