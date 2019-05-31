package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.NoticeDAO;

import static db.JdbcUtil.*;

import vo.NoticeBean;

public class NoticeListService {
	
	// 글 목록 갯수 구해서 리턴
	public int getListCount() throws Exception {
//		System.out.println("noticeListService - getListCount()");
		
		int listCount = 0; // 글 목록 갯수
		
		Connection con = getConnection();
		
		// noticeDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(con);
		
		// noticeDAO 클래스의 selectListCount() 메서드를 호출하여 글 목록 갯수 얻어와서 변수에 저장
		listCount = noticeDAO.selectListCount();
		   
		System.out.println("게시물 갯수 : " + listCount);
		
		close(con);
		
		return listCount;
	}
	
	// 글 목록 조회 후 리턴
	public ArrayList<NoticeBean> getArticleList(int page, int limit) throws Exception {
//		System.out.println("noticeListService - getArticleList()");
		
		ArrayList<NoticeBean> articleList = null;
		
		Connection con = getConnection();
		
		// noticeDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
		NoticeDAO noticeDAO = NoticeDAO.getInstance();
		noticeDAO.setConnection(con);

		// noticeDAO 클래스의 selectArticleList() 메서드를 호출하여 글 목록 가져와서 ArrayList 객체에 저장
		// => 매개변수로 page, limit 전달
		articleList = noticeDAO.selectArticleList(page, limit);

		// Connection 객체 반환
		close(con);
		
		return articleList;
		
	}
}


