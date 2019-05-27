package vo;

import java.sql.Date;

public class ReviewBean {

	private int review_num;
	private int review_item_num;
	private String review_user_id;
	private String review_content;
	private int review_readcount;
	private float review_rate;
	private String review_img;
	private Date review_date;
	private String review_subject;
	public String getReview_subject() {
		return review_subject;
	}
	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getReview_item_num() {
		return review_item_num;
	}
	public void setReview_item_num(int review_item_num) {
		this.review_item_num = review_item_num;
	}
	public String getReview_user_id() {
		return review_user_id;
	}
	public void setReview_user_id(String review_user_id) {
		this.review_user_id = review_user_id;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_readcount() {
		return review_readcount;
	}
	public void setReview_readcount(int review_readcount) {
		this.review_readcount = review_readcount;
	}
	public float getReview_rate() {
		return review_rate;
	}
	public void setReview_rate(float review_rate) {
		this.review_rate = review_rate;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	
	
	
	
}
