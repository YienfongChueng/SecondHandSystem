package action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import service.ILoginService;
import service.IUserService;
import util.AddJson;
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
	

	HttpServletRequest req=ServletActionContext.getRequest();
	
	/**
	 * 用户登录
	 * @return
	 */
	public String UserLogin(){
		//HttpServletRequest req=ServletActionContext.getRequest();
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
		//HttpServletRequest req=ServletActionContext.getRequest();
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
		//HttpServletRequest req=ServletActionContext.getRequest();
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
	
	/**
	 * 查询用户账号信息
	 * @throws IOException 
	 */
	public void searchPersonalInfo() throws IOException{
		//HttpServletRequest req=ServletActionContext.getRequest();
		int uid=Integer.parseInt(req.getParameter("uid"));
		user=this.iLoginService.searchUserInfoById(uid);
		AddJson json=new AddJson();
		json.toJson(user);
		//return "findUserInfoSuccess";
		
	}
	
	/**
	 * 修改用户信息
	 */
	public void updateUserInfoById(){
		int uid=Integer.parseInt(req.getParameter("uid"));
		String uname=req.getParameter("userName");
		String pass=req.getParameter("password");
		String uclass=req.getParameter("schoolClass");
		String address=req.getParameter("address");
		int phone=Integer.parseInt(req.getParameter("phone"));
		String qusetion=req.getParameter("qusetion");
		String answer=req.getParameter("answer");
		int sex=Integer.parseInt(req.getParameter("sex"));
		User uu=new User();
		uu.setAddress(address);
		uu.setAnswer(answer);
		uu.setPassword(pass);
		uu.setPhone(phone);
		uu.setSchoolClass(uclass);
		uu.setUid(uid);
		uu.setUserName(uname);
		uu.setQusetion(qusetion);
		uu.setSex(sex);
		this.iLoginService.updateUser(uu);
		
	}

	/**
	 * 用户退出的登录
	 */
	public String userExitLogin(){
		req.getSession().removeAttribute("User");
		return "UserexitSuccess";
	}
	
	
	

}
