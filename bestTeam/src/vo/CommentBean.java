package vo;

import java.util.Date;

public class CommentBean {
int comment_num;
String comment_content;
String comment_writer;
Date comment_date;
int comment_qna_num;
public int getComment_num() {
	return comment_num;
}
public void setComment_num(int comment_num) {
	this.comment_num = comment_num;
}
public String getComment_content() {
	return comment_content;
}
public void setComment_content(String comment_content) {
	this.comment_content = comment_content;
}
public String getComment_writer() {
	return comment_writer;
}
public void setComment_writer(String comment_writer) {
	this.comment_writer = comment_writer;
}
public Date getComment_date() {
	return comment_date;
}
public void setComment_date(Date comment_date) {
	this.comment_date = comment_date;
}
public int getComment_qna_num() {
	return comment_qna_num;
}
public void setComment_qna_num(int comment_qna_num) {
	this.comment_qna_num = comment_qna_num;
}



}
