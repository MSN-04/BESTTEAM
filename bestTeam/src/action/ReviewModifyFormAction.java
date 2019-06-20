package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewModifyFormService;
import svc.ReviewService;
import vo.ActionForward;
import vo.ItemBean;
import vo.ReviewBean;

public class ReviewModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("ReviewModifyFormAction");
		
		// ActionForward 객체 생성
		ActionForward forward = new ActionForward();
		
		// URL 에 전달된 board_num 파라미터 가져와서 int 타입 변수 board_num 에 저장 => String -> int 형변환 필요
		int item_num = Integer.parseInt(request.getParameter("review_item_num"));
		int review_num = Integer.parseInt(request.getParameter("review_num"));
//		System.out.println(item_num);
//		System.out.println(review_num);
		
		// BoardDetailService 클래스의 getArticle() 메서드를 사용하여 원본글 가져와서 BoardBean 에 저장
		ReviewModifyFormService reviewModifyFormService = new ReviewModifyFormService();
		ItemBean itemBean = reviewModifyFormService.getItem(item_num);
//		System.out.println("리뷰수정액션에서 : "+itemBean.getItem_img());
		
		ReviewService reviewService=new ReviewService();
		ReviewBean article=reviewService.getArticle(review_num);
		// request 객체에 BoardBean 객체(article) 저장
		request.setAttribute("itemBean", itemBean);
		request.setAttribute("article", article);
		
		// ActionForward 객체의 setPath() 메서드를 사용하여 포워딩 경로를 "/board/qna_board_modify.jsp" 로 지정
		forward.setPath("./shop/reviewModifyForm.jsp");
		
		return forward; // ActionForward 객체 리턴
	}

}
