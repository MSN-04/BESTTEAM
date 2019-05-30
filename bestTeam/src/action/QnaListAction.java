package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.QnaListService;
import vo.ActionForward;
import vo.QnaBean;
import vo.PageInfo;

public class QnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaListAction");
		
		ArrayList<QnaBean> articleList2 = new ArrayList<QnaBean>();
		
		int page2 = 1;
		int limit2 = 5;
		
		// 페이지 번호 파라미터가 있을 경우 가져오기
		if(request.getParameter("page2") != null) {
			page2 = Integer.parseInt(request.getParameter("page2"));
		}
		
		QnaListService qnaListService = new QnaListService();
		
		int listCount2 = qnaListService.getListCount(); // 총 게시물 목록 수 가져오기
		
		articleList2 = qnaListService.getArticleList(page2, limit2); // 게시물 목록 가져오기(페이지 번호에 해당하는 목록을 limit 개수만큼 가져오기)
		
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
		
		// PageInfo 객체와 ArrayList 객체를 request 객체의 setAttribute() 메서드를 사용하여 저장
		request.setAttribute("pageInfo2", pageInfo2);
		request.setAttribute("articleList2", articleList2);
		
		// ActionForward 객체를 사용하여 qna 폴더의 qna_List.jsp 페이지로 이동 처리 => Dispatch 방식 포워딩
		// => 기존 qnaList.bo 주소를 변경하지 않고 바로 jsp 페이지로 이동하기 위해서
		ActionForward forward = new ActionForward();
		forward.setPath("/shop/qna_list.jsp");

		return forward;
	}

}


