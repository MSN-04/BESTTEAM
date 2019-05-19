package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.ItemDAO;
import dao.UserDAO;
import vo.UserBean;

public class ItemDeleteProService {
	// item 등록자가 관리자인지 일치여부 확인을 위해 id와 패스워드 확인작업
<<<<<<< HEAD
	public boolean isAdminWriter(String user_id,String user_pass) throws Exception{
		System.out.println(" ------ItemDeleteProService--isAdminWriter--");
		boolean isAdminWriter=false;
		
		Connection con=getConnection();
		ItemDAO itemdao=ItemDAO.getInstance();
		UserDAO userdao=UserDAO.getInstance();
		UserBean userBean= new UserBean();
		
		
		itemdao.setConnection(con);
		isAdminWriter=userdao.isRightUser(userBean);
		close(con);
		
		
		return isAdminWriter;
		
	}
	
	//------ item 번호에 해당하는 글 삭제 수행 ----------
	public boolean deleteItem(int item_num) {
		System.out.println("--------deleteItem 메서드 -------");
=======
	
	public boolean isAdminWriter(String user_id,String user_pass) throws Exception{
		System.out.println(" ------ItemDeleteProService--isAdminWriter--");
		boolean isAdminWriter=false;
		
		Connection con=getConnection();
		ItemDAO itemdao=ItemDAO.getInstance();
		UserDAO userdao=UserDAO.getInstance();
		UserBean userBean= new UserBean();
		
		
		itemdao.setConnection(con);
		isAdminWriter=userdao.isRightUser(userBean);
		close(con);
		
		
		return isAdminWriter;
		
	}
	
	//------ item 번호에 해당하는 글 삭제 수행 ----------
	public boolean deleteItem(int item_num) {
		System.out.println("--------deleteItem 메서드 -------");
		
>>>>>>> branch 'master' of https://github.com/MSN-04/BESTTEAM.git
		boolean isDeleteSuccess=false;
		Connection con=getConnection();
		ItemDAO itemdao=ItemDAO.getInstance();
		itemdao.setConnection(con);
		
		int deleteSuccess=itemdao.deleteItem(item_num);
		System.out.println("deleteSuccess :"+deleteSuccess);
		
		// 삭제 성공하면>0 (commit) , 실패하면 rollback하기
		if(deleteSuccess>0) {
			commit(con);
			isDeleteSuccess=true;
		}else {
			rollback(con);
		}
		
		return isDeleteSuccess;
		
	}
	
}
