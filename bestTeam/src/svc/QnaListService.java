package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.QnaDAO;

import static db.JdbcUtil.*;

import vo.QnaBean;

public class QnaListService {
	
	// 글 목록 갯수 구해서 리턴
	public int getListCount() throws Exception {
//		System.out.println("qnaListService - getListCount()");
		
		int listCount = 0; // 글 목록 갯수
		
		// Connection 객체 가져오기
		Connection con = getConnection();
		
		// qnaDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
		QnaDAO qnaDAO = QnaDAO.getInstance();
		
		qnaDAO.setConnection(con);
		
		// qnaDAO 클래스의 selectListCount() 메서드를 호출하여 글 목록 갯수 얻어와서 변수에 저장
		listCount = qnaDAO.selectListCount();
		   
		System.out.println("게시물 갯수 : " + listCount);
		
		close(con);
		
		return listCount;
	}
	
	// 글 목록 조회 후 리턴
	public ArrayList<QnaBean> getArticleList(int page, int limit) throws Exception {
//		System.out.println("qnaListService - getArticleList()");
		
		ArrayList<QnaBean> articleList = null;
		
		Connection con = getConnection();
		
		// qnaDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
		QnaDAO qnaDAO = QnaDAO.getInstance();
		qnaDAO.setConnection(con);

		// qnaDAO 클래스의 selectArticleList() 메서드를 호출하여 글 목록 가져와서 ArrayList 객체에 저장
		// => 매개변수로 page, limit 전달
		articleList = qnaDAO.selectArticleList(page, limit);

		// Connection 객체 반환
		close(con);
		
		return articleList;
		
	}
}


