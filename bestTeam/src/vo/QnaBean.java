package vo;

import java.sql.Date;

public class QnaBean {
	private int qna_num;
	private int qna_item_num;
	private String qna_writer;
	private String qna_subject;
	private String qna_content;
	private Date qna_date;
	
	public int getQna_item_num() {
		return qna_item_num;
	}
	public void setQna_item_num(int qna_item_num) {
		this.qna_item_num = qna_item_num;
	}
	
	public int getQna_num() {
		return qna_num;
	}   
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public String getQna_writer() {
		return qna_writer;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	
	
	
	
}
