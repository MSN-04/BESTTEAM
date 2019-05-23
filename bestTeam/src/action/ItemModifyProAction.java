package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
				
				// 2.
				
				request.setCharacterEncoding("UTF-8");
				
				// 폴더의 물리적 경로
				ServletContext context = request.getServletContext();
				String realFolder = context.getRealPath("/itemUpload"); // 실제 경로
				System.out.println("realFolder : "+realFolder );
				
				System.out.println("0");
				
				// 업로드 할 파일 최대 크기
				int maxSize = 5 * 1024 * 1024; // 5MB
				
				System.out.println("1");

				// (request, 폴더 물리적 경로, 파일 최대 크기, 캐릭터, 업로드한 파일 중 동일한 이름이 있으면 변경)				
				MultipartRequest multi = new MultipartRequest(request, realFolder ,maxSize,"utf-8", new DefaultFileRenamePolicy() ); 
				
				System.out.println("2");
				
				System.out.println("item_num = "+ Integer.parseInt(request.getParameter("item_num")));
				int item_num = Integer.parseInt(request.getParameter("item_num"));
				String item_name = multi.getParameter("item_name");
				int item_price = Integer.parseInt(multi.getParameter("item_price"));
				int item_amount = Integer.parseInt(multi.getParameter("item_amount"));
				String item_content = multi.getFilesystemName("item_content");
				// 파일 받기
				String item_img = multi.getFilesystemName("item_img");  //	String item_img = multi.getParameter("item_img"); 아님
				String item_info = multi.getParameter("item_info");
				
				System.out.println("3");
				int item_favor_aroma = Integer.parseInt(multi.getParameter("item_favor_aroma"));
				System.out.println("item_favor_aroma : "+item_favor_aroma);
				int item_favor_acidity = Integer.parseInt(multi.getParameter("item_favor_acidity"));
				int item_favor_sweetness = Integer.parseInt(multi.getParameter("item_favor_sweetness"));
				int item_favor_bitterness = Integer.parseInt(multi.getParameter("item_favor_bitterness"));
				int item_favor_body = Integer.parseInt(multi.getParameter("item_favor_body"));
				System.out.println("ifn : " + request.getParameter("item_favor_num"));
				int item_favor_num = Integer.parseInt(request.getParameter("item_favor_num"));
				
				System.out.println("action - 파라미터값 저장");
				
				ItemBean newItemBean = new ItemBean();
				
				newItemBean.setItem_num(item_num);
				newItemBean.setItem_name(item_name);
				newItemBean.setItem_price(item_price);
				newItemBean.setItem_img(item_img);
				newItemBean.setItem_content(item_content);
				newItemBean.setItem_info(item_info);
				newItemBean.setItem_amount(item_amount);
				
				newItemBean.setItem_favor_num(item_favor_num);
				newItemBean.setItem_favor_item_num(item_num);
				newItemBean.setItem_favor_aroma(item_favor_aroma);
				newItemBean.setItem_favor_acidity(item_favor_acidity);
				newItemBean.setItem_favor_sweetness(item_favor_sweetness);
				newItemBean.setItem_favor_bitterness(item_favor_bitterness);
				newItemBean.setItem_favor_body(item_favor_body);
				
				System.out.println("action - newItemBean 저장");
				
				// 3.
				ItemModifyProService itemModifyProService = new ItemModifyProService();
				int isModifySuccess = itemModifyProService.modifyItem(newItemBean);
				
				if (isModifySuccess == 2) {  // item, item_favor 업데이트 성공
					System.out.println("action - item, item_favor Up");
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('아이템 정보 수정이 성공했습니다.')");
					out.println("location.href='./shopMain.em'");
					out.println("</script>");
					
					ItemBean newItemBean2 = itemModifyProService.getItem(newItemBean.getItem_num());
					request.setAttribute("newItemBean2", newItemBean2);

					
					// 4.
					forward = new ActionForward();
					forward.setPath("./itemSingle.em?item_num="+newItemBean.getItem_num());
					forward.setRedirect(true);
					

					
				} else if (isModifySuccess == 1) {  // item_favor 업데이트 실패
					System.out.println("action - item_favor Up fail");
					
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('item_favor 수정이 실패했습니다.')");
					out.println("location.href='./shopMain.em'");
					out.println("</script>");
					
				} else { // item 업데이트 실패
					System.out.println("action - Up fail");
					
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("alert('item, item_favor 수정이 실패했습니다.')");
					out.println("location.href='./shopMain.em'");
					out.println("</script>");
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
