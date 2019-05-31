package vo;

import java.sql.Date;

public class BuyBean {
	private int buy_num;
	private String buy_user_id;
	private String buy_name;  // 가입시 저장한 이름 말고 다른 이름으로 주문할 경우
	private String buy_address;
	private String buy_phone;
	private String buy_phone2;
	private Date buy_buydate;
	private String buy_shipnum;
	private String buy_post;
	private String buy_email;
	private int buy_total;
	private int buy_count;
 
	public BuyBean() {};
	
	

	public BuyBean(String buy_user_id, String buy_name, String buy_address, String buy_phone, String buy_phone2,
			Date buy_buydate, String buy_shipnum, String buy_post, String buy_email, int buy_total) {
		this.buy_user_id = buy_user_id;
		this.buy_name = buy_name;
		this.buy_address = buy_address;
		this.buy_phone = buy_phone;
		this.buy_phone2 = buy_phone2;
		this.buy_buydate = buy_buydate;
		this.buy_shipnum = buy_shipnum;
		this.buy_post = buy_post;
		this.buy_email = buy_email;
		this.buy_total = buy_total;
	}

	

	public int getBuy_count() {
		return buy_count;
	}

	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}

	public String getBuy_email() {
		return buy_email;
	}

	public void setBuy_email(String buy_email) {
		this.buy_email = buy_email;
	}

	public Date getBuy_buydate() {
		return buy_buydate;
	}

	public void setBuy_buydate(Date buy_buydate) {
		this.buy_buydate = buy_buydate;
	}

	public String getBuy_shipnum() {
		return buy_shipnum;
	}

	public void setBuy_shipnum(String buy_shipnum) {
		this.buy_shipnum = buy_shipnum;
	}

	public String getBuy_post() {
		return buy_post;
	}

	public void setBuy_post(String buy_post) {
		this.buy_post = buy_post;
	}

	public int getBuy_total() {
		return buy_total;
	}
	
	public void setBuy_total(int buy_total) {
		this.buy_total = buy_total;
	}
	
	public int getBuy_num() {
		return buy_num;
	}

	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}

	public String getBuy_user_id() {
		return buy_user_id;
	}

	public void setBuy_user_id(String buy_user_id) {
		this.buy_user_id = buy_user_id;
	}

	public String getBuy_address() {
		return buy_address;
	}

	public void setBuy_address(String buy_address) {
		this.buy_address = buy_address;
	}

	public String getBuy_phone() {
		return buy_phone;
	}

	public void setBuy_phone(String buy_phone) {
		this.buy_phone = buy_phone;
	}

	public String getBuy_phone2() {
		return buy_phone2;
	}

	public void setBuy_phone2(String buy_phone2) {
		this.buy_phone2 = buy_phone2;
	}

	public String getBuy_name() {
		return buy_name;
	}

	public void setBuy_name(String buy_name) {
		this.buy_name = buy_name;
	}
	
}
