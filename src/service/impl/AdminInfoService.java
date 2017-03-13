package service.impl;

import java.util.List;

import dao.IAdminInfoDao;
import model.Admin;
import model.PageBean;
import service.IAdminInfoService;

public class AdminInfoService implements IAdminInfoService {

	IAdminInfoDao iAdminInfoDao;
	public void setiAdminInfoDao(IAdminInfoDao iAdminInfoDao) {
		this.iAdminInfoDao = iAdminInfoDao;
	}
	@Override
	public PageBean<Admin> findAllAdminInfo(int currPage) {
		PageBean<Admin> pageBean=new PageBean<Admin>();
		//封装当前页
		pageBean.setCurrPage(currPage);
		//封装每页记录数
		int pageSize=10;
		pageBean.setPageSize(pageSize);
		//封装总记录数
		int totalCount=this.iAdminInfoDao.findAdminCount();
		pageBean.setTotalCount(totalCount);
		//封装总页数
		double tc=totalCount;
		Double num=Math.ceil(tc/pageSize);
		pageBean.setTotalPage(num.intValue());
		//封装每页显示的数据
		int begin=(currPage-1)*pageSize;
		List<Admin> list=this.iAdminInfoDao.findAllAdminInfo(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	

}
