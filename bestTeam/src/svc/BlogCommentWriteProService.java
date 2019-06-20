package svc;

import vo.BlogCommentBean;
import vo.UserBean;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BlogCommentDAO;
import dao.QnaDAO;

public class BlogCommentWriteProService {

	public boolean registArticle(BlogCommentBean blogCommentBean) throws Exception {
//		System.out.println("BlogCommentWriteProService");

		boolean isWriteSuccess = false;

		Connection con = getConnection();

		BlogCommentDAO blogCommentDAO = BlogCommentDAO.getInstance();
		blogCommentDAO.setConnection(con);
		int insertCount = blogCommentDAO.insertComment(blogCommentBean); // 글 등록 처리(결과를 int형으로 전달받음)

		if (insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		} else {
			rollback(con);
		}
		close(con);

		return isWriteSuccess;
	}

	public UserBean getUserInfo(String name, String id) {
		UserBean userBean = new UserBean();

		Connection con = getConnection();
		BlogCommentDAO blogCommentDAO = BlogCommentDAO.getInstance();
		blogCommentDAO.setConnection(con);

		userBean = blogCommentDAO.getUserInfo(id);

		if (userBean != null && userBean.getUser_name().equals(name)) {
			commit(con);
		} else {
			rollback(con);
		}

		return userBean;
	}

}
