package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import dao.UserDAO;


public class AdminPageShopDayService {

	private Connection con;
	private UserDAO userDAO;

	public List<Map<String, Integer>> showChart(String month) {
		
		List<Map<String, Integer>> salesList = null;
		
		con = getConnection();
		userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
//		System.out.println("[AdminPageShopDayService] month :: " + month);
		salesList = userDAO.getSalesDayList(month);
		
		close(con);
		
		return salesList;
	}
}
