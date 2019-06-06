package vo;

import java.sql.Date;

public class BlogReBean {
	int Blog_re_num;
	int Blog_re_blog_num;
	String Blog_re_content;
	String Blog_re_writer;
	Date Blog_re_date;
	
	
	public int getBlog_re_num() {
		return Blog_re_num;
	}
	public void setBlog_re_num(int blog_re_num) {
		Blog_re_num = blog_re_num;
	}
	public int getBlog_re_blog_num() {
		return Blog_re_blog_num;
	}
	public void setBlog_re_blog_num(int blog_re_blog_num) {
		Blog_re_blog_num = blog_re_blog_num;
	}
	public String getBlog_re_content() {
		return Blog_re_content;
	}
	public void setBlog_re_content(String blog_re_content) {
		Blog_re_content = blog_re_content;
	}
	public String getBlog_re_writer() {
		return Blog_re_writer;
	}
	public void setBlog_re_writer(String blog_re_writer) {
		Blog_re_writer = blog_re_writer;
	}
	public Date getBlog_re_date() {
		return Blog_re_date;
	}
	public void setBlog_re_date(Date blog_re_date) {
		Blog_re_date = blog_re_date;
	}
}
