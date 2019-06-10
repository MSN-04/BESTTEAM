package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ItemSingleService;
import svc.QnaListService;
import svc.QnaWriteProService;
import vo.ActionForward;
import vo.ItemBean;
import vo.PageInfo;
import vo.QnaBean;
import vo.ReviewBean;

public class ItemSingleAction implements Action {

/*  DB에서 꺼낸 아이템 정보를 전달받아 product-single 페이지로 이동하는 Action (<- FROM itemSingle.em )
 1. url로 전달된 item_num 받기
 2. ItemSingleService - getItem() : 아이템 정보 꺼내서 ItemBean article 객체에 저장
 3. request 객체에 article 저장
 4. 포워딩 경로 지정  :  /shop/product-single.jsp
 5. ActionForward forward 객체 리턴
*/
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ItemSingleAction 시작");
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		session.getAttribute("id");
		
		// 1.
		int item_num = Integer.parseInt(request.getParameter("item_num"));
		System.out.println(item_num);
		
		// 2.
		ItemSingleService itemSingleService = new ItemSingleService();
		ItemBean itemBean = itemSingleService.getItem(item_num);
		
		// 3.
		//--------------------------------------------------
				ArrayList<ReviewBean> reviewList = new ArrayList<ReviewBean>();
				System.out.println("ItemSingleAction reviewList시작");
				int page = 1;
				int limit = 10;
				
				// 페이지 번호 파라미터가 있을 경우 가져오기
				if(request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				}
				
				
				int listCount = itemSingleService.getListCount(); // 총 게시물 목록 수 가져오기
				
				reviewList = itemSingleService.getArticleList(page, limit); // 게시물 목록 가져오기(페이지 번호에 해당하는 목록을 limit 개수만큼 가져오기)
				
				// 페이지 계산
				
				int maxPage = (int)((double)listCount / limit + 0.95); // 총 페이지 수 계산(올림처리를 위해 + 0.95)
				int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1; // 현재 페이지에 표시할 시작 페이지) 번호
				int endPage = startPage + 10 - 1; // 현재 페이지에 표시할 마지막 페이지 번호
				
				if(endPage > maxPage) { // 마지막 페이지 번호가 최대 페이지 번호보다 클 경우
					endPage = maxPage; // 마지막 페이지 번호를 최대 페이지 번호로 대체
				}
				
				// 페이지 번호 관련 정보를 PageInfo 객체에 저장
				PageInfo pageInfo = new PageInfo();
				pageInfo.setPage(page);
				pageInfo.setMaxPage(maxPage);
				pageInfo.setStartPage(startPage);
				pageInfo.setEndPage(endPage);
				pageInfo.setListCount(listCount);
				
				//--------------------------------------------------
				request.setAttribute("pageInfo", pageInfo);
				request.setAttribute("reviewList", reviewList);
				
				//qna---------------------------------------------------------------
				ArrayList<QnaBean> qnaList = new ArrayList<QnaBean>();
				
				int page2 = 1;
				int limit2 = 10;
				
				// 페이지 번호 파라미터가 있을 경우 가져오기
				if(request.getParameter("page2") != null) {
					page2 = Integer.parseInt(request.getParameter("page2"));
				}
				
				QnaListService qnaListService = new QnaListService();
				
				int listCount2 = qnaListService.getListCount(); // 총 게시물 목록 수 가져오기
				
				qnaList = qnaListService.getArticleList(page2, limit2, item_num); // 게시물 목록 가져오기(페이지 번호에 해당하는 목록을 limit 개수만큼 가져오기)
				System.out.println("itemSingleAction qnalist"+ qnaList.size());
				// 페이지 계산
				
				int maxPage2 = (int)((double)listCount2 / limit2 + 0.95); // 총 페이지 수 계산(올림처리를 위해 + 0.95)
				int startPage2 = (((int)((double)page2 / 10 + 0.9)) - 1) * 10 + 1; // 현재 페이지에 표시할 시작 페이지) 번호
				int endPage2 = startPage2 + 10 - 1; // 현재 페이지에 표시할 마지막 페이지 번호
				
				if(endPage2 > maxPage2) { // 마지막 페이지 번호가 최대 페이지 번호보다 클 경우
					endPage2 = maxPage2; // 마지막 페이지 번호를 최대 페이지 번호로 대체
				}
				
				// 페이지 번호 관련 정보를 PageInfo 객체에 저장
				PageInfo pageInfo2 = new PageInfo();
				pageInfo2.setPage(page2);
				pageInfo2.setMaxPage(maxPage2);
				pageInfo2.setStartPage(startPage2);
				pageInfo2.setEndPage(endPage2);
				pageInfo2.setListCount(listCount2);
				
				request.setAttribute("pageInfo2", pageInfo2);
				request.setAttribute("qnaList", qnaList);
		
		
		//---------------------------------------
		request.setAttribute("itemBean", itemBean);
			
		// 4.
		forward.setPath("/shop/product-single.jsp");
		
		System.out.println("ItemSingleAction 끝");
		
		// 5.
		return forward;
	}

}
