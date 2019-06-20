package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.ReviewModifyProService;
import svc.ReviewWriteProService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewModifyProAction");
		
		ActionForward forward = null;
		
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		int review_item_num = Integer.parseInt(request.getParameter("review_item_num"));
		
		// 파일 업로드를 위한 정보 저장
		String realFolder = ""; // 실제 경로
		String saveFolder = "/itemUpload"; // 톰캣(이클립스) 상의 가상의 경로
		int fileSize = 5 * 1024 * 1024; // 파일 사이즈(5MB)
		
		ServletContext context = request.getServletContext(); // 현재 서블릿 컨텍스트 객체 얻어오기
		realFolder = context.getRealPath(saveFolder); // 가상의 경로에 해당하는 실제 경로 얻어오기
		System.out.println("realFolder : "+realFolder);
		Path newDirectory = Paths.get(realFolder);
        
        try {
            Path createDirResult = Files.createDirectories(newDirectory);
            System.out.println("디렉토리 생성 결과 : " + createDirResult);
        } catch (IOException e) {
            e.printStackTrace();
        }
//		
		ReviewModifyProService reviewModifyProService = new ReviewModifyProService();
		
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		
		ReviewBean article = new ReviewBean(); 
		
		article.setReview_subject(multi.getParameter("review_subject"));
		article.setReview_content(multi.getParameter("review_content"));
		article.setReview_num(review_num);
		
		
		article.setReview_img(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		

		
		boolean isModifySuccess = reviewModifyProService.modifyArticle(article);
		
		// INSERT 수행 결과가 false 이면 자바 스크립트를 사용하여 "등록 실패" 메세지를 표시(alert())
		if(!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>"); // 자바스크립트 시작 태그
			out.println("alert('게시물 등록 실패!')"); // 오류 메세지 다이얼로그 표시
			out.println("history.back()"); // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 태그
		} else {
			// true 이면 ActionForward 객체를 사용하여 이동
			// => ActionForward 객체 생성, boardList.bo 서블릿주소 지정, isRedirect 변수 값을 true 로 설정
			// => boardList.bo 페이지로 이동하면서 주소가 변경되므로(새로운 요청이 발생하므로) Redirect 방식으로 포워딩
			forward = new ActionForward();
			forward.setPath("itemSingle.em?item_num="+review_item_num);
			forward.setRedirect(true);
		}
		
		
		return forward;
}
}





















