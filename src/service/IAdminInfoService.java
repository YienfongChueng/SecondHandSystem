package service;
import model.Admin;
import model.PageBean;

public interface IAdminInfoService {

	PageBean<Admin> findAllAdminInfo(int currPage);

}
