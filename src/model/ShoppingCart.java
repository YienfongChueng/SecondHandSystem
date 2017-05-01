package model;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class ShoppingCart {

	//购买商品的集合
	private HashMap<Product,Integer> goods;
	//购物车的总金额
	private double totalPrice;
	
	//构造方法
	public ShoppingCart(){
		goods=new HashMap<Product,Integer>();
		totalPrice=0.0;
	}
	public HashMap<Product, Integer> getGoods() {
		return goods;
	}
	public void setGoods(HashMap<Product, Integer> goods) {
		this.goods = goods;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	//添加商品进购物车的方法
	public void addGoodsInCart(Product item,int num){
		if(goods.containsKey(item)){//有相同名称的key
			goods.put(item, goods.get(item)+num);
		}else{
			goods.put(item, num);
			
		}
		calTotalPrice();//重新计算购物车的总金额
	}
	//统计购物车的总金额
	public double calTotalPrice(){
		double sum=0.0;
		Set<Product> keys=goods.keySet();//获得键的集合
		Iterator<Product> it=keys.iterator();//获得迭代器对象
		while(it.hasNext()){
			Product i=it.next();
			sum+=i.getProPrice()*goods.get(i);
		}
		this.setTotalPrice(sum);//设置购物车的总金额
		return this.getTotalPrice();
	}
	
	//删除商品的方法
	public void removeGoodsFromCart(Product item){
		goods.remove(item);
		calTotalPrice();//重新计算购物车的总金额
	}
}
