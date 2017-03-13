package dao;

import java.util.List;

import model.Admin;

public interface IAdminInfoDao {

	List<Admin> findAllAdminInfo(int begin, int pageSize);

	int findAdminCount();

}
