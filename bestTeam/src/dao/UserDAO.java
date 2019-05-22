package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;

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
	
	//로그인
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
	
	
	// 회원정보 수정,탈퇴 회원 확인
	public int isUpdateUser(String id, String pass) {
		int isRightUser = 0;
		String sql = "SELECT * FROM user WHERE user_id=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pass.equals(rs.getString("user_pass"))) {
					isRightUser = 1;
				} 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return isRightUser;
				
	}
	
	// 회원가입
	public boolean userInsert(UserBean userBean) {
		boolean isInsertUser = false;
		String sql = "INSERT INTO user VALUES(null,?,?,?,?,?,?,?,?,?)";
		
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
			pstmt.setString(9, userBean.getUser_post());
			pstmt.executeUpdate();
			isInsertUser = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return isInsertUser;
	}
	
	//회원탈퇴
	public boolean userDelete(String id, String pass) {
		boolean isDeleteUser = false;
		String sql = "SELECT * FROM user WHERE user_id=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pass.equals(rs.getString("user_pass"))) {
					sql = "DELETE FROM user WHERE user_id=?";
					pstmt=con.prepareStatement(sql);
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
	
	//회원정보수정
	public boolean userUpdate(UserBean userBean) {
		boolean isUpdateUser = false;
		int isUpdate = 0;
		String sql = " UPDATE coffee.user SET user_pass=?,user_name=?,user_age=?,user_gender=?,user_address=?,user_phone=?,user_email=?,user_post=? WHERE user_id=?";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userBean.getUser_pass());
			pstmt.setString(2, userBean.getUser_name());
			pstmt.setString(3, userBean.getUser_age());
			pstmt.setString(4, userBean.getUser_gender());
			pstmt.setString(5, userBean.getUser_address());
			pstmt.setString(6, userBean.getUser_phone());
			pstmt.setString(7, userBean.getUser_email());
			pstmt.setString(8, userBean.getUser_post());
			pstmt.setString(9, userBean.getUser_id());
			isUpdate = pstmt.executeUpdate();
			
			if(isUpdate>0) {
				isUpdateUser = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return isUpdateUser;
		
	}
	
	//비밀번호 찾기 => 메일로 발송된 임시비밀번호로 사용자 비밀번호 업데이트
		public int passUpdate(String buf, String email) {
			
			int result=0;
			String sql = " UPDATE user SET user_pass=? WHERE user_email=?";
			try {
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, buf);
				pstmt.setString(2, email);
				result = pstmt.executeUpdate(); //update된 행의 갯수 반환
				System.out.println("비번수정");
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				
			}
			return result;
			
		}
		
	// 마이페이지 정보	
	public UserBean getUserInfo(String id) {
	    UserBean userBean = null;
	    String sql = "select * from user where user_id=?";
	    try {
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, id);
	      rs = pstmt.executeQuery();
	      
	      if(rs.next()) {
	        userBean = new UserBean();
	        userBean.setUser_id(rs.getString("user_id"));
	        userBean.setUser_pass(rs.getString("user_pass"));
	        userBean.setUser_name(rs.getString("user_name"));
	        userBean.setUser_age(rs.getString("user_age"));
	        userBean.setUser_gender(rs.getString("user_gender"));
	        userBean.setUser_address(rs.getString("user_address"));
	        userBean.setUser_phone(rs.getString("user_phone"));
	        userBean.setUser_email(rs.getString("user_email"));
	        userBean.setUser_post(rs.getString("user_post"));
	      }
	    } catch (SQLException e) {
	      e.printStackTrace();
	    } finally {
	      close(rs);
	      close(pstmt);
	    }
	    return userBean;
	  }
	
	// 관리자페이지에서 가입회원 정보
	public ArrayList<UserBean> getUserList(){
		
		ArrayList<UserBean> userList = new ArrayList<UserBean>();
		UserBean userBean = new UserBean();
	
		String sql = "SELECT * FROM user";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			 if(rs.next()) {
			        userBean = new UserBean();
			        userBean.setUser_id(rs.getString("user_id"));
			        userBean.setUser_pass(rs.getString("user_pass"));
			        userBean.setUser_name(rs.getString("user_name"));
			        userBean.setUser_age(rs.getString("user_age"));
			        userBean.setUser_gender(rs.getString("user_gender"));
			        userBean.setUser_address(rs.getString("user_address"));
			        userBean.setUser_phone(rs.getString("user_phone"));
			        userBean.setUser_email(rs.getString("user_email"));
			        userBean.setUser_post(rs.getString("user_post"));
			        userList.add(userBean);
			      }
			    } catch (SQLException e) {
			    	
			      e.printStackTrace();
			    } finally {
			      close(rs);
			      close(pstmt);
			    }
			    return userList;
			    
		
	}
	
	//아이디 찾기
	public String findId(String email,String phone) {
		System.out.println("DAO에서"+phone);
		String id =null;
		String sql;
		if(email!=null &&phone ==null) {
			 sql ="SELECT * FROM user WHERE user_email=?";			
			 try {
				pstmt = con.prepareStatement(sql);
				 pstmt.setString(1, email);
				 rs = pstmt.executeQuery();
				 if(rs.next()) {
					 id = rs.getString("user_id");
				 }
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(email==null && phone !=null) {
			sql ="SELECT * FROM user WHERE user_phone=?";	
			 try {
					pstmt = con.prepareStatement(sql);
					 pstmt.setString(1, phone);
					 rs = pstmt.executeQuery();
					 if(rs.next()) {
						 id = rs.getString("user_id");
					 }
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		System.out.println(id);
		return id;
	}

	// 회원가입 아이디 체크
	public int checkId(String id) {
		con = getConnection();
		int re = 0;
		String sql = "select * from user where user_id=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				re = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return re;
	}
	
	// 회원가입 메일 체크
	public int checkMail(String email) {
		con = getConnection();
		int re = 0;
		String sql = "select * from user where user_email=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				re = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return re;
	}
	
	
}

