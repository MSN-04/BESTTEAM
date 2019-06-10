package vo;

public class BuyItemBean {
	private int item_num;
	private int item_buy_num;
	private String item_name;
	private int item_price;
	private int item_count;
	private String item_img;

	public BuyItemBean() {};
	
	public BuyItemBean(int item_num, int item_buy_num, String item_name, int item_price, int item_count,
			String item_img) {
		this.item_num = item_num;
		this.item_buy_num = item_buy_num;
		this.item_name = item_name;
		this.item_price = item_price;
		this.item_count = item_count;
		this.item_img = item_img;
	}

	public int getItem_num() {
		return item_num;
	}

	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}

	public int getItem_buy_num() {
		return item_buy_num;
	}

	public void setItem_buy_num(int item_buy_num) {
		this.item_buy_num = item_buy_num;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public int getItem_price() {
		return item_price;
	}

	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}

	public int getItem_count() {
		return item_count;
	}

	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}

	public String getItem_img() {
		return item_img;
	}

	public void setItem_img(String item_img) {
		this.item_img = item_img;
	}
	
}
