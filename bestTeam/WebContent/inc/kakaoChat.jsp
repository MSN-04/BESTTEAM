<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 카카오톡 상담------------------------------- -->

	<!-- ../css/kakaoChat.css 파일 => <link rel="stylesheet" href="./css/kakaoChat.css">, 
		 ../images/icon_kakao.png 이미지도 함께 넣어주세요 -->
	
	    <div id="plusfriend-chat-button"></div>
	    <a href="javascript:void plusFriendChat()">
		  <img id="kakaoChat" src="./images/icon_kakao.png"/>
		</a>
		<script type='text/javascript'>
		  //<![CDATA[
		    // 사용할 앱의 JavaScript 키를 설정해 주세요.
		    Kakao.init('9600bd080a754be9e17d773bd75df6de');
		    function plusFriendChat() {
		      Kakao.PlusFriend.chat({
		        plusFriendId: '_iTRgj' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
		      });
		    }
		  //]]>
		</script>

<!-- 카카오톡 상담 End------------------------------- -->