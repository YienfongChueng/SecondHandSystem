package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import model.Classify;
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
		this.json.toJson(list);
	}
}
