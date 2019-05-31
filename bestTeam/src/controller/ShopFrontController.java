package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.CheckoutAction;
import action.CheckoutProAction;
import action.ConfirmCheckoutListProAction;
import action.ConfirmCheckoutProAction;
import vo.ActionForward;


@WebServlet("*.sh")
public class ShopFrontController extends HttpServlet{

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		Action action = null;
		ActionForward forward = null;
		
		// 미송
		if(command.equals("/checkout.sh")) { // 구매진행 페이지 - 구매할 상품목록 / 배송정보 / 결제방법
			System.out.println("checkout");
			action = new CheckoutAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 주영
		else if(command.equals("/checkoutPro.sh")) { 
			System.out.println("checkoutPro");
			action = new CheckoutProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 영비
		else if(command.equals("/confirmCheckoutList.sh")) {
			System.out.println(" itemFrontController -->confirm_checkoutList.sh--");
			forward = new ActionForward();
			forward.setPath("./shop/confirm_checkoutList.jsp");

		} 
		
		// 영비
		else if(command.equals("/confirmCheckoutPro.sh")) {
			 System.out.println("itemFrontController --> confirm_checkoutPro.sh");
		      
		      action = (Action) new ConfirmCheckoutProAction();
		      
		      try {
		        forward = action.execute(request, response);
		      } catch (Exception e) {
		        System.out.println("controller-confirm_checkoutPro 실패"+ e.getMessage());
		        System.out.println("controller- 에러:"+e);
		        
		      }
			
		} 
		
		// 영비
		else if(command.equals("/confirmCheckout.sh")) {
			System.out.println(" itemFrontController -->confirm_checkout.sh--");
			forward = new ActionForward();
			forward.setPath("./shop/confirm_checkout.jsp");
		}
		
		
		if (forward != null) {
			if (forward.isRedirect()) { // Redirect
				response.sendRedirect(forward.getPath());
			} else { // Dispatch
				RequestDispatcher dispatch = request.getRequestDispatcher(forward.getPath());
				dispatch.forward(request, response);
			}
		}
	

		
	}
	

}

