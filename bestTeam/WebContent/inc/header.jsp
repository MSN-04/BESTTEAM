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
<!-- 		<a class="navbar-brand" href="./index/index.jsp">Coffee<small>Blend</small></a> -->
		<a href="./index/index.jsp"><img src="./images/untitled.png"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu </button>
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a href="./index/index.jsp"
					class="nav-link">Home</a></li>
				<li class="nav-item"><a href="./shop/shop.jsp"
					class="nav-link">Shop</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="./notice/notice.jsp"
					id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Notice</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="./notice/notice.jsp">공지사항</a> <a
							class="dropdown-item" href="./notice/faq.jsp">FAQ</a>
					</div></li>
				<li class="nav-item"><a href="./blog/blog.jsp" class="nav-link">Blog</a></li>
				<li class="nav-item"><a href="./fest/fest.jsp" class="nav-link">Festival</a></li>
				<li class="nav-item"><a href="./contact/contact.jsp" class="nav-link">Contact</a></li>
				
				<%
				if(session.getAttribute("id")==null){
				%>	
				<li class="nav-item"><a href="login.us" class="login-window nav-link">Login</a></li>
				<li class="nav-item"><a href="join.us" class="nav-link">SignUp</a></li>
				<%	
				} else {
				%>
				<li class="nav-item"><a href="MypageProAction.us" class="nav-link">Mypage</a></li>
				<li class="nav-item"><a href="LogoutProAction.us" class="nav-link">Logout</a></li>
				<%	
				}
				%>
				
				<li class="nav-item cart"><a href="./shop/cart.jsp" class="nav-link">
				<span class="icon icon-shopping_cart"></span>
				<span class="bag d-flex justify-content-center align-items-center"><small>1</small></span></a></li>
			</ul>
		</div>
		<div id="login-box" class="login-popup" style="width: 300px; height: 300px;">
			<a class="close"><img src="./images/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a>
			<form method="post" class="signin" action="LoginProAction.us">
				<fieldset class="textbox">
					<label class="username"> <span>ID</span> 
					<input id="username" name="id" value="" type="text" autocomplete="on" placeholder="Username">
					</label> <label class="password"> <span>Password</span> 
					<input id="password" name="password" value="" type="password" placeholder="Password">
					</label>
					<button class="submit button btn btn-primary" type="submit">LOGIN</button>
				</fieldset>
			</form>
			<br>
			<div>
			<a id="kakao-login-btn"></a> <a
				href="http://developers.kakao.com/logout"></a>
			<script type='text/javascript'>
				//<![CDATA[
				// 사용할 앱의 JavaScript 키를 설정해 주세요.
				Kakao.init('76c44c7c7a9a578e567bd1ffb9bc9b53');
				// 카카오 로그인 버튼을 생성합니다.
				Kakao.Auth.createLoginButton({
					container : '#kakao-login-btn',
					success : function(authObj) {
						alert(JSON.stringify(authObj));
					},
					fail : function(err) {
						alert(JSON.stringify(err));
					}
				});
				//]]>
			</script>
			</div>
			<div class="form-group fgdiv">
	             <a class="fg" href="ForgotAccount.us">아이디/비밀번호 찾기</a>
			</div>
		</div>
	</div>
</nav>