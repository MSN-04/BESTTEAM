package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import vo.FavorBean;

public class UserFavorDAO {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private UserFavorDAO() {}
	
private static UserFavorDAO instance ;
	
	public static UserFavorDAO getInstance() {
		
		if(instance ==null) {
			instance = new UserFavorDAO();
		}
		return instance;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
		
	}

	public int setFavor(FavorBean favorBean) {
		int isSetFavorSuccess = 0;
		
		String sql = "insert into user_favor values(null,?,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, favorBean.getUser_favor_user_id());
			pstmt.setInt(2, favorBean.getUser_favor_aroma());
			pstmt.setInt(3, favorBean.getUser_favor_acidity());
			pstmt.setInt(4, favorBean.getUser_favor_sweetness());
			pstmt.setInt(5, favorBean.getUser_favor_bitterness());
			pstmt.setInt(6, favorBean.getUser_favor_body());
			isSetFavorSuccess = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return isSetFavorSuccess;
	}
	
	public FavorBean getFavor(String id) {
		FavorBean favorBean = new FavorBean();
		
		String sql = "SELECT * FROM user_favor WHERE user_favor_user_id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				favorBean.setUser_favor_num(rs.getInt("user_favor_num"));
				favorBean.setUser_favor_user_id(rs.getString("user_favor_user_id"));
				favorBean.setUser_favor_aroma(rs.getInt("user_favor_aroma"));
				favorBean.setUser_favor_acidity(rs.getInt("user_favor_acidity"));
				favorBean.setUser_favor_sweetness(rs.getInt("user_favor_sweetness"));
				favorBean.setUser_favor_bitterness(rs.getInt("user_favor_bitterness"));
				favorBean.setUser_favor_body(rs.getInt("user_favor_body"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return favorBean;
	}
	
}






















