package action;

import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ItemRecentService;
import vo.ActionForward;
import vo.ItemBean;

public class ItemRecentAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = null;
        
        request.setCharacterEncoding("utf-8");
        Cookie[] cookie = request.getCookies();
        ArrayList<Integer> itemNumList = new ArrayList<>();
        
        // 최근 상품은 최대 5개로 한다.
        if (cookie != null) {
            int count = 0;
            for(int i = cookie.length - 1 ; i >= 0 ; i--) {
                Cookie c = cookie[i];
//            for(Cookie c : cookie) {
                count++;
                if (c.getName().indexOf("item_num") != -1 ) {
                    itemNumList.add(Integer.parseInt(URLDecoder.decode(c.getValue(), "utf-8")));
//                    System.out.println("아이템 넘버 :: " + Integer.parseInt(URLDecoder.decode(c.getValue(), "utf-8")));
                }
                if (count > 5) break;
            }
         }
        
        ItemRecentService itemRecentService = new ItemRecentService();
        ArrayList<ItemBean> itemList = itemRecentService.getItemLIst(itemNumList);
        
        request.setAttribute("itemList", itemList);
        
        forward = new ActionForward();
        forward.setPath("/shop/product-recent.jsp");
        
        return forward;
    }

}
