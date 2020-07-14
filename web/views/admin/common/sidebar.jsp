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
	padding: 16px 52px;
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
	margin-right:3%;
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
	margin-right:20px;
	margin-top:13px;
}
</style>
</head>
<body>
	<!-- header start -->
	<header id="admin-header">
		<div id="admin-t">
			<p><a>ADMINISTRATOR</a></p>
		</div>
		<div id="logout">
		<button>로그아웃</button>
		</div>
		<div id="welcome-user">
			<p>안녕하세요, IMFINE 님</p>
		</div>
	</header>
	<!-- header end -->

	<!-- sidebar start -->
	<div id="sidebar">
		<nav class="sidenav">
			<ul class="main-buttons">
				<li><i class="fa fa-circle fa-2x"></i> 예약/가게/리뷰 관리
					<ul class="hidden">
						<li>예약 내역</li>
						<li>가게 등록 요청</li>
						<li>리뷰 게시글 관리</li>
					</ul></li>
				<li><i class="fa fa-circle fa-2x"></i> 공지사항
					<ul class="hidden">
						<li>고객 공지사항</li>
						<li>업체 공지사항</li>
						<li>관리자 공지사항</li>
					</ul></li>
				<li><i class="fa fa-circle fa-2x"></i> 정산 환불관리
					<ul class="hidden">
						<li>회원 환불 내역</li>
						<li>정산 요청 관리</li>
						<li>정산 이의신청 내역</li>
					</ul></li>
				<li><i class="fa fa-circle fa-2x"></i> 문의사항 관리
					<ul class="hidden">
						<li>제휴 문의 관리</li>
						<li>광고 문의 관리</li>
						<li>회원 문의 관리</li>
					</ul></li>
				<li><i class="fa fa-circle fa-2x"></i> 고객 관리
					<ul class="hidden">
						<li>회원 관리</li>
						<li>업체 관리</li>
						<li>회원 신고내역 관리</li>
					</ul></li>

			</ul>
		</nav>
	</div>
	<!-- sidebar end -->
</body>
</html>