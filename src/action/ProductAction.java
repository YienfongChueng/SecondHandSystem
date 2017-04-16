package action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import model.Comment;
import model.Classify;
import model.PageBean;
import model.Product;
import service.IUserService;
import util.AddJson;

public class ProductAction extends ActionSupport implements ModelDriven<Product>{

	IUserService iUserService;
	public void setiUserService(IUserService iUserService) {
		this.iUserService = iUserService;
	}
	Product product=new Product();
	@Override
	public Product getModel() {
		return product;
	}
	HttpServletRequest req=ServletActionContext.getRequest();
	AddJson json=new AddJson();
	private int currPage=1;//当前页
	
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	/**
	 * 发布供求信息
	 */
	public void addProduct(){
		this.iUserService.saveProduct(product);
	}
	/**
	 * 查询分类列表
	 * @throws IOException 
	 */
	public void searchClassifyList() throws IOException{
		List<Classify> list=this.iUserService.searchClassifyList();
		this.json.toJsonArray(list);
	}
	
	/**
	 * 查询商品列表
	 */
	public void searchProductList() throws Exception{
		String keyword=req.getParameter("keyword");
		String cid=req.getParameter("cid");
		String conditon=req.getParameter("condition");
		Map<Object,String> map=new HashMap<Object,String>();
		if(keyword!=null&&keyword!=""){
			map.put("keyword", keyword);
		}
		if(cid!=null&&cid!=""){
			map.put("cid", cid);
		}
		if(conditon!=null&&conditon!=""){
			map.put("conditon", conditon);
		}
		map.put("currPage", currPage+"");
		PageBean<Product> proList=this.iUserService.searchProductList(map);
		List<Product> list=new ArrayList<Product>();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		if(proList!=null){
			list=proList.getList();
			for(Product p:list){
				p.setTime(sdf.format(p.getCreateTime()));
			}
		}
		
		this.json.toJsonObj(proList);
	}
	
	/**
	 * 查询商品详情
	 */
	public void getProductDetail() throws Exception{
		String id=req.getParameter("id");
		Product product=this.iUserService.getProductDetail(id);
		this.json.toJson(product);
	}
	/**
	 * 通过id查询某商品下的评论
	 */
	public void getCommentList() throws Exception{
		String id=req.getParameter("id");
		Map<Object, String> map=new HashMap<Object, String>();
		map.put("currPage", currPage+"");
		PageBean<Comment> comment=this.iUserService.getCommentList(id,map);
		this.json.toJson(comment);
	}
}
