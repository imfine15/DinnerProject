<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

<style>

#admin-header {
	position:fixed;
	width: 100%;
	height:50px;
	background-color: #E07370;
	z-index:1;
}

.sidenav {
	position: fixed;
	width: 250px;
	height: 100%;
	background-color: #E4E4E4;
}

.sidenav .main-buttons {
	list-style-type: none;
	margin: 50px 0;
	padding: 0;
	color: black;
}

.sidenav .main-buttons li {
	text-transform: uppercase;
	letter-spacing: 2px;
	font-family: Noto Sans KR;
	font-size: 16px;
}

.sidenav .main-buttons>li {
	padding: 16px 40px;
	padding-left:20px;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.sidenav .main-buttons>li .fa {
	position: absolute;
	left: 12px;
	color: black;
}

.sidenav .main-buttons>li:hover, .sidenav .main-buttons>li:active,
	.sidenav .main-buttons>li:focus {
	background-color: #C4C4C4;
	cursor: pointer;
}

.sidenav .main-buttons>li:hover .hidden, .sidenav .main-buttons>li:active .hidden,
	.sidenav .main-buttons>li:focus .hidden {
	width: 200px;
}

.hidden {
	width: 0;
	height: 100%;
	padding: 50px 0;
	position: absolute;
	top: 0;
	right: 0;
	overflow: hidden;
	list-style-type: none;
	background-color: white;
	-moz-transition: 0.3s;
	-o-transition: 0.3s;
	-webkit-transition: 0.3s;
	transition: 0.5s;
	
}

.hidden li {
	padding: 16px 24px;
}

.hidden li:hover, .hidden li:active, .hidden li:focus {
	background-color: #C4C4C4;
}

.sidenav {
	line-height: 30px;
	margin: 0;
	font-weight:bolder;
}

html, body {
	height: 100%;
	margin:0;
}
#welcome-user {
	float:right;
	margin-right:2%;
	font-family:Noto Sans KR;
	font-size:16px;
	color:white;
	line-height:15px;
	display:inline-block;
}
#admin-t {
	float:left;
	margin-left:85px;
	font-family:Noto Sans KR;
	font-size:18px;
	color:white;
	line-height:15px;
	display:inline-block;
}
#logout {
	float:right;
	display: inline-block;
	margin-right:25px;
	margin-top:13px;
}
#logoutBtn {
	margin-top:-3px;
	width:80px;
	height:30px;
	font-size:14px;
	color:black;
	background-color:white;
	border:none;
}
a:link,a:visited, a:active, a:hover {
	text-decoration:none; 
	color:white;
}
</style>
</head>
<body>
	<!-- header start -->
	<header id="admin-header">
		<div id="admin-t">
			<p><a href="<%=request.getContextPath()%>/select.ma">ADMINISTRATOR</a></p>
		</div>
		<div id="logout">
		<button id="logoutBtn" onclick="">로그아웃</button>
		</div>
		<div id="welcome-user">
			<p>안녕하세요, IMFINE 님</p>
		</div>
	</header>
	<!-- header end -->

	<!-- sidebar start -->
	<div id="sidebar">
		<nav class="sidenav">
			<div style="height:50px"></div>
			<ul class="main-buttons">
				<li><img style="width:23px;"src="/semiproject/images/shop.png"><i class="fa fa-circle fa-2x"></i>&nbsp;예약/가게/리뷰 관리
					<ul class="hidden">
						<div style="height:50px"></div>
						<li onclick="goReservationHistory();">예약 내역</li>
						<li onclick="goRegistrationStoreRequest();">가게 등록 요청</li>
						<li onclick="goReviewManage();">리뷰 게시글 관리</li>
					</ul></li>
					
				<li><img style="width:23px;"src="/semiproject/images/warning.png"><i class="fa fa-circle fa-2x"></i>&nbsp;공지사항
					<ul class="hidden">
						<div style="height:50px"></div>
						<li onclick="goClientNotice();">고객 공지사항</li>
						<li onclick="goEnterNotice();">업체 공지사항</li>
						<li onclick="goAdminNotice();">관리자 공지사항</li>
					</ul></li>
				<li><img style="width:23px;"src="/semiproject/images/payment-method.png"><i class="fa fa-circle fa-2x"></i> 정산 환불관리
					<ul class="hidden">
						<div style="height:50px"></div>
						<li onclick="goMemberRefundHistory();">회원 환불 내역</li>
						<li onclick="goCalculateRequestManage();">정산 요청 관리</li>
						<li onclick="goDemurrerHistory();">정산 이의신청 내역</li>
					</ul></li>
				<li><img style="width:23px;"src="/semiproject/images/question.png"><i class="fa fa-circle fa-2x"></i> 문의사항 관리
					<ul class="hidden">
						<div style="height:50px"></div>
						<li onclick="goPartnerRequestManage();">제휴 문의 관리</li>
						<li onclick="goAdRequestManage();">광고 문의 관리</li>
						<li onclick="goMemberQuestionManage();">회원 문의 관리</li>
					</ul></li>
				<li><img style="width:23px;"src="/semiproject/images/value.png"><i class="fa fa-circle fa-2x"></i> 고객 관리
					<ul class="hidden">
						<div style="height:50px"></div>
						<li onclick="goMemberManage();">회원 관리</li>
						<li onclick="goEnterManage();">업체 관리</li>
						<li onclick="goMemberReportHistory();">회원 신고내역 관리</li>
					</ul></li>
				<li><img style="width:23px;"src="/semiproject/images/value.png"><i class="fa fa-circle fa-2x"></i> 직원 관리
					<ul class="hidden">
						<div style="height:50px"></div>
						<li onclick="goAdminManage();">직원 정보 관리</li>
					</ul></li>

			</ul>
		</nav>
	</div>
	<!-- sidebar end -->
	<script>
		function goClientNotice() {
			location.href="<%=request.getContextPath()%>/selectclist.no";
		}
		
		function goReservationHistory() {
			location.href="<%=request.getContextPath()%>/";
		}
		
		function goRegistrationStoreRequest() {
			location.href="<%=request.getContextPath()%>/selectEntList.up";
		}
		
		function goReviewManage() {
			location.href="<%=request.getContextPath()%>/selectListSchedule.up";
		}
		
		function goEnterNotice() {
			location.href="<%=request.getContextPath()%>/selectElist.no";
		}
		
		function goAdminNotice() {
			location.href="<%=request.getContextPath()%>/selectAdminList.no";
		}
		
		function goMemberRefundHistory() {
			location.href="<%=request.getContextPath()%>/";
		}
		
		function goCalculateRequestManage() {
			location.href="<%=request.getContextPath()%>/";
		}
		
		function goDemurrerHistory() {
			location.href="<%=request.getContextPath()%>/";
		}
		
		function goPartnerRequestManage() {
			location.href="<%=request.getContextPath()%>/selectList.pa";
		}
		
		function goAdRequestManage() {
			location.href="<%=request.getContextPath()%>/selectAdList.ad";
		}
		
		function goMemberQuestionManage() {
			location.href="<%=request.getContextPath()%>/selectQuestionList.qu";
		}
		
		function goMemberManage() {
			location.href="<%=request.getContextPath()%>/";
		}
		
		function goEnterManage() {
			location.href="<%=request.getContextPath()%>/select.cm";
		}
		
		function goMemberReportHistory() {
			location.href="<%=request.getContextPath()%>/";
		}
		function goAdminManage() {
			location.href="<%=request.getContextPath()%>/selectList.ma";
		}
		
	</script>
</body>
</html>

