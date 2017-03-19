package action;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import service.IAdminInfoService;
import service.ILoginService;
import model.Admin;
import model.Classify;
import model.PageBean;
import model.Product;
import model.User;


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
	public String Exitlogin(){
		HttpServletRequest req=ServletActionContext.getRequest();
		req.getSession().removeAttribute("Admin");
		return "adminLogin";
	}
	
	private int currPage=1;//当前页
	
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}


	/**
	 * 查询所有管理员
	 */
	public String findAllAdminInfo(){
		PageBean<Admin> pageBean=this.iAdminInfoService.findAllAdminInfo(currPage);
		if(pageBean!=null){
			ActionContext.getContext().getValueStack().push(pageBean);
		}
		return "adminList";

	}
	
	/**
	 * 查询所有用户
	 */
	public String findAllUserInfo(){
		HttpServletRequest req=ServletActionContext.getRequest();
		String name=req.getParameter("userName");
		if(name==null){
			name="";
		}
		PageBean<User> pageBean=this.iAdminInfoService.findAllUserInfo(currPage,name);
		if(pageBean!=null){
			ActionContext.getContext().getValueStack().push(pageBean);
		}
		return "userList";
		
	}
	/**
	 * 查询所有分类
	 */
	public String findAllCateInfo(){
		HttpServletRequest req=ServletActionContext.getRequest();
		String name=req.getParameter("classifyName");
		if(name==null){
			name="";
		}
		PageBean<Classify> pageBean=this.iAdminInfoService.findAllCateInfo(currPage,name);
		if(pageBean!=null){
			ActionContext.getContext().getValueStack().push(pageBean);
		}
		return "cateList";
		
	}
	
	/**
	 * 查询所有商品 
	 */
	public String findAllProductInfo(){
		HttpServletRequest req=ServletActionContext.getRequest();
		String name=req.getParameter("proName");
		String cate=req.getParameter("select_class");
		String type=req.getParameter("select_type");
		int cate1=0;
		int type1=2;
		if(name==null){
			name="";
		}
		if(cate!=null&&cate!=""){
			 cate1=Integer.parseInt(req.getParameter("select_class"));
		}
		if(type!=null&&type!=""){
			 type1=Integer.parseInt(req.getParameter("select_type"));		
		}
		PageBean<Product> pageBean=this.iAdminInfoService.findAllProductInfo(currPage,name,cate1,type1);
		if(pageBean!=null){
			ActionContext.getContext().getValueStack().push(pageBean);
		}
		List<Classify> cateList=this.iAdminInfoService.findAllCateList();
		if(cateList!=null){
			ActionContext.getContext().put("cateList", cateList);
		}
		return "productList";
		
	}
	
	
	/**
	 * 查询单个商品详情信息
	 */
	public String searchProductDetail(){
		HttpServletRequest req=ServletActionContext.getRequest();
		int pid=Integer.parseInt(req.getParameter("id"));
		Product product=this.iAdminInfoService.searchProductDetail(pid);
		if(product!=null){
			ActionContext.getContext().put("product", product);
		}
		return "productDetail";
	}
	/**
	 * 根据id删除单个商品
	 */
	public String delectProductById(){
		HttpServletRequest req=ServletActionContext.getRequest();
		int pid=Integer.parseInt(req.getParameter("id"));
		this.iAdminInfoService.delectProductById(pid);
		return "success";
	}
	
	/**
	 * 查询用户详情信息
	 * @return
	 */
	public String searchUserDetail(){
		HttpServletRequest req=ServletActionContext.getRequest();
		int uid=Integer.parseInt(req.getParameter("uid"));
		User user=this.iAdminInfoService.searchUserDetail(uid);
		if(user!=null){
			ActionContext.getContext().put("user", user);
		}
		return "userDetail";
	}
	
	/**
	 * 根据id删除分类
	 */
	public String delectCateById(){
		HttpServletRequest req=ServletActionContext.getRequest();
		int id=Integer.parseInt(req.getParameter("id"));
		this.iAdminInfoService.delectCateById(id);
		return "delCatesuccess";
	}
	
	/**
	 * 根据id删除管理员
	 */
	public String delectAdminById(){
		HttpServletRequest req=ServletActionContext.getRequest();
		int id=Integer.parseInt(req.getParameter("id"));
		this.iAdminInfoService.delectAdminById(id);
		return "delAdminsuccess";
	}
	
	/**
	 * 新增管理员
	 */
	public String addAdmin(){
		Admin a=this.iAdminInfoService.findAdminByName(admin.getName());
		if(a!=null){
			this.addActionError("该账号已存在!");
			return "addAdminFail";
		}
		this.iAdminInfoService.addAdmin(admin);
		return "addAdminSucess";
	}
	/**
	 * 管理员修改前回显内容
	 */
	public String findAdminById(){
		admin=this.iAdminInfoService.findAdminById(admin.getAid());
		ActionContext.getContext().put("admin", admin);
		return "findAdminSuccess";
	}
	/**
	 * 管理员修改
	 */
	public String updateAdmin(){
		/*Admin a=this.iAdminInfoService.findAdminByName(admin.getName());
		if(a!=null){
			this.addActionError("该账号已存在!");
			return "updateAdminFail";
		}*/
		this.iAdminInfoService.updateAdmin(admin);
		return "updateAdminSuccess";
		
	}
	
	
	Classify cassify=new Classify();
	
	public Classify getCassify() {
		return cassify;
	}

	public void setCassify(Classify cassify) {
		this.cassify = cassify;
	}

	private String classifyName;
	private Integer classifySort;
	private Integer cid;
	public String getClassifyName() {
		return classifyName;
	}

	public void setClassifyName(String classifyName) {
		this.classifyName = classifyName;
	}

	public Integer getClassifySort() {
		return classifySort;
	}

	public void setClassifySort(Integer classifySort) {
		this.classifySort = classifySort;
	}

	
	public Integer getCid() {
		return cid;
	}


	public void setCid(Integer cid) {
		this.cid = cid;
	}


	/**
	 * 新增分类
	 */
	public String addCate(){
		cassify.setClassifyName(classifyName);
		cassify.setClassifySort(classifySort);
		Classify c=this.iAdminInfoService.findCateByName(classifyName);
		if(c!=null){
			this.addActionError("该分类已存在!");
			return "addCateFail";
		}
		this.iAdminInfoService.addCate(cassify);
		return "addCateSucess";
	}
	
	/**
	 * 修改分类前回显
	 */
	public String findCateByName(){
		HttpServletRequest req=ServletActionContext.getRequest();
		String cname=req.getParameter("cname");
		Classify c=this.iAdminInfoService.findCateByName(cname);
		ActionContext.getContext().put("cate", c);
		return "findCateSuccess";
	}
	/**
	 * 修改分类
	 */
	public String updateCate(){
		/*Classify c=this.iAdminInfoService.findCateByName(classifyName);
		if(c!=null){
			this.addActionError("该分类已存在!");
			return "updateCateFail";
		}*/
		cassify.setCid(cid);
		cassify.setClassifyName(classifyName);
		cassify.setClassifySort(classifySort);
		this.iAdminInfoService.updateCate(cassify);
		return "updateCateSuccess";
		
	}


	
}
