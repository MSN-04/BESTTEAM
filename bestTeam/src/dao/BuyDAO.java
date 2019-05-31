package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static db.JdbcUtil.*;

import vo.BuyBean;
import vo.UserBean;

public class BuyDAO {
	private Connection con;
	private PreparedStatement pstmt = null;
	private ResultSet rs;
	private String sql = null;

	private BuyDAO() {}

	private static BuyDAO instance;

	public static BuyDAO getInstance() {

		if (instance == null) {
			instance = new BuyDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	
	/*-------------------------------------- 주영 ---------------------------------------*/
	public void insertBuy(BuyBean buyBean) {
		sql = "insert into buy values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	
	/*-------------------------------------- 미송 ---------------------------------------*/
	
	/*-------------------------------------- 기홍 ---------------------------------------*/
	
	/*-------------------------------------- 영비 ---------------------------------------*/
	public ArrayList<BuyBean> selectConfirmCheckoutList(String user_id,int buy_num){
		System.out.println("BuyDAO --selectConfirmCheckoutList ");
		
		ArrayList<BuyBean> selectConfirmCheckoutList=null;
		BuyBean buyBean=null;
		UserBean userBean=null;
		
		String sql="select buy_user_id from buy where buy_user_id=?";  //buy 테이블에서 buy_user_id가져옴
		try {
			selectConfirmCheckoutList=new ArrayList<>();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,user_id);   //buy_user_id에 접속한 user_id넣는다.
			System.out.println("user_id:"+user_id);
			System.out.println("buy_user_id:"+buyBean.getBuy_user_id());
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
					String dbId=rs.getString("user_id");
					System.out.println("dbId: "+dbId);
			  
					sql="select * from buy where buy_num=?"; 
					try {
						pstmt=con.prepareStatement(sql);
						pstmt.setInt(1,buy_num);
						rs=pstmt.executeQuery();
						
						if(rs.next()) {
							buyBean.setBuy_num(buy_num);
							buyBean.setBuy_buydate(rs.getDate("buy_date"));
							buyBean.setBuy_count(rs.getInt("buy_count"));
							buyBean.setBuy_name(rs.getString("buy_name"));
							buyBean.setBuy_total(rs.getInt("buy_total"));
							buyBean.setBuy_user_id(user_id);
							selectConfirmCheckoutList.add(buyBean);
						}
						
					}catch(SQLException e) {
						e.printStackTrace();
						System.out.println("selectConfirmCheckoutList 에러1:"+e);
					}
											
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectConfirmCheckoutList 에러2:"+e);
		}finally {
			close(rs);
			close(pstmt);
		}
		return selectConfirmCheckoutList;
	}
	
}
