package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.w3c.dom.events.MutationEvent;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BlogWriteProService;
import vo.ActionForward;
import vo.BlogBean;

// XXXAction 클래스는 Action 인터페이스를 상속받아 추상메서드로 공통 메서드인 execute() 메서드를 구현한다
public class BlogWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 글 쓰기 작업에 대한 비즈니스 로직 처리를 위한 준비 작업 및 마무리 작업(실제 비즈니스 로직은 Service 클래스와 DAO 클래스에서 수행)
		// Controller -> Action -> Service -> DAO -> Service -> Action -> Controller
		System.out.println("BlogWriteProAction()");
		
		ActionForward forward = null;
		BlogBean blogBean = null;
		
		// 파일 업로드를 위한 정보 저장
		String realFolder; // 실제 경로
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
		
		System.out.println(realFolder);
//		// 파일 업로드를 위한 MultipartRequest 객체 생성(cos.jar 필요)
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		blogBean = new BlogBean(); // 글 쓰기 데이터를 저장할 BlogBean 객체
		// 파일명을 제외한 나머지 데이터는 multi.getParameter() 메서드를 사용
		
		blogBean.setBlog_subject(multi.getParameter("blog_subject"));
		blogBean.setBlog_content1(multi.getParameter("blog_content1"));
		blogBean.setBlog_writer(multi.getParameter("blog_writer"));
//		blogBean.setBlog_file(filename);
		blogBean.setBlog_content(multi.getParameter("blog_content"));
		
		blogBean.setBlog_file(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		
//		blogBean.setBlog_file1(filename);
		// 파일명을 가져오는 방법
		
		// 실제 비즈니스 로직 처리를 담당할 Service 클래스(XXXAction => XXXService) 인스턴스를 생성하여
		// 처리 담당 메서드를 호출(매개변수로 BoardBean 객체 전달)
		BlogWriteProService blogWriteProService = new BlogWriteProService();
		boolean isWriteSuccess = blogWriteProService.registArticle(blogBean);
		
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
			// => ActionForward 객체 생성, boardList.bo 서블릿주소 지정, isRedirect 변수 값을 true 로 설정
			// => boardList.bo 페이지로 이동하면서 주소가 변경되므로(새로운 요청이 발생하므로) Redirect 방식으로 포워딩
			forward = new ActionForward();
			forward.setPath("blog.bl");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}




















