package action;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import service.ILoginService;
import model.User;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements ModelDriven<User>{

	User user=new User();
	@Override
	public User getModel() {
		
		return user;
	}

	ILoginService iLoginService;
	public void setiLoginService(ILoginService iLoginService) {
		this.iLoginService = iLoginService;
	}
	
	/**
	 * 用户登录
	 * @return
	 */
	public String UserLogin(){
		HttpServletRequest req=ServletActionContext.getRequest();
		if(user==null){
			this.addActionError("请输入账号和密码!");
			return "login";
		}
		
		User u=this.iLoginService.findByUser(user);
		if(u==null){
			this.addActionError("用户名或密码错误!");
			return "login";
		}else{
			req.getSession().setAttribute("User", u);
			return "index";
		}
	}
	
	

	
	

}
