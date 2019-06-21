package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;

import action.CartAction;
import action.CartCheckAction;
import action.CartDeleteAction;
import action.CartInsertAction;
import action.CartUpdateAction;
import action.CheckoutFormAction;
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
			//System.out.println("checkoutForm");
			action = new CheckoutFormAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 주영
		else if(command.equals("/checkoutPro.sh")) { 
		//	System.out.println("checkoutPro");
			action = new CheckoutProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/cart.sh")) { 
//			System.out.println("cart 컨트롤러 시작");
//			forward = new ActionForward();
//			forward.setPath("./shop/cart.jsp");
			action = new CartAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
//			System.out.println("cart 컨트롤러 종료");
		}
		else if(command.equals("/cartInsert.sh")) { 
//			System.out.println("cartInsert 컨트롤러 시작");
			action = new CartInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
//			System.out.println("cartInsert 컨트롤러 종료");
		}
		else if(command.equals("/cartUpdate.sh")) { 
//			System.out.println("cartUpdate 컨트롤러 시작");
			action = new CartUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
//			System.out.println("cartUpdate 컨트롤러 종료");
		}
		else if(command.equals("/cartDelete.sh")) { 
//			System.out.println("cartDelete 컨트롤러 시작");
			action = new CartDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
//			System.out.println("cartDelete 컨트롤러 종료");
		}
		else if(command.equals("/cartCheck.sh")) { 
		//	System.out.println("cartCheck 컨트롤러 시작");
			action = new CartCheckAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//System.out.println("cartCheck 컨트롤러 종료");
		}
		
		// 영비
		else if(command.equals("/confirmCheckoutList.sh")) {
				action = new ConfirmCheckoutListProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("controller-confirmCheckoutList 실패"+ e.getMessage());
		        System.out.println("controller- 에러:"+e);
			}
		} 
		
//		else if(command.equals("/confirmCheckoutList.sh")) {
//			System.out.println(" itemFrontController -->confirmCheckoutList.sh--");
//			forward = new ActionForward();
//			forward.setPath("./shop/confirmCheckoutList.jsp");
//
//		} 
		
		// 영비
		else if(command.equals("/confirm_checkout.sh")) {
		      
		      action = new ConfirmCheckoutProAction();
		      
		      try {
		        forward = action.execute(request, response);
		      } catch (Exception e) {
		        System.out.println("controller-confirmCheckout 실패"+ e.getMessage());
		        System.out.println("controller- 에러:"+e);
		        
		      }
			
		} 
		
		// 영비
//		else if(command.equals("/confirmCheckout.sh")) {
//			System.out.println(" itemFrontController -->confirm_checkout.sh--");
//			forward = new ActionForward();
//			forward.setPath("./shop/confirm_checkout.jsp");
//		}
		
		
		if (forward != null) {
			if (forward.isRedirect()) { // Redirect
			//	System.out.println("forward.getPath() :: " + forward.getPath());
				response.sendRedirect(forward.getPath());
			} else { // Dispatch
				RequestDispatcher dispatch = request.getRequestDispatcher(forward.getPath());
				dispatch.forward(request, response);
			}
		}
	

		
	}
	

}

