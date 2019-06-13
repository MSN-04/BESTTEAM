package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import dao.UserDAO;


public class AdminPageShopMonthService {

	private Connection con;
	private UserDAO userDAO;

	public List<Map<String, Integer>> showChart(String year) {
		
		List<Map<String, Integer>> salesList = null;
		
		con = getConnection();
		userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		System.out.println("[AdminPageShopMonthService] month :: " + year);
		salesList = userDAO.getSalesMonthList(year);
		
		close(con);
		
		return salesList;
	}
}
