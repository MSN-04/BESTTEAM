package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.xml.internal.ws.Closeable;

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
			pstmt.setInt(3, favorBean.getUser_favor_acid());
			pstmt.setInt(4, favorBean.getUser_favor_sweet());
			pstmt.setInt(5, favorBean.getUser_favor_bitter());
			pstmt.setInt(6, favorBean.getUser_favor_body());
			isSetFavorSuccess = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return isSetFavorSuccess;
	}
	
	
}






















