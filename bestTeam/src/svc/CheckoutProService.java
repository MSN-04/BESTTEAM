package svc;

import java.sql.Connection;

import com.sun.xml.internal.ws.encoding.RootOnlyCodec;

import dao.BuyDAO;
import vo.BuyBean;

import static db.JdbcUtil.*;


public class CheckoutProService {
	
	private Connection con = null;

	public boolean insertBuy(BuyBean buyBean) {
		boolean isInsertBuySuccess = false;
		boolean isDeleteCart = false;
		con = getConnection();
		
		BuyDAO buyDAO = BuyDAO.getInstance();
		buyDAO.setConnection(con);
		isInsertBuySuccess = buyDAO.insertBuy(buyBean);
		
		if ( isInsertBuySuccess ) {
			isDeleteCart = buyDAO.deleteCart(buyBean.getBuy_user_id());
			if (isDeleteCart) {
				commit(con);
			} else {
				rollback(con);
			}
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isInsertBuySuccess;
	}
	

}
