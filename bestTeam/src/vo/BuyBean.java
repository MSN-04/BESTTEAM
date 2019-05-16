package vo;

import java.sql.Date;

public class BuyBean {
	private int buy_num;
	private String buy_user_id;
	private String buy_address;
	private String buy_phone;
	private String buy_phone2;
	private Date buy_orderdate;
	private Date buy_paydate;
	private String shipnum;
	private String post;
	
	public BuyBean(int buy_num, String buy_user_id, String buy_address, String buy_phone, String buy_phone2,
			Date buy_orderdate, Date buy_paydate, String shipnum, String post) {
		this.buy_num = buy_num;
		this.buy_user_id = buy_user_id;
		this.buy_address = buy_address;
		this.buy_phone = buy_phone;
		this.buy_phone2 = buy_phone2;
		this.buy_orderdate = buy_orderdate;
		this.buy_paydate = buy_paydate;
		this.shipnum = shipnum;
		this.post = post;
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

	public Date getBuy_orderdate() {
		return buy_orderdate;
	}

	public void setBuy_orderdate(Date buy_orderdate) {
		this.buy_orderdate = buy_orderdate;
	}

	public Date getBuy_paydate() {
		return buy_paydate;
	}

	public void setBuy_paydate(Date buy_paydate) {
		this.buy_paydate = buy_paydate;
	}

	public String getShipnum() {
		return shipnum;
	}

	public void setShipnum(String shipnum) {
		this.shipnum = shipnum;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}
	
}
