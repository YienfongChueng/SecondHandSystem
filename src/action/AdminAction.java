package action;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import service.IAdminInfoService;
import service.ILoginService;
import model.Admin;
import model.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminAction extends ActionSupport implements ModelDriven<Admin>{

	Admin admin=new Admin();
	@Override
	public Admin getModel() {
		return admin;
	}

	ILoginService iLoginService;
	public void setiLoginService(ILoginService iLoginService) {
		this.iLoginService = iLoginService;
	}
	
	IAdminInfoService iAdminInfoService;
	public void setiAdminInfoService(IAdminInfoService iAdminInfoService) {
		this.iAdminInfoService = iAdminInfoService;
	}


	/**
	 * 管理员登录
	 */
	public String AdminLogin(){
		HttpServletRequest req=ServletActionContext.getRequest();
		if(admin==null){
			this.addActionError("请输入账号和密码!");
			return "adminLogin";
		}
		Admin a=this.iLoginService.findByAdmin(admin);
		if(a==null){
			this.addActionError("管理员帐户或密码错误!");
			return "adminLogin";
		}else{
			req.getSession().setAttribute("Admin", admin);
			return "adminIndex";
		}
	}
	
	/**
	 * 注销登录
	 */
	public void Exitlogin(){
		HttpServletRequest req=ServletActionContext.getRequest();
		req.getSession().removeAttribute("Admin");
	}
	
	private int currPage=1;//当前页
	
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}


	/**
	 * 查询所有管理员
	 */
	public String findAllAdminInfo(){
		PageBean<Admin> pageBean=this.iAdminInfoService.findAllAdminInfo(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "adminList";

	}
}
