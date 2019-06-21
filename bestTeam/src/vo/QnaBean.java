package vo;

import java.sql.Date;

public class QnaBean {
	private int qna_num;
	private int qna_item_num;
	private String qna_writer;
	private String qna_subject;
	private String qna_content;
	private Date qna_date;
	private int qna_re_ref;	// 참조 번호
	private int qna_re_lev;	// 참조 레벨
	private int qna_re_seq;	// 참조 순서
	private String qna_re_writer; //답글작성자


	
	public String getQna_re_writer() {
		return qna_re_writer;
	}
	public void setQna_re_writer(String qna_re_writer) {
		this.qna_re_writer = qna_re_writer;
	}
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
	public int getQna_re_ref() {
		return qna_re_ref;
	}
	public void setQna_re_ref(int qna_re_ref) {
		this.qna_re_ref = qna_re_ref;
	}
	public int getQna_re_lev() {
		return qna_re_lev;
	}
	public void setQna_re_lev(int qna_re_lev) {
		this.qna_re_lev = qna_re_lev;
	}
	public int getQna_re_seq() {
		return qna_re_seq;
	}
	public void setQna_re_seq(int qna_re_seq) {
		this.qna_re_seq = qna_re_seq;
	}
	
	
	
}
