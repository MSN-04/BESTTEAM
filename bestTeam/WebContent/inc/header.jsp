<%@page import="java.util.ArrayList"%>
<%@page import="svc.CartService"%>
<%@page import="vo.CartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<link rel="stylesheet" type="text/css" href="./css/login.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		$('a.login-window').click(function() {

			// Getting the variable's value from a link 
			var loginBox = $(this).attr('href');

			//Fade in the Popup and add close button
			$(loginBox).fadeIn(300);

			//Set the center alignment padding + border
			var popMargTop = ($(loginBox).height() + 24) / 2;
			var popMargLeft = ($(loginBox).width() + 24) / 2;

			$(loginBox).css({
				'margin-top' : -popMargTop,
				'margin-left' : -popMargLeft
			});

			// Add the mask to body
			$('body').append('<div id="mask"></div>');
			$('#mask').fadeIn(300);

			$('.login-popup').css({
				'display' : inline - block
			})

			return false;
		});

		$('.close, #mask').click(function() {
			$('#mask , .login-popup').fadeOut(300, function() {
				$('#mask').remove();
			});
		});

		// When clicking on the button close or the mask layer the popup closed
		return false;

	});
	
</script>

<nav
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar">
	<div class="container">
		<a href="./index.in"><img src="./images/untitled.png"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a href="./index.in"
					class="nav-link">Home</a></li>
				<li class="nav-item"><a href="./shopMain.em" class="nav-link">Shop</a></li>
				
				
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="./notice/notice.jsp"
					id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Notice</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="./noticeList.no">공지사항</a> <a
							class="dropdown-item" href="./faq.no">FAQ</a>
					</div></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="./blog/blog.jsp"
					id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Blog</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="./blog.bl">블로그</a> <a
							class="dropdown-item" href="./fest.et">Festival</a>
					</div></li>
				
				<li class="nav-item"><a href="./contact.et" class="nav-link">Contact</a></li>

				<%
					if (session.getAttribute("id") == null) {
				%>
				<li class="nav-item"><a href="#login-box"
					class="login-window nav-link">Login</a></li>
				<li class="nav-item"><a href="join.us" class="nav-link">SignUp</a></li>
				<%
					} else {
				%>
				<li class="nav-item"><a href="Mypage.us" class="nav-link">Mypage</a></li>
				<li class="nav-item"><a href="LogoutProAction.us"
					class="nav-link">Logout</a></li>
				<%
					}
				%>
			
				<li class="nav-item cart"><a href="./cart.sh" class="nav-link">
						<span class="icon icon-shopping_cart"></span> 
						<!-- 상단 장바구니아이콘에 담은 개수 표시 -->
						<% if (session.getAttribute("id") != null) {
							String idForCartNum = (String) session.getAttribute("id");
							CartService cartScvForNum = new CartService();
							ArrayList<CartBean> cartListForCartNum = cartScvForNum.cartList(idForCartNum);
							
							int intForCartNum = cartListForCartNum.size();
							
							if (intForCartNum > 0) {	%>
								<span class="bag d-flex justify-content-center align-items-center" id="numOfCartItems"><small><%=intForCartNum %></small></span>
						<% 	}
						}%>
				</a></li>
			</ul>
		</div>

		<div id="login-box" class="login-popup"
			style="width: 300px; height: 300px;">
			<a class="close"><img src="./images/close_pop.png"
				class="btn_close" title="Close Window" alt="Close" /></a>
			<form method="post" class="signin" action="LoginProAction.us">

				<fieldset class="textbox">
					<span id="login-logo"><img src="./images/untitled.png"></span>
					<span></span> <label class="username"> <input
						id="username" name="id" value="" type="text" autocomplete="on"
						placeholder="Username">
					</label> <label class="password"> <input id="password"
						name="password" value="" type="password" placeholder="Password">
					</label>
					<button class="submit button btn btn-primary" type="submit">LOGIN</button>
				</fieldset>
			</form>
			
			<div class="form-group fgdiv">
				<a class="fg" href="ForgotAccount.us">아이디/비밀번호 찾기</a>
			</div>
		</div>
	</div>
</nav>