package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.noticeWriteProService;
import vo.ActionForward;
import vo.noticeBean;

public class noticeWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 글 쓰기 작업에 대한 비즈니스 로직 처리를 위한 준비 작업 및 마무리 작업(실제 비즈니스 로직은 Service 클래스와 DAO 클래스에서 수행)
		// Controller -> Action -> Service -> DAO -> Service -> Action -> Controller
		
		ActionForward forward = null;
		noticeBean noticeBean = null;
		
		// 파일 업로드를 위한 정보 저장
		String realFolder = ""; // 실제 경로
		String saveFolder = "/noticeUpload"; // 톰캣(이클립스) 상의 가상의 경로
		int fileSize = 5 * 1024 * 1024; // 파일 사이즈(5MB)
		
		ServletContext context = request.getServletContext(); // 현재 서블릿 컨텍스트 객체 얻어오기
		realFolder = context.getRealPath(saveFolder); // 가상의 경로에 해당하는 실제 경로 얻어오기
		
		// 파일 업로드를 위한 MultipartRequest 객체 생성(cos.jar 필요)
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		noticeBean = new noticeBean(); // 글 쓰기 데이터를 저장할 noticeBean 객체
		// 파일명을 제외한 나머지 데이터는 multi.getParameter() 메서드를 사용
		noticeBean.setNotice_writer(multi.getParameter("notice_writer"));
		noticeBean.setNotice_subject(multi.getParameter("notice_subject"));
		noticeBean.setNotice_content(multi.getParameter("notice_content"));
		// 파일명을 가져오는 방법
		noticeBean.setNotice_file(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		
		// 실제 비즈니스 로직 처리를 담당할 Service 클래스(XXXAction => XXXService) 인스턴스를 생성하여
		// 처리 담당 메서드를 호출(매개변수로 noticeBean 객체 전달)
		noticeWriteProService noticeWriteProService = new noticeWriteProService();
		boolean isWriteSuccess = noticeWriteProService.registArticle(noticeBean);
		
		// INSERT 수행 결과가 false 이면 자바 스크립트를 사용하여 "등록 실패" 메세지를 표시(alert())
		if(!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('게시물 등록 실패!')"); // 오류 메세지 다이얼로그 표시
			out.println("history.back()"); // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 태그
		} else {
			// true 이면 ActionForward 객체를 사용하여 이동
			// => ActionForward 객체 생성, noticeList.bo 서블릿주소 지정, isRedirect 변수 값을 true 로 설정
			// => noticeList.bo 페이지로 이동하면서 주소가 변경되므로(새로운 요청이 발생하므로) Redirect 방식으로 포워딩
			forward = new ActionForward();
			forward.setPath("noticeList.no");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}




















