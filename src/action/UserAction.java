package action;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import service.ILoginService;
import model.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User>{

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
	
	/**
	 * 用户注册
	 */
	public String userRegister(){
		//通过用户名先查询该用户是否已经注册
		User u=this.iLoginService.findUserByName(user.getUserName());
		if(u!=null){
			this.addActionError("该用户已被注册！");
			return "registerFail";
		}
		user.setHeadPic("images/logo-s.jpg");
		this.iLoginService.saveUser(user);
		return "registerSuccess";
	}
	
	/**
	 * 通过账号找回密码步骤1
	 */
	public String forgetPwd(){
		HttpServletRequest req=ServletActionContext.getRequest();
		String userName=req.getParameter("userName");
		User u=this.iLoginService.findUserByName(userName);
		if(u==null){
			this.addFieldError(userName, "用户名错误！");
			return "getPwdFail";
		}
		if(u.getQusetion()==null){
			this.addActionError("抱歉！你没有设置问题和密码！");
			return "getPwdFail";
		}
		req.getSession().setAttribute("User", u);
		return "getPwdSuccess";
		
	}
	/**
	 * 提交问题2
	 */
	public String checkAnswer(){
		HttpServletRequest req=ServletActionContext.getRequest();
		String answertext=req.getParameter("answer");
		User u=this.iLoginService.findUserByName(user.getUserName());
		if(u!=null){
			String answer=u.getAnswer();
			if(!answer.equals(answertext)){
				this.addActionError("抱歉！回答错误！");
				return "answerFalse";
			}
		}
		req.getSession().setAttribute("User", u);
		return "answerTrue";
		
	}
	
	/**
	 * 重新设置密码3
	 */
	public String updatePwd(){
		this.iLoginService.updatePed(user);
		return "updatePwdSuccess";
		
	}
	
	

	
	

}
