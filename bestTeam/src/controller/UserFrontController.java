package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.DeleteMemberProAction;
import action.FavorProAction;
import action.ForgotAccountProAction;
import action.JoinProAction;
import action.LoginProAction;
import action.LogoutProAction;
import action.MypageProAction;
import action.UpdateMemberFormAction;
import action.UpdateMemberProAction;
import vo.ActionForward;

@WebServlet("*.us")
public class UserFrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
//		System.out.println(requestURI + " " + contextPath +  " " + command);
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/login.us")) {
//			System.out.println("controll login");
			forward = new ActionForward();
			forward.setPath("/member/login.jsp");
		} else if (command.equals("/update_member.us")) {
			forward = new ActionForward();
			forward.setPath("/member/update_member.jsp");
		} else if (command.equals("/join.us")) {
			forward = new ActionForward();
			forward.setPath("/member/join.jsp");
		} else if (command.equals("/delete_member.us")) {
			forward = new ActionForward();
			forward.setPath("/member/delete_member.jsp");
		} else if (command.equals("/id_check.us")) {
//			System.out.println("idcheck controller");
			forward = new ActionForward();
			forward.setPath("/member/id_check.jsp");
		} else if (command.equals("/mail_check.us")) {
//			System.out.println("idcheck controller");
			forward = new ActionForward();
			forward.setPath("/member/mail_check.jsp");
		} else if (command.equals("/ForgotAccount.us")) {
			forward = new ActionForward();
			forward.setPath("/member/forgotAccount.jsp");
		} else if (command.equals("/taste.us")) {
			forward = new ActionForward();
			forward.setPath("/taste/taste.jsp");
		} else if(command.equals("/LoginProAction.us")) {
//			System.out.println("controll loginPro");
			action = new LoginProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/UpdateMemberProAction.us")) {
			action = new UpdateMemberProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/JoinProAction.us")) {
			action = new JoinProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/Mypage.us")) {
			action = new MypageProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/DeleteMemberProAction.us")) {
			action = new DeleteMemberProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/LogoutProAction.us")) {
			action = new LogoutProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/UpdateMemberFormAction.us")) {
			action = new UpdateMemberFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/ForgotAccountProAction.us")) {
			
			action = new ForgotAccountProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/TasteProAction.us")) {
			System.out.println("tasteProAction controller");
			action = new FavorProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
		
		
		
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				
				dispatcher.forward(request, response);
			}
			
		}
	}
	
	
	

}
