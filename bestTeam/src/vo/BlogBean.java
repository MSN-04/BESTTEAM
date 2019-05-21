package vo;

import java.sql.Date;

public class BlogBean {
	private int blog_num;
	private String blog_writer;
	private String blog_subject;
	private String blog_content;
	private int blog_readcount;
	private String blog_file;
	private Date blog_date;
	private int blog_like;
	private int blog_re_lev;
	private int blog_re_ref;
	private int blog_re_seq;
	private String blog_file1;
	public int getBlog_num() {
		return blog_num;
	}
	public String getBlog_file1() {
		return blog_file1;
	}
	public void setBlog_file1(String blog_file1) {
		this.blog_file1 = blog_file1;
	}
	public void setBlog_num(int blog_num) {
		this.blog_num = blog_num;
	}
	public String getBlog_writer() {
		return blog_writer;
	}
	public void setBlog_writer(String blog_writer) {
		this.blog_writer = blog_writer;
	}
	public String getBlog_subject() {
		return blog_subject;
	}
	public void setBlog_subject(String blog_subject) {
		this.blog_subject = blog_subject;
	}
	public String getBlog_content() {
		return blog_content;
	}
	public void setBlog_content(String blog_content) {
		this.blog_content = blog_content;
	}
	public int getBlog_readcount() {
		return blog_readcount;
	}
	public void setBlog_readcount(int blog_readcount) {
		this.blog_readcount = blog_readcount;
	}
	public String getBlog_file() {
		return blog_file;
	}
	public void setBlog_file(String blog_file) {
		this.blog_file = blog_file;
	}
	public Date getBlog_date() {
		return blog_date;
	}
	public void setBlog_date(Date blog_date) {
		this.blog_date = blog_date;
	}
	public int getBlog_like() {
		return blog_like;
	}
	public void setBlog_like(int blog_like) {
		this.blog_like = blog_like;
	}
	public int getBlog_re_lev() {
		return blog_re_lev;
	}
	public void setBlog_re_lev(int blog_re_lev) {
		this.blog_re_lev = blog_re_lev;
	}
	public int getBlog_re_ref() {
		return blog_re_ref;
	}
	public void setBlog_re_ref(int blog_re_ref) {
		this.blog_re_ref = blog_re_ref;
	}
	public int getBlog_re_seq() {
		return blog_re_seq;
	}
	public void setBlog_re_seq(int blog_re_seq) {
		this.blog_re_seq = blog_re_seq;
	}
			
	
	
}
