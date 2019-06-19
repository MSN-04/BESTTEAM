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

import svc.BlogModifyProService;
import vo.ActionForward;
import vo.BlogBean;

public class BlogModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardModifyProAction");
		
		// ActionForward 객체 생성
		ActionForward forward = new ActionForward();
		
		// 파라미터로 전달된 글번호(board_num) 가져오기
		int blog_num = Integer.parseInt(request.getParameter("blog_num"));
		
		// BoardModifyProService 인스턴스 생성 후 isArticleWriter() 메서드를 통해 본인 확인(매개변수로 글번호, 입력받은 패스워드 전달)
		BlogModifyProService blogModifyProService = new BlogModifyProService();
		
		// 파일 업로드를 위한 정보 저장
				String realFolder; // 실제 경로
				String saveFolder = "/img_upload"; // 톰캣(이클립스) 상의 가상의 경로
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
		        
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
			BlogBean article = new BlogBean();
			article.setBlog_num(blog_num);
			article.setBlog_subject(multi.getParameter("blog_subject"));
			article.setBlog_content1(multi.getParameter("blog_content1"));
			article.setBlog_writer(multi.getParameter("blog_writer"));
			article.setBlog_file(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
			article.setBlog_content(multi.getParameter("blog_content"));
			
			boolean isModifySuccess = blogModifyProService.modifyArticle(article);
			
			// 글 수정 성공 여부 판별
			if(!isModifySuccess) {
				// 글 수정 실패 시 자바스크립트를 사용하여 "수정 실패!" 출력
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>"); // 자바스크립트 시작 태그
				out.println("alert('수정 실패!')"); // 오류 메세지 다이얼로그 표시
				out.println("history.back()"); // 이전 페이지로 돌아가기
				out.println("</script>"); // 자바스크립트 종료 태그
			} else {
				System.out.println("글 수정 성공!");
				// 글 수정 성공 시
				forward=new ActionForward();
				// boardDetail.bo 서블릿 주소로 포워딩 => 주소 뒤에 파라미터로 글번호(board_num) 전달 => Redirect 방식
				forward.setPath("blog-single.bl?blog_num=" + blog_num + "&page=1");
				forward.setRedirect(true);
			}
			
//		}
		
		return forward;
	}

}





















