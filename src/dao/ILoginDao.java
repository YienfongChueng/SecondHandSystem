package dao;

import model.Admin;
import model.User;

public interface ILoginDao {

	User findByUser(User user);
	Admin findByAdmin(Admin admin);
}
