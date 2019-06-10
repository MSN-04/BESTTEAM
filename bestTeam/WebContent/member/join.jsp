
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Coffee - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
  href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
  rel="stylesheet">
<link
  href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700"
  rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Great+Vibes"
  rel="stylesheet">

<link rel="stylesheet" href="./css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="./css/animate.css">

<link rel="stylesheet" href="./css/owl.carousel.min.css">
<link rel="stylesheet" href="./css/owl.theme.default.min.css">
<link rel="stylesheet" href="./css/magnific-popup.css">

<link rel="stylesheet" href="./css/aos.css">

<link rel="stylesheet" href="./css/ionicons.min.css">

<link rel="stylesheet" href="./css/bootstrap-datepicker.css">
<link rel="stylesheet" href="./css/jquery.timepicker.css">


<link rel="stylesheet" href="./css/flaticon.css">
<link rel="stylesheet" href="./css/icomoon.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/shop.css">

<style type="text/css">
.money {
  text-align: right;
}

.btn-best {
  background-color: #C49B63 !important;
  color: black !important;
}

.btn-best:hover {
  background-color: black !important;
  border: 1px solid #C49B63 !important;
  color: #C49B63 !important;
}

.btn-best:active {
  background-color: #C49B63 !important;
  color: black !important;
}

.p-best {
  padding: 50px !important;
}

#checkPwd{
  color : #ff4d4d;
  font-size: 13px;
  margin-left: 73%;
}

#checkMsg{
  color : #ff4d4d;
  font-size: 13px;
  margin-bottom: 5%;
  margin-left: 27%;
}

#checkMail{
  color : #ff4d4d;
  font-size: 13px;
  margin-bottom: 5%;
}


</style>
<!-- id, pass, mail check -->
<script type="text/javascript" src="./js/httpRequest.js"></script>
<script type="text/javascript">
 var checkFirst = false;
 var lastKeyword = '';
 var loopSendKeyword = false;
//아이디, 패스워드, 메일 적합한지 검사할 정규식
 var regId = /^[a-zA-Z0-9]{8,12}$/ ;
 var regPass = /^[a-zA-Z0-9]{8,12}$/;
 var regMail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

 
 // 비밀번호 일치 확인
 function checkPwd(){
  var pw1 = frm.pass.value;
  var pw2 = frm.pass2.value;
  var pass = document.getElementById("pass");
  if(check(regPass,pass)){
	  if(pw1!=pw2){
	   document.getElementById('checkPwd').style.color = "#ff4d4d";
	   document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요"; 
	  }else{
	   document.getElementById('checkPwd').style.color = "#4d79ff";
	   document.getElementById('checkPwd').innerHTML = "사용할수 있는 암호 입니다"; 
	   
	  }
  } else {
	  document.getElementById('checkPwd').style.color = "#ff4d4d";
	   document.getElementById('checkPwd').innerHTML = "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력"; 
  }
  
 }
 
  function checkId() {
  if (checkFirst == false) {
   //0.5초 후에 sendKeyword()함수 실행
   setTimeout("sendId();", 500);
   loopSendKeyword = true;
  }
  checkFirst = true;
 }
 
 // 아이디 중복확인
 function sendId() {
    if (loopSendKeyword == false) return;
    
    var keyword = frm.id.value;
    if (keyword == '') {
     lastKeyword = '';
     document.getElementById('checkMsg').style.color = "#ff4d4d";

document.getElementById('checkMsg').innerHTML = "아이디를 입력하세요.";
    } else if (keyword != lastKeyword) {
     lastKeyword = keyword;
     
     if (keyword != '') {
      var params = "id="+keyword;
      sendRequest("id_check.us", params, displayResult, 'POST');
     } else {
     }
    }
    setTimeout("sendId();", 500);
   }
 
 // id 중복확인 결과
 function displayResult() {
  if (httpRequest.readyState == 4) {
   if (httpRequest.status == 200) {
    var resultText = httpRequest.responseText;
    var listView = document.getElementById('checkMsg');
//     alert(resultText);
	var id = document.getElementById("id");
	if(check(regId,id)){
	    if(resultText==0){
	     listView.innerHTML = "사용 할 수 있는 ID 입니다";
	     listView.style.color = "#4d79ff";
	    }else{
	     listView.innerHTML = "이미 등록된 ID 입니다";
	     listView.style.color = "#ff4d4d";
	    }
		
	} else {
		listView.innerHTML = "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력";
	     listView.style.color = "#ff4d4d";
	}
   } else {
    alert("에러 발생: "+httpRequest.status);
   }
  }
 }
 
 function checkMail() {
    var keyword = frm.email.value;
    if (keyword == '') {
       lastKeyword = '';
       document.getElementById('checkMail').style.color = "#ff4d4d";
       document.getElementById('checkMail').innerHTML = "메일을 입력하세요.";
    } else if (keyword != '') {
    	var mail = document.getElementById("email");
    	if(check(regMail,mail)){
	        var params = "email="+keyword;
	        sendRequest("mail_check.us", params, displayResultMail, 'POST');
    	} else {
    		document.getElementById('checkMail').style.color = "#ff4d4d";
    	       document.getElementById('checkMail').innerHTML = "메일 형식을 확인하세요.";
    	}
      
    }
 }
    
   
 
 
 function sendMail() {
	  if (loopSendKeyword == false) return;
	    
	    var keyword = frm.email.value;
	    if (keyword == '') {
	     lastKeyword = '';
	     document.getElementById('checkMail').style.color = "#ff4d4d";

	document.getElementById('checkMail').innerHTML = "메일을 입력하세요";
	    } else if (keyword != lastKeyword) {
	     lastKeyword = keyword;
	     
	     if (keyword != '') {
	      var params = "email="+keyword;
	      sendRequest("mail_check.us", params, displayResultMail, 'POST');
	     } else {
	     }
	    }
	    setTimeout("sendMail();", 500);
   }


