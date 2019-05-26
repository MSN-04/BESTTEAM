<%@page import="vo.QnaBean"%>
<%@page import="vo.NoticeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script language="javascript">
function delconfirm(num){
var message = confirm("이 게시글을 삭제하시겠습니까?");
if(message == true){
	location.href ="./noticeDeletePro.no?num="+num;
}else
	alert("취소되었습니다");
return false;
}
</script>
<%
	// ???????
// 	NoticeBean article = (NoticeBean)request.getAttribute("article");
// 	NoticeBean noticeBean = (NoticeBean)request.getAttribute("NoticeBean");
	
	String nowPage = (String) request.getAttribute("page"); // String 타입으로 setAttribute() 메서드에 저장했을 경우
	ArrayList<NoticeBean> articleList = (ArrayList<NoticeBean>) request.getAttribute("articleList");
	NoticeBean noticebean = new NoticeBean();
	int noticeNum = noticebean.getNotice_num();
	System.out.println(noticeNum);
%>
<%
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Coffee - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">

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
    
    
    <style type="text/css">
/*      	.col-md-8 { border: 1px solid aqua; }  */
     	.col-md-8 {
     		flex: auto;
     		margin: auto;
     		max-width: 80%;
     	} 
    
/*     	.col-md-8 { background-color: #000; } */
    	.col-md-8 img { width: 100%; } /* 폼에 들어가는 사진 크기 조정(반드시 필요) */
    	.col-md-8 p { /* 자동 개행 */
    		word-wrap: break-word; 
    		white-space: pre-wrap; 
    		word-break: break-all;
    	}
    	.row {
    		flex-wrap: nowrap;
    	}
    	
    </style>
    
  </head>
  <body>
  		<jsp:include page="/inc/header.jsp"></jsp:include>
    <!-- END nav -->

    <section class="home-slider owl-carousel">

      <div class="slider-item" style="background-image: url(../images/bg_3.jpg);" data-stellar-background-ratio="0.5">
      	<div class="overlay"></div>
        <div class="container">
        
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">Notice Details</h1>
	            <p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home</a></span> <span class="mr-2"><a href="notice.jsp">Notice</a></span> <span>Blog Single</span></p>
            </div>

          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-md-8 ftco-animate" >
          	<%    
			    //제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가                                                   
			    request.setCharacterEncoding("utf-8");
			    
// 			    String subject = request.getParameter("subject");
// 			    String content = request.getParameter("content");
// 			    article.getNotice_subject();
// 			    article.getNotice_content();
			   
			%>
			
	 			<div style="border-bottom: 1px solid grey; margin-bottom: 30px;
	 			font-size: 50px; font-weight: 300;
	 			font-family: Josefin Sans, Arial, sans-serif;"><%=noticeNum %></div>
	 			
				<div style="margin: auto;"><%=noticebean.getNotice_num() %></div>
 			
           
          </div> <!-- .col-md-8 -->
          <a href="./noticeModifyForm.no?notice_num=<%=noticeNum %>" class="btn btn-primary btn-outline-primary">글수정</a>
          
          <a href="./noticedeletePro.no?notice_num=<%=noticeNum %>" class="btn btn-primary btn-outline-primary" onclick="delconfirm('<%=noticeNum %>')">글삭제</a>
          <a href="./noticeList.no" class="btn btn-primary btn-outline-primary">글목록</a>
          
<!--           <div class="col-md-4 sidebar ftco-animate"> -->
<!--             <div class="sidebar-box"> -->
<!--               <form action="#" class="search-form"> -->
<!--                 <div class="form-group"> -->
<!--                 	<div class="icon"> -->
<!-- 	                  <span class="icon-search"></span> -->
<!--                   </div> -->
<!--                   <input type="text" class="form-control" placeholder="Search..."> -->
<!--                 </div> -->
<!--               </form> -->
<!--             </div> -->
            
            
<!--             <div class="sidebar-box ftco-animate"> -->
<!--               <div class="categories"> -->
<!--                 <h3>Categories</h3> -->
<!--                 <li><a href="#">Tour <span>(12)</span></a></li> -->
<!--                 <li><a href="#">Hotel <span>(22)</span></a></li> -->
<!--                 <li><a href="#">Coffee <span>(37)</span></a></li> -->
<!--                 <li><a href="#">Drinks <span>(42)</span></a></li> -->
<!--                 <li><a href="#">Foods <span>(14)</span></a></li> -->
<!--                 <li><a href="#">Travel <span>(140)</span></a></li> -->
<!--               </div> -->
<!--             </div> -->

<!--             <div class="sidebar-box ftco-animate"> -->
<!--               <h3>Recent Blog</h3> -->
<!--               <div class="block-21 mb-4 d-flex"> -->
<!--                 <a class="blog-img mr-4" style="background-image: url(../images/image_1.jpg);"></a> -->
<!--                 <div class="text"> -->
<!--                   <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3> -->
<!--                   <div class="meta"> -->
<!--                     <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div> -->
<!--                     <div><a href="#"><span class="icon-person"></span> Admin</a></div> -->
<!--                     <div><a href="#"><span class="icon-chat"></span> 19</a></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="block-21 mb-4 d-flex"> -->
<!--                 <a class="blog-img mr-4" style="background-image: url(../images/image_2.jpg);"></a> -->
<!--                 <div class="text"> -->
<!--                   <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3> -->
<!--                   <div class="meta"> -->
<!--                     <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div> -->
<!--                     <div><a href="#"><span class="icon-person"></span> Admin</a></div> -->
<!--                     <div><a href="#"><span class="icon-chat"></span> 19</a></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="block-21 mb-4 d-flex"> -->
<!--                 <a class="blog-img mr-4" style="background-image: url(../images/image_3.jpg);"></a> -->
<!--                 <div class="text"> -->
<!--                   <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3> -->
<!--                   <div class="meta"> -->
<!--                     <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div> -->
<!--                     <div><a href="#"><span class="icon-person"></span> Admin</a></div> -->
<!--                     <div><a href="#"><span class="icon-chat"></span> 19</a></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="sidebar-box ftco-animate"> -->
<!--               <h3>Tag Cloud</h3> -->
<!--               <div class="tagcloud"> -->
<!--                 <a href="#" class="tag-cloud-link">dish</a> -->
<!--                 <a href="#" class="tag-cloud-link">menu</a> -->
<!--                 <a href="#" class="tag-cloud-link">food</a> -->
<!--                 <a href="#" class="tag-cloud-link">sweet</a> -->
<!--                 <a href="#" class="tag-cloud-link">tasty</a> -->
<!--                 <a href="#" class="tag-cloud-link">delicious</a> -->
<!--                 <a href="#" class="tag-cloud-link">desserts</a> -->
<!--                 <a href="#" class="tag-cloud-link">drinks</a> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="sidebar-box ftco-animate"> -->
<!--               <h3>Paragraph</h3> -->
<!--               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p> -->
<!--             </div> -->
<!--           </div> -->

<!--         </div> -->


      </div>
    </section> <!-- .section -->
    <footer>
  		<jsp:include page="../inc/footer.jsp"/>
  	</footer>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="./js/google-map.js"></script>
  <script src="./js/main.js"></script>
    
  </body>
</html>