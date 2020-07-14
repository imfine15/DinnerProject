<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<title>YUMEET 사장님페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/semiproject/views/enterprise/sidebar/css/style.css">
<style>
	.visitorReviewContent{
      width:706px;
      height:171px;
      margin:43px 0px 78px 40px;
      display:inline-block;
   }
   .visitorInfo > table {
      width:100%;
      margin-top:43px;
      text-align:center;
   }
   .visitorInfo p {
      width:100%;
      margin-top:45px;
      text-align:center;
      font-size:12px;
      color:#666666;
   }
   .visitorInfo > table tr td {
      font-size:12px;
      color:#666666;
   }
   
   .visitorReviewArticle, .visitorReviewPic {
      display:inline-block;
      width:100%;
      height:50%;
   }
   
   .visitorReviewArticle > p{
      font-size:14px;
   }
   
   .reviewDate {
      color:#818181;
      font-size:12px;
      margin-right:30px;
   }
   
   .reviewRate {
      font-size:14px;
   }
   
   .reviewRateStar {
      width:20px;
      height:20px;
   }
   .visitorReviewPic img {
      width:155px;
      height:87px;
      margin-right:10px;
   }
   
   .visitorReview {
      width:1039px;
      height:292px;
      margin:0 auto;
   }
   
   .visitorInfo {
      width:138px;
      height:292px;
      display:inline-block;
      float:left;
   }
	.payBtn{
		width:50px;
		height:25px;
		background: pink;
	}

   th, td{
      border-bottom: 1px solid black;
   }
   a{
      text-decoration: none;
      color:black;
   }
   tr{
      height:30px;
   }
   .hide{
      background-color: white;
      border: 0px;
      height:30px;
      width:30px;
   }
   .commentBtn{
   	background-color:#EB7673;
   	border:0;
   	color:white;
   	font-weight: bold;
   	border-radius: 4px;
   	text-align: center;
   }
</style>

</head>
<body>
	
