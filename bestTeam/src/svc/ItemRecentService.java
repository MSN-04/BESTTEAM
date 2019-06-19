package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ItemDAO;
import vo.ItemBean;

public class ItemRecentService {
    private Connection con = null;
    
    public ArrayList<ItemBean> getItemLIst(ArrayList<Integer> itemNumList) {
        
        con = getConnection(); 
        
        ItemDAO itemDAO = ItemDAO.getInstance();
        itemDAO.setConnection(con);
        ArrayList<ItemBean> itemList = itemDAO.getCurrentItems(itemNumList);
        
        close(con);
        
        return itemList;
    }

}
