package action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import model.Comment;
import model.Classify;
import model.PageBean;
import model.Product;
import model.User;
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
	private File proPictureFile;
	private String proPictureFileFileName;
	private String proPictureContentType;
	private final int BUFFER_SIZE=16*1024;
	private Integer classifyId;
	
	public Integer getClassifyId() {
		return classifyId;
	}
	public void setClassifyId(Integer classifyId) {
		this.classifyId = classifyId;
	}
	public File getProPictureFile() {
		return proPictureFile;
	}
	public void setProPictureFile(File proPictureFile) {
		this.proPictureFile = proPictureFile;
	}
	
	public String getProPictureContentType() {
		return proPictureContentType;
	}
	public void setProPictureContentType(String proPictureContentType) {
		this.proPictureContentType = proPictureContentType;
	}
	public String getProPictureFileFileName() {
		return proPictureFileFileName;
	}
	public void setProPictureFileFileName(String proPictureFileFileName) {
		this.proPictureFileFileName = proPictureFileFileName;
	}
	/**
	 * 发布供求信息
	 */
	public String addProduct() throws Exception{
		String newFileName=new Date().getTime()+getExtention(proPictureFileFileName);
		String path=ServletActionContext.getServletContext().getRealPath("/upload");
		//String path=ProductAction.class.getResource("/upload").getPath();
		File picFile=new File(path);
		if(!picFile.exists()){
			picFile.mkdir();
		}
		FileUtil.copyFile(proPictureFile, new File(picFile,newFileName));
		//copy(proPictureFile,picFile);
		product.setProPicture(newFileName);
		product.setCreateTime(new Date());
		product.setProClicknum(0);
		Classify c=this.iUserService.getClassifyById(product.getClassifyId());
		User u=this.iUserService.getUserById(product.getCreatorId());
		product.setClassify(c);
		product.setUser(u);
		this.iUserService.saveProduct(product);
		this.addActionMessage("发布成功！");
		return "uploadSuccess";
		
	}
	private void copy(File src, File dst)throws IOException {
		InputStream in=null;
		OutputStream out=null;
		try {
			in=new BufferedInputStream(new FileInputStream(src),BUFFER_SIZE);
			out=new BufferedOutputStream(new FileOutputStream(dst),BUFFER_SIZE);
			byte[] buffer=new byte[BUFFER_SIZE];
			while(in.read(buffer)>0){
				out.write(buffer);
			}
		} catch (Exception e) {
			throw e;
		}finally{
			try {
				in.close();
			} catch (Exception e2) {
				
			}
			try {
				out.close();
			} catch (Exception e2) {
				
			}
		}
		
	}
	private String getExtention(String filename) {
		int pos=filename.lastIndexOf(".");
		return filename.substring(pos);
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
		int clickNum=product.getProClicknum();
		product.setProClicknum(clickNum+1);
		this.iUserService.updateProduct(product);
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
	
	public void addToCart(){
		
	}
	
	
	
	
	
	
	
}
