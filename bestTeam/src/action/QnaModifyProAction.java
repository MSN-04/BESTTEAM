package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.MyPageProService;
import svc.QnaModifyProService;
import svc.QnaWriteProService;
import vo.ActionForward;
import vo.QnaBean;
import vo.UserBean;

public class QnaModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 글 쓰기 작업에 대한 비즈니스 로직 처리를 위한 준비 작업 및 마무리 작업(실제 비즈니스 로직은 Service 클래스와 DAO 클래스에서 수행)
		// Controller -> Action -> Service -> DAO -> Service -> Action -> Controller
		
		ActionForward forward = null;
		QnaBean qnaBean = null;
		HttpSession session = request.getSession();
		UserBean userBean=null;
//		
		String id = session.getAttribute("id").toString();
		String name = request.getParameter("qna_writer");
		String qna_subject = request.getParameter("qna_subject");
		String qna_content = request.getParameter("qna_content");
//		int qna_num = (Integer) request.getAttribute("qna_num");
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		System.out.println(qna_num);
		int qna_item_num = Integer.parseInt(request.getParameter("item_num"));
		
		userBean = new UserBean();
		QnaModifyProService qnaModifyProService = new QnaModifyProService();
		userBean = qnaModifyProService.getUserInfo(name, id);
		
		qnaBean = new QnaBean(); // 글 쓰기 데이터를 저장할 qnaBean 객체
		qnaBean.setQna_num(qna_num);
		qnaBean.setQna_item_num(qna_item_num);
		qnaBean.setQna_writer(id);
		qnaBean.setQna_subject(qna_subject);
		qnaBean.setQna_content(qna_content);
//		QnaBean.setQna_file(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		
		
//		MyPageProService mypageProService = new MyPageProService();
//		userBean = (UserBean) mypageProService.getUserInfo(userBean);
		
		
		boolean isModifySuccess = qnaModifyProService.modifyArticle(qnaBean);
		
		// update 수행 결과가 false 이면 자바 스크립트를 사용하여 "등록 실패" 메세지를 표시(alert())
		if(!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('게시물 수정 실패!')"); // 오류 메세지 다이얼로그 표시
			out.println("history.back()"); // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 태그
		} else {
			// true 이면 ActionForward 객체를 사용하여 이동
			// => ActionForward 객체 생성, qnaList.bo 서블릿주소 지정, isRedirect 변수 값을 true 로 설정
			// => qnaList.bo 페이지로 이동하면서 주소가 변경되므로(새로운 요청이 발생하므로) Redirect 방식으로 포워딩
			forward = new ActionForward();
			forward.setPath("itemSingle.em?item_num="+qna_item_num);
//			forward.setRedirect(true);
		}
		
		return forward;
	}

}




















