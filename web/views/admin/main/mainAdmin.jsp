<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET 관리자 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<style>
.hide {
	background-color: white;
	border: 0px;
	height: 30px;
}

#wrapper {
	width: 81.2%;
	height: 90%;
	margin-left: 230px;
	padding-top: 30px;
	padding-left: 30px;
	margin-right:10px;
}

#title-box {
	background: #F9F9F9;
	width: 100%;
	height: 50px;
	margin-bottom: 10px;
	padding-left: 10px;
	font-family: Noto Sans KR;
	font-size: 30px;
	font-weight: bolder;
	margin-right:0px;
}

#inner-box {
	width: 80%;
	height: 700px;
}

#inner-wrap {
	background: white;
	width: 100%;
	height:40%;
	margin-bottom: 10px;
	padding-left: 10px;
	margin-right:0px;
}
<!--
td {
	text-align: center;
}

tb {
	border-collapse: collapse;
}

tr {
	border-bottom: 0.5px solid #9F9F9F;
	height: 40px;
}
-->

#mainMenuForm {
	width:100%;
	margin:0;
	height:30%;
}
#recentPost {
	display:inline-block;
}
.wrap {
	width: 250px;
	margin: 10px auto;
	position: relative;
}
.mone {
	width: 100%;
	vertical-align: middle;
}
.main-text {
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	color:white;
	transform: translate( -50%, -50% );
	font-size:22px;
}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div id="wrapper">
		<div id="title-box">
			<p>YUMEET 관리자 페이지</p>
			<br>
		</div>
		<div id="inner-wrap">
			<div style="height: 35px"></div>
			<div id="mainMenuDiv" style="display: block;">
				<form id="mainMenuForm">
					<table>
						<tr>
							<td class="wrap">
								<div class="mone">
									<img src="/semiproject/images/mintCircle.png" alt="mainMenu"
										id="mainMenu" style="width: 190px">
								</div>
								<div class="main-text">
									<p>공지사항</p>
								</div>
							</td>
							<td class="wrap">
								<div class="mone">
									<img src="/semiproject/images/mintCircle.png" alt="mainMenu"
										id="mainMenu" style="width: 190px">
								</div>
								<div class="main-text">
									<p><a href="/views/admin/">공지사항</a></p>
								</div>
							</td>
							<td class="wrap">
								<div class="mone">
									<img src="/semiproject/images/mintCircle.png" alt="mainMenu"
										id="mainMenu" style="width: 190px">
								</div>
								<div class="main-text">
									<p>공지사항</p>
								</div>
							</td>
							<td class="wrap">
								<div class="mone">
									<img src="/semiproject/images/mintCircle.png" alt="mainMenu"
										id="mainMenu" style="width: 190px">
								</div>
								<div class="main-text">
									<p>공지사항</p>
								</div>
							</td>

						</tr>
					</table>
				</form>
			</div>
			</div>
				<div id="recentPost">
					<form>
						<table
							style="background-color: white; width: 570px; height: 300px; margin-right:0; padding-right:0;">
							<tr>
								<td style="width:100%;float:left; text-align:left;margin-top:10px; font-size:17px; ">&nbsp;&nbsp;게시글 현황</td>
							</tr>
							<tr>
							</tr>
							<tr>
							</tr>
							<tr>
							</tr>
							<tr>
							</tr>
						</table>
					</form>
				</div>
				<div id="recentPost">
					<form>
						<table
							style="background-color: white; width: 580px; height: 300px">
							<tr>
								<td style="width:100%;float:left; text-align:left;margin-top:10px; background-color:#F9F9F9;">&nbsp;&nbsp;게시글 현황</td>
							</tr>
							<tr>
							</tr>
							<tr>
							</tr>
							<tr>
							</tr>
							<tr>
							</tr>
							
						</table>
					</form>
				</div>
				<div>
					<form>
						<table></table>
					</form>
				</div>
				<div>
					<form>
						<table></table>
					</form>
				</div>

			</div>
			</div>













</body>
</html>