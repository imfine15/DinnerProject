<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int asd = 1;
	 
	 if(request.getParameter("asd") == null){
		 response.sendRedirect("/semiproject/views/enterprise/signIn/signIn.jsp");
	 }else{
	 	asd = Integer.parseInt(request.getParameter("asd")); 
	 }
	
	String pageName = "";
	switch(asd){
	case 1 : pageName = "예약 요청 확인"; break;
	case 2 : pageName = "전체 예약 일정"; break;
	case 3 : pageName = "댓글 관리"; break;
	case 4 : pageName = "정산 내역"; break;
	case 5 : pageName = "결제 내역"; break;
	case 6 : pageName = "제재내역"; break;
	case 7 : pageName = "보고서"; break;
	default : pageName = "에러 발생"; break;
	} %>
<!doctype html>
<html lang="ko">
<head>
<title>사장님 페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/semiproject/views/enterprise/sidebar/css/style.css">
</head>
<body>
<div style="background: white;">
		<div class="container2" style="background: white; box-shadow:0px 5px 10px 5px #DE6B6B;">
			<a href="">
				<img src="/semiproject/images/YUMEET LOGO.png" style="width: 200px; background:white;">
			</a>
				
			<a href="" style="float: right">
				<img src="/semiproject/images/myicon.png" style="height:66.63px; width: 95px; background:white;">
			</a>
				
			<a href="" style="float: right">
				<img src="/semiproject/images/location.png" style="height:66.63px; width: 95px; background:white;">
			</a>
		</div>
	</div>
<div class="wrapper d-flex align-items-stretch">
	<nav id="sidebar">
		<div class="custom-menu">
			<button type="button" id="sidebarCollapse" class="btn btn-primary">
			<i class="fa fa-bars"></i>
			</button>
		</div>
		<div class="p-4 pt-5" id="sidebarTop" style="border-bottom-right-radius:100px;">
			<h2 id="sidebarTitle"><a href="index.html" class="logo"  style="color:white;"><%= pageName %></a></h2>
			<ul class="list-unstyled components mb-5">
				<li>
					<a href="/semiproject/views/enterprise/confirmRequest/confirmRequest.jsp?asd=1">예약 요청 확인</a>
				</li>
				<li>
					<a href="/semiproject/views/enterprise/reservationDate/reservationDate.jsp?asd=2">전체 예약 일정</a>
				</li>
				<li>
					<a href="/semiproject/views/enterprise/commentManage/commentManage.jsp?asd=3">댓글 관리</a>
				</li>
				<li>
					<a href="/semiproject/views/enterprise/paymentHistory/paymentHistory.jsp?asd=4">정산 내역</a>
				</li>
				<li>
					<a href="/semiproject/views/enterprise/sanctionsDetails/sanctionsDetails.jsp?asd=5">결제 내역</a>
				</li>
				<li>
					<a href="/semiproject/views/enterprise/settlementDetails/settlementDetails.jsp?asd=6">제재내역</a>
				</li>
				<li>
					<a href="/semiproject/views/enterprise/report/report.jsp?asd=7">보고서</a>
				</li>
			</ul>
		</div>
	</nav>
	<!-- Page Content  -->

</div>
<br>
<script>
	$(function () {
		$("ul li a").click(function () {
			$(".logo").html($(this).html());
			$("ul li a").css("color", "white");
			$(this).css("color", "#5EB8B4");
		});
	});
</script>
<script src="/semiproject/views/enterprise/sidebar/js/jquery.min.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/popper.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/bootstrap.min.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/main.js"></script>
</body>
</html>