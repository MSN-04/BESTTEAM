package vo;

public class CartBean {
	private int cart_num;
	private int cart_item_num;
	private String cart_user_id;
	private int cart_count;
	private int cart_price;
	private String cart_img;
	private String cart_item_name;
	
	
	
	public String getCart_img() {
		return cart_img;
	}
	public void setCart_img(String cart_img) {
		this.cart_img = cart_img;
	}
	public String getCart_item_name() {
		return cart_item_name;
	}
	public void setCart_item_name(String cart_item_name) {
		this.cart_item_name = cart_item_name;
	}
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public int getCart_item_num() {
		return cart_item_num;
	}
	public void setCart_item_num(int cart_item_num) {
		this.cart_item_num = cart_item_num;
	}
	public String getCart_user_id() {
		return cart_user_id;
	}
	public void setCart_user_id(String cart_user_id) {
		this.cart_user_id = cart_user_id;
	}
	public int getCart_count() {
		return cart_count;
	}
	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}
	public int getCart_price() {
		return cart_price;
	}
	public void setCart_price(int price) {
		this.cart_price = price;
	}

}
