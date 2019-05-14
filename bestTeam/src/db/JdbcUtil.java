package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcUtil {
	/*
	 * DB 접속 및 해제(자원반환) 기능을 담당하는 메서드 정의 클래스
	 */
	
	// getConnection() : DB 연결(CP에서 Connection 객체 얻어와서 리턴)
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Context initCtx = new InitialContext(); // 톰캣의 컨텍스트 가져오기
			Context envCtx = (Context) initCtx.lookup("java:comp/env"); // context.xml 에 정의된 Resource 컨텍스트 가져오기
			DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQL"); // Resource 컨텍스트로부터 DataSource 객체 가져오기
			con = ds.getConnection(); // CP(커넥션풀)에서 Connection 객체 가져오기
			
			con.setAutoCommit(false); // Auto Commit 기능 해제(기본값은 true) = DB 작업의 묶음 단위인 트랜잭션 적용
			// => 별도의 commit(), rollback() 메서드 정의 필요!
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return con;
	}
	
	// 자원 반환을 위한 close() 메서드 => 전달되는 매개변수에 따라 다른 close() 메서드가 호출되도록 오버로딩
	public static void close(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt)  {
		try {
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// DB 트랜잭션 적용을 위한 commit() 메서드 - Connection 객체를 가져와서 commit() 메서드 호출
	public static void commit(Connection con) {
		try {
			con.commit();
//			System.out.println("Commit 성공!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// DB 트랜잭션 취소를 위한 rollback() 메서드 - Connection 객체를 가져와서 rollback() 메서드 호출
	public static void rollback(Connection con) {
		try {
			con.rollback();
//			System.out.println("Rollback 성공!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}



