function displayResultMail() {
 if (httpRequest.readyState == 4) {
  if (httpRequest.status == 200) {
   var resultText = httpRequest.responseText;
   var listView = document.getElementById('checkMail');
//    alert(resultText);
	   if(resultText==0){
	    listView.innerHTML = "사용 할 수 있는 MAIL 입니다";
	    listView.style.color = "#4d79ff";
	   }else{
	    listView.innerHTML = "이미 등록된 MAIL 입니다";
	    listView.style.color = "#ff4d4d";
	   }
	  } else {
   alert("에러 발생: "+httpRequest.status);
  }
 }
}

//검사수행 함수
function check(reg, what) {
     if(reg.test(what.value)) {
         return true;
     } else {
//      alert(message);
//      what.value = what.value;
//      what.focus();
     return false;
     }
//      return true;
    
 }

</script>


</head>
<body>
  <header>
    <jsp:include page="../inc/header.jsp" />
    <!-- END nav -->
  </header>

  <section class="home-slider owl-carousel">

    <div class="slider-item"
      style="background-image: url(./images/bg_3.jpg);"
      data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div
          class="row slider-text justify-content-center align-items-center">

          <div class="col-md-7 col-sm-12 text-center ftco-animate">
            <h1 class="mb-3 mt-5 bread">Sign Up</h1>
            <p class="breadcrumbs">
              <span class="mr-2"><a href="./index/index.jsp">Home</a></span> <span>SignUp</span>
            </p>
          </div>

        </div>
      </div>
    </div>
  </section>


