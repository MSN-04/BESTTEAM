package vo;

import java.sql.Date;

public class BlogReBean {
	int blog_re_num;
	int blog_re_blog_num;
	String blog_re_content;
	String blog_re_writer;
	Date blog_re_date;
	
	public int getBlog_re_num() {
		return blog_re_num;
	}
	public void setBlog_re_num(int blog_re_num) {
		this.blog_re_num = blog_re_num;
	}
	public int getBlog_re_blog_num() {
		return blog_re_blog_num;
	}
	public void setBlog_re_blog_num(int blog_re_blog_num) {
		this.blog_re_blog_num = blog_re_blog_num;
	}
	public String getBlog_re_content() {
		return blog_re_content;
	}
	public void setBlog_re_content(String blog_re_content) {
		this.blog_re_content = blog_re_content;
	}
	public String getBlog_re_writer() {
		return blog_re_writer;
	}
	public void setBlog_re_writer(String blog_re_writer) {
		this.blog_re_writer = blog_re_writer;
	}
	public Date getBlog_re_date() {
		return blog_re_date;
	}
	public void setBlog_re_date(Date blog_re_date) {
		this.blog_re_date = blog_re_date;
	}
}