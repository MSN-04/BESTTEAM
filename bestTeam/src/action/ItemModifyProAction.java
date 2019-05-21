package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import svc.ItemModifyProService;
import vo.ActionForward;
import vo.ItemBean;

public class ItemModifyProAction implements Action {
/* 아이템 수정 Action (<- FROM itemModifyPro.em = 수정하기 버튼 클릭시 )
 1. session id 가 admin 일 때만 수정 가능
 2. itemModify.em 에서 전달 받은 값을 itemBean 에 저장
 3. ItemModifyProService - modifyItem(item) : isModifySuccess 리턴해줌. 아이템정보 수정 성공 확인
    => 수정 성공 여부에 따라 확인 팝업창 띄우기
 4. 아이템정보 수정 성공 시 포워딩 경로 저장 : /itemSingle.em
 5. ActionForward forward 객체 리턴
 */
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ItemModifyProAction 시작");
		
		ActionForward forward = null;
		
		// 1.
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println("세션아이디 : "+id);
		
		if(id != null) {
			System.out.println("세션아이디 null 아님");
			
			if(! id.equals("admin")) {
				System.out.println("세션아이디 != admin");
				
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정할 권한이 없습니다')");
				out.println("location.href='/shopMain.em'");
				out.println("</script>");
				
			}else {
				System.out.println("세션아이디 == admin");
				
				request.setCharacterEncoding("UTF-8");

				int item_num = Integer.parseInt(request.getParameter("item_num"));
				System.out.println("item_num = "+item_num);
				
				// 2.
				
				try {
					System.out.println("item_name" + request.getParameter("item_name"));
					System.out.println("item_img" +request.getParameter("item_img"));
					System.out.println("item_info" +request.getParameter("item_info"));
					System.out.println("item_amount" +request.getParameter("item_amount"));
					System.out.println("item_content" +request.getParameter("item_content"));
					
//					String item_name = request.getParameter("item_name");
//					
//					
//					int item_price = Integer.parseInt(request.getParameter("item_price"));
//					String item_img = request.getParameter("item_img");
//					String item_info = request.getParameter("item_info");
//					int item_amount = Integer.parseInt(request.getParameter("item_amount"));
//					String item_content = request.getParameter("item_content");
//					
//					System.out.println("item_name = "+item_name);
//					System.out.println("item_price = "+item_price);
//					System.out.println("item_img = "+item_img);
//					System.out.println("item_info = "+item_info);
//					System.out.println("item_amount = "+item_amount);
//					System.out.println("item_content = "+item_content);
//					
//					int item_favor_aroma = Integer.parseInt(request.getParameter("item_favor_aroma"));
//					int item_favor_acidity = Integer.parseInt(request.getParameter("item_favor_acidity"));
//					int item_favor_sweetness = Integer.parseInt(request.getParameter("item_favor_sweetness"));
//					int item_favor_bitterness = Integer.parseInt(request.getParameter("item_favor_bitterness"));
//					int item_favor_body = Integer.parseInt(request.getParameter("item_favor_body"));
//					
//					System.out.println("파라미터값 저장");
//
//					ItemBean itemBean = new ItemBean();
//					
//					itemBean.setItem_name(item_name);
//					itemBean.setItem_price(item_price);
//					itemBean.setItem_img(item_img);
//					itemBean.setItem_content(item_content);
//					itemBean.setItem_info(item_info);
//					itemBean.setItem_amount(item_amount);
//					
//					itemBean.setItem_favor_aroma(item_favor_aroma);
//					itemBean.setItem_favor_acidity(item_favor_acidity);
//					itemBean.setItem_favor_sweetness(item_favor_sweetness);
//					itemBean.setItem_favor_bitterness(item_favor_bitterness);
//					itemBean.setItem_favor_body(item_favor_body);
//					
//					
//					// 3.
//					ItemModifyProService itemModifyProService = new ItemModifyProService();
//					int isModifySuccess = itemModifyProService.modifyItem(itemBean);
//					
//					if (isModifySuccess == 2) {  // item, item_favor 업데이트 성공
//						
//						response.setContentType("text/html;charset=UTF-8");
//						PrintWriter out = response.getWriter();
//						out.println("<script>");
//						out.println("alert('아이템 정보 수정이 성공했습니다.')");
//						out.println("location.href='./shopMain.em'");
//						out.println("</script>");
//						
//						itemBean = itemModifyProService.getItem(item_num);
//						request.setAttribute("itemBean", itemBean);
//						
//						// 4.
//						forward = new ActionForward();
//						forward.setPath("/shop/product-single.jsp");
//						forward.setRedirect(true);
//						
//					} else if (isModifySuccess == 1) {  // item_favor 업데이트 실패
//						
//						response.setContentType("text/html;charset=UTF-8");
//						PrintWriter out = response.getWriter();
//						out.println("<script>");
//						out.println("alert('item_favor 수정이 실패했습니다.')");
//						out.println("location.href='./shopMain.em'");
//						out.println("</script>");
//						
//					} else { // item 업데이트 실패
//						
//						response.setContentType("text/html;charset=UTF-8");
//						PrintWriter out = response.getWriter();
//						out.println("<script>");
//						out.println("alert('item, item_favor 수정이 실패했습니다.')");
//						out.println("location.href='./shopMain.em'");
//						out.println("</script>");
//					}
				} catch (Exception e) {
					System.out.println("실패함 : " + e.getMessage());
				}
			}
		} else {  // id == null 일 때
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("location.href='./shopMain.em'");
			out.println("</script>");
		}
		
		// 5.
		return forward;
	}

}