<section class="ftco-section">
    <div class="container">
      <div class="row">
        <div class="col-xl-8 ftco-animate" style="margin: auto;">
          <form action="JoinProAction.us" class="billing-form ftco-bg-dark p-3 p-md-5" id="frm" name="frm" method="post" >
            <h3 class="mb-4 billing-heading">회원 가입</h3>
            <div class="row align-items-end">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="firstname">아이디</label> <input type="text"
                    class="form-control" placeholder="아이디를 입력해주세요." name="id" id="id" onkeyup="checkId()" />
                </div>
              </div>
              <div id="checkMsg">아이디를 입력하세요</div>
              <div class="w-100"></div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="firstname">비밀번호</label> <input type="password"
                    class="form-control" placeholder="비밀번호를 입력해주세요." name="pass" id="pass">
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="firstname">비밀번호 확인</label> <input type="password"
                    class="form-control" placeholder="비밀번호를 입력해주세요." name="pass2" id="pass2" onkeyup="checkPwd()" >
                </div>
              </div>
                <div id="checkPwd">동일한 암호를 입력하세요</div>
              <div class="w-100" ></div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="firstname">이 름</label> <input type="text"
                    class="form-control" placeholder="이름을 입력해주세요." name="name">
                </div>
              </div>
              <div class="w-100"></div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="firstname">주민 등록 번호</label> <input type="text"
                    class="form-control" placeholder="6자리 입력하세요" name="jumin1">
                </div>
              </div>
              
              <div class="col-md-6">
                <div class="form-group">
                   <input type="password" class="form-control" placeholder="7자리 입력하세요"
                    name="jumin2">
                </div>
              </div>
              <div class="w-100"></div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="emailaddress">Email</label> <input type="text"
                    class="form-control" placeholder="이메일을 입력해주세요." name="email" id="email">
                </div>
              </div>
              <div class="col-md-6">
                <div class="">
                  <label for=""></label>
                  <p>
                    <input type="button" class="btn btn-best py-3 px-4" onclick="checkMail()" value="중복체크">
                  </p>
                </div>
              </div>
              <div id="checkMail">E-MAIL 중복확인 하세요</div>
              <div class="w-100"></div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="phone">연락처</label> <input type="text"
                    class="form-control" placeholder="폰번호를 입력해주세요." name="phone">
                </div>
              </div>
              <div class="w-100"></div>
              <div class="w-100"></div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="postcodezip">우편번호</label> <input type="text"
                    class="form-control" id="postcode" placeholder="우편번호"
                    required="required" name="post">
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="towncity"></label>
                  <p onclick="execDaumPostcode()">
                    <a class="btn btn-best py-3 px-4">우편번호 검색</a>
                  </p>
                </div>
              </div>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
              <script>

          function execDaumPostcode() {
              
            var width = 500;
            var height = 480;
            
                new daum.Postcode({
                  
                    oncomplete: function(data) {
                    
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        
                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수
        
                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }
        
                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if(data.userSelectedType === 'R'){
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraAddr !== ''){
                                extraAddr = ' (' + extraAddr + ')';
                                addr = addr + extraAddr;
                            }
                        
                        } 
        
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('postcode').value = data.zonecode;
                        document.getElementById("address").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("detailAddress").focus();
                    },
                    
                
                theme: {
                     bgColor: "#120F0F", //바탕 배경색
                     searchBgColor: "#120F0F", //검색창 배경색
                     contentBgColor: "#030202", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
                     pageBgColor: "#030202", //페이지 배경색
                     textColor: "#F4F4F4", //기본 글자색
                     queryTextColor: "#FFFFFF", //검색창 글자색
                     postcodeTextColor: "#FA4256", //우편번호 글자색
                     emphTextColor: "#C87919", //강조 글자색
                     outlineColor: "#444444" //테두리
                },
                    
                    width: width,
                    height: height,
                    
                }).open({
                    left: window.screen.width/2 - width/2,
                    top: window.screen.height/2 - height/2 - 100
                });
            }
        </script>
              <div class="w-100"></div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="streetaddress">주소</label> <input type="text"
                    class="form-control" id="address" placeholder="주소" name="address1">
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <input type="text" class="form-control" id="detailAddress"
                    placeholder="상세주소" required="required" name="address2">
                </div>
              </div>
              <div class="w-100"></div>
              
              <div class="col-md-12">
                <div class="form-group mt-4">


<!--                   <a href="#" class="btn btn-primary p-3 px-xl-4 py-xl-3" onclick="document.getElementById('frm').submit();">가입하기</a>  -->
                  <input type="submit" class="btn btn-primary p-3 px-xl-4 py-xl-3" value="가입하기">
                  <a href="index.in" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">취소하기</a>
                    </div>
                </div>
              </div>  
          </form>
        </div>
      </div>
    </div>

    <!-- END -->



  </section>
  <!-- .section -->

  <footer class="ftco-footer ftco-section img">
    <jsp:include page="../inc/footer.jsp" />
  </footer>



  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
      <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
        stroke-width="4" stroke="#eeeeee" />
      <circle class="path" cx="24" cy="24" r="22" fill="none"
        stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
  </div>


  <script src="./js/jquery.min.js"></script>
  <script src="./js/jquery-migrate-3.0.1.min.js"></script>
  <script src="./js/popper.min.js"></script>
  <script src="./js/bootstrap.min.js"></script>
  <script src="./js/jquery.easing.1.3.js"></script>
  <script src="./js/jquery.waypoints.min.js"></script>
  <script src="./js/jquery.stellar.min.js"></script>
  <script src="./js/owl.carousel.min.js"></script>
  <script src="./js/jquery.magnific-popup.min.js"></script>
  <script src="./js/aos.js"></script>
  <script src="./js/jquery.animateNumber.min.js"></script>
  <script src="./js/bootstrap-datepicker.js"></script>
  <script src="./js/jquery.timepicker.min.js"></script>
  <script src="./js/scrollax.min.js"></script>
  <script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="./js/google-map.js"></script>
  <script src="./js/main.js"></script>
  

  <script>
    $(document).ready(function() {

      var quantitiy = 0;
      $('.quantity-right-plus').click(function(e) {

        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('#quantity').val());

        // If is not undefined

        $('#quantity').val(quantity + 1);

        // Increment

      });

      $('.quantity-left-minus').click(function(e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('#quantity').val());

        // If is not undefined

        // Increment
        if (quantity > 0) {
          $('#quantity').val(quantity - 1);
        }
      });

    });
  </script>


</body>
</html>