package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static db.JdbcUtil.*;
import vo.UserBean;

public class UserDAO {
	
	private Connection con;
	private PreparedStatement pstmt =null;
	private ResultSet rs;

	private UserDAO() {}
	
	private static UserDAO instance ;
	
	public static UserDAO getInstance() {
		
		if(instance ==null) {
			instance = new UserDAO();
		}
		return instance;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
		
	}
	
	public boolean isRightUser(UserBean userBean) {
		boolean isRightUser = false;
		String sql = "SELECT * FROM user WHERE user_id=? AND user_pass=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userBean.getUser_id());
			pstmt.setString(2, userBean.getUser_pass());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isRightUser = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return isRightUser;
				
	} 
	public boolean userInsert(UserBean userBean) {
		boolean isInsertUser = false;
		String sql = "INSERT INTO user VALUES(null,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userBean.getUser_id());
			pstmt.setString(2, userBean.getUser_pass());
			pstmt.setString(3, userBean.getUser_name());
			pstmt.setString(4, userBean.getUser_age());
			pstmt.setString(5, userBean.getUser_gender());
			pstmt.setString(6, userBean.getUser_address());
			pstmt.setString(7, userBean.getUser_phone());
			pstmt.setString(8, userBean.getUser_email());
			pstmt.executeUpdate();
			isInsertUser = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return isInsertUser;
	}
	
	public boolean userDelete(String id, String pass) {
		boolean isDeleteUser = false;
		String sql = "SELECT * FROM user WHERE id=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pass.equals(rs.getString("user_pass"))) {
					sql = "DELETE FROM user WHERE id=?";
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					isDeleteUser = true;
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return isDeleteUser;
	}
	
	public boolean userUpdate(UserBean userBean) {
		boolean isUpdateUser = false;
		String sql = " UPDATE user SET user_id=?,user_pass=?,user_name=?,user_age=?,user_gender=?,user_address=?,user_phone=?,user_email=? WHERE id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userBean.getUser_id());
			pstmt.setString(2, userBean.getUser_pass());
			pstmt.setString(3, userBean.getUser_name());
			pstmt.setString(4, userBean.getUser_age());
			pstmt.setString(5, userBean.getUser_gender());
			pstmt.setString(6, userBean.getUser_address());
			pstmt.setString(7, userBean.getUser_phone());
			pstmt.setString(8, userBean.getUser_email());
			pstmt.setString(9, userBean.getUser_id());
			pstmt.executeUpdate();
			isUpdateUser = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return isUpdateUser;
		
	}
}
























