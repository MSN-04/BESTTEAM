package vo;

public class CartBean {
	private int cart_num;
	private int cart_item_num;
	private String cart_user_id;
	private int cart_count;
	private int price;
	
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

}