<%@include file="../sidebar/sidebar.jsp" %>


	<!-- Page Content  -->
	<!-- <div id="content" class="p-4 p-md-5 pt-5">
           <div style="width:70%; height:600px;margin-left:auto; margin-right:auto;">
      <h1>회원관리</h1><br>
      <div style="padding-left:100px;">
         <label>사용자수 : 7명</label><br><br>
         <select style="width:70px; height:30px;">
            <option>이름</option>   
            <option>아이디</option>   
            <option>닉네임</option>
         </select>
         <input type="text" style="height: 23px;">
         <button style="height:30px;">검색</button> -->
         
         <br><br>
         <form action="" style="margin-left: 10%;">
         <div style="border:1px solid black; margin-left: 20%; width:900px; height:400px;">
        <div class="visitorInfo"  style="border-right:1px solid black; height:398px;">
         <table>
            <tr style="padding-bottom: 10%; ">
               <td style="border:0"><img alt="사용자 프로필 사진" src="/semiproject/images/userPic1.png"></td>
            </tr>
            <tr>
               <td style="border:0"><br>파덕이사생팬</td>
            </tr>
            <tr>
               <td style="border:0">방문일 : 2020-06-17</td>
            </tr>
            <tr>
               <td style="border:0">예약번호 : 20200710</td>
            </tr>
         </table>
      </div>
      <div class="visitorReviewContent">
         <div class="visitorReviewArticle">
            <span class="reviewDate">2020-06-18</span>
            <img alt="리뷰 별점" src="/semiproject/images/Star.png" class="reviewRateStar">
            <span class="reviewRate">4.5</span>
            <p>서비스가 맛있고 돈까스가 친절해요. 다섯이 가서 넷이 죽어도 모를 맛입니다. 최고입니다.</p>
         </div>
         <div class="visitorReviewPic">
            <img alt="음식 사진" src="/semiproject/images/규카츠.jpg">
            <img alt="음식 사진" src="/semiproject/images/dishPic.png">
            <br>
            <br>
            <textarea rows="4" cols="80" style="resize:none;"></textarea>
         </div>
         <button class="commentBtn" style="align-content: center; margin-left: 70%;">댓글 작성</button>
      </div>
      </div>
      </form>
      <br><br>
         <form action="" style="margin-left: 10%;">
         <div style="border:1px solid black; margin-left: 20%; width:900px; height:400px;">
        <div class="visitorInfo"  style="border-right:1px solid black; height:398px;">
         <table>
            <tr style="padding-bottom: 10%;">
               <td style="border:0"><img alt="사용자 프로필 사진" src="/semiproject/images/userPic1.png"></td>
            </tr>
            <tr>
               <td style="border:0"><br>파덕이사생팬</td>
            </tr>
            <tr>
               <td style="border:0">방문일 : 2020-06-17</td>
            </tr>
            <tr>
               <td style="border:0">예약번호 : 20200710</td>
            </tr>
         </table>
      </div>
      <div class="visitorReviewContent">
         <div class="visitorReviewArticle">
            <span class="reviewDate">2020-06-18</span>
            <img alt="리뷰 별점" src="/semiproject/images/Star.png" class="reviewRateStar">
            <span class="reviewRate">4.5</span>
            <p>서비스가 맛있고 돈까스가 친절해요. 다섯이 가서 넷이 죽어도 모를 맛입니다. 최고입니다.</p>
         </div>
         <div class="visitorReviewPic">
            <img alt="음식 사진" src="/semiproject/images/규카츠.jpg">
            <img alt="음식 사진" src="/semiproject/images/dishPic.png">
            <br>
            <br>
            <textarea rows="4" cols="80" style="resize:none;"></textarea>
         </div>
         <button class="commentBtn" style="align-content: center; margin-left: 70%;">댓글 작성</button>
      </div>
      </div>
      </form>
      <br><br><form action="" style="margin-left: 10%;">
         <div style="border:1px solid black; margin-left: 20%; width:900px; height:400px;">
        <div class="visitorInfo"  style="border-right:1px solid black; height:398px;">
         <table>
            <tr style="padding-bottom: 10%;">
               <td style="border:0"><img alt="사용자 프로필 사진" src="/semiproject/images/userPic1.png"></td>
            </tr>
            <tr>
               <td style="border:0"><br>파덕이사생팬</td>
            </tr>
            <tr>
               <td style="border:0">방문일 : 2020-06-17</td>
            </tr>
            <tr>
               <td style="border:0">예약번호 : 20200710</td>
            </tr>
         </table>
      </div>
      <div class="visitorReviewContent">
         <div class="visitorReviewArticle">
            <span class="reviewDate">2020-06-18</span>
            <img alt="리뷰 별점" src="/semiproject/images/Star.png" class="reviewRateStar">
            <span class="reviewRate">4.5</span>
            <p>서비스가 맛있고 돈까스가 친절해요. 다섯이 가서 넷이 죽어도 모를 맛입니다. 최고입니다.</p>
         </div>
         <div class="visitorReviewPic">
            <img alt="음식 사진" src="/semiproject/images/규카츠.jpg">
            <img alt="음식 사진" src="/semiproject/images/dishPic.png">
            <br>
            <br>
            <textarea rows="4" cols="80" style="resize:none;"></textarea>
         </div>
         <button class="commentBtn" style="align-content: center; margin-left: 70%;">댓글 작성</button>
      </div>
      </div>
      </form>
      <br><br><form action="" style="margin-left: 10%;">
         <div style="border:1px solid black; margin-left: 20%; width:900px; height:400px;">
        <div class="visitorInfo"  style="border-right:1px solid black; height:398px;">
         <table>
            <tr style="padding-bottom: 10%;">
               <td style="border:0"><img alt="사용자 프로필 사진" src="/semiproject/images/userPic1.png"></td>
            </tr>
            <tr>
               <td style="border:0"><br>파덕이사생팬</td>
            </tr>
            <tr>
               <td style="border:0">방문일 : 2020-06-17</td>
            </tr>
            <tr>
               <td style="border:0">예약번호 : 20200710</td>
            </tr>
         </table>
      </div>
      <div class="visitorReviewContent">
         <div class="visitorReviewArticle">
            <span class="reviewDate">2020-06-18</span>
            <img alt="리뷰 별점" src="/semiproject/images/Star.png" class="reviewRateStar">
            <span class="reviewRate">4.5</span>
            <p>서비스가 맛있고 돈까스가 친절해요. 다섯이 가서 넷이 죽어도 모를 맛입니다. 최고입니다.</p>
         </div>
         <div class="visitorReviewPic">
            <img alt="음식 사진" src="/semiproject/images/규카츠.jpg">
            <img alt="음식 사진" src="/semiproject/images/dishPic.png">
            <br>
            <br>
            <textarea rows="4" cols="80" style="resize:none;"></textarea>
         </div>
         <button class="commentBtn" style="align-content: center; margin-left: 70%;">댓글 작성</button>
      </div>
      </div>
      </form>
      <br><br>
      
	
	
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<%@include file="../../common/enterpriseFooter.jsp" %>
<script>
	$(function () {
		$("ul li a").click(function () {
			$(".logo").html($(this).html());
			$("ul li a").css("color", "white");
			$(this).css("color", "#5EB8B4");
		});
	});
	
	$(function () {
		$("button").click(function () {
			console.log("asd");
			$('#testModal').modal("show");
		});
	});
</script>
<!-- <script src="/semiproject/views/enterprise/sidebar/js/jquery.min.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/popper.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/bootstrap.min.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/main.js"></script> -->
</body>
</html>