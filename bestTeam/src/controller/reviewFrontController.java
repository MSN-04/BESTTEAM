package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ReviewDeleteProAction;
import action.ReviewModifyFormAction;
import action.ReviewModifyProAction;
import action.BlogDetailAction;
import action.BlogListAction;
import action.BlogModifyFormAction;
import action.BlogModifyProAction;
import action.BlogWriteProAction;
import action.ReviewProAction;
import action.reviewWriteProAction;
import vo.ActionForward;

@WebServlet("*.re") // => URL 요청에 마지막이 *.bo 로 끝나는 요청을 매핑하는 서블릿 지정(web.xml 설정 대신 사용)
public class reviewFrontController extends HttpServlet {
	// 모든 클라이언트의 요청을 받아 처리 가능한 HttpServlet 클래스의 서브클래스로 FrontController 클래스 정의
	// GET 방식의 요청을 처리할 doGet() 메서드, POST 방식의 요청을 처리할 doPost() 메서드를 오버라이딩
	// => 두 개의 메서드를 공통적으로 처리할 doProcess() 메서드를 정의
	//       => doProcess() 메서드를 호출하여 request 객체와 response 객체를 전달하여 공통작업 처리

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // POST 방식 요청에 대한 한글 처리
		
		// 요청 URL 에 대한 서블릿 주소 판별을 위해 주소 분리
		String requestURI = request.getRequestURI(); // => URL 중 "http://도메인네임:포트번호" 부분을 제외한 나머지 URI 부분 가져오기
		String contextPath = request.getContextPath(); // => URL 중 프로젝트명 부분 가져오기
		String command = requestURI.substring(contextPath.length());
		// => requestURI 에서 contextPath 부분을 제외한 나머지(서블릿 주소)를 추출하기 위해 substring() 메서드 사용
//		System.out.println("requestURI : " + requestURI);
//		System.out.println("contextPath : " + contextPath);
//		System.out.println("command : " + command);
		
		// 서블릿 요청에 대한 포워딩 처리 및 Action 클래스의 인스턴스 생성을 위한 변수 선언
		Action action = null;
		ActionForward forward = null;
		
		// if문을 사용하여 서블릿 주소 판별(매핑)하여 각 요청에 맞는 포워딩 수행
		// => 1) 비즈니스 로직 없이 JSP 페이지로 바로 연결하는 요청
		// => 2) 비즈니스 로직 처리를 위해 Action 클래스를 통한 DB 작업 수행 후 JSP 페이지로 연결(또는 다른 Action 클래스로 연결)하는 요청
		if(command.equals("/blog.bl")) {
			action = new BlogListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/reviewWriteForm.re")) {
			// 글 쓰기 페이지 요청은 비즈니스 로직 없이 JSP 페이지(board 디렉토리 내의 qna_board_write.jsp 파일)로 바로 연결
			// ActionForward 클래스의 인스턴스를 생성하여 path 변수에 해당 jsp 파일 위치 저장
			forward = new ActionForward();
			forward.setPath("./shop/reviewWriteForm.jsp");
			
		}else if(command.equals("/reviewWritePro.re")) {
			action = new reviewWriteProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/reviewPro.re")) {
			action = new ReviewProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/reviewDeletePro.re")) {
			action = new ReviewDeleteProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/reviewModifyForm.re")) {
			// 수정글 관련 정보 가져오기 - BoardModifyFormAction 클래스로 이동
			action = new ReviewModifyFormAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/reviewModifyPro.re")) {
			// 수정글 저장하기 - BoardModifyProAction 클래스로 이동
			action = new ReviewModifyProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/reviewRead.re")) {
			System.out.println("reviewRead controller");
			forward = new ActionForward();
			forward.setPath("/shop/reviewRead.jsp");
		}
		
		
		
		// 각 Action 클래스 객체로부터 리턴받은 ActionForward 객체를 사용하여 포워딩 처리
		// => Redirect 방식과 Dispatch 방식을 구분하여 처리(= ActionForward 클래스의 isRedirect 변수에 대한 판별)
		if(forward != null) {
			// isRedirect 변수가 true 이면 Redirect 방식, false 이면 Dispatch 방식으로 포워딩
			if(forward.isRedirect()) {
				// Redirect 방식일 경우
				// response 객체의 sendRedirect() 메서드를 호출하여 요청받은 주소 사용하여 포워딩
				response.sendRedirect(forward.getPath());
			} else {
				// Dispatch 방식일 경우
				// => request 객체의 getRequestDispatcher() 메서드를 사용하여 
				//      RequestDispatcher 타입 인스턴스 가져오기(이 때, 매개변수로 요청받은 주소 전달)
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				// RequestDispatcher 인스턴스의 forward() 메서드를 호출하여 request, response 객체 전달
				dispatcher.forward(request, response);
			}
		}
		
		
		
		
		
		
		
		
	}
	
	
}


















