<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script type="text/javascript">
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




 </script>

</body>
</html>