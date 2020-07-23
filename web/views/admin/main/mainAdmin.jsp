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
	width: 80%;
	height: 100%;
	margin-left: 230px;
	padding-top: 30px;
	padding-left: 30px;
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
}

#inner-box {
	width: 80%;
	height: 700px;
}

#inner-wrap {
	padding-left: 0px;
	background: white;
	width: 100%;
	height:40%;
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
#mainMenu {
	width:150px;
}
#mainMenuForm {
	width:100%;
	margin:0;
}
td {
	width:284.5px;
}
#recentPost {
	
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
				<form id="mainMenuForm">
					<table>
						<tr>
							<td>
								<div><img src="/semiproject/images/mintCircle.png" alt="mainMenu" id="mainMenu"></div>
								<div><p>공지사항</p></div>
							</td>
							<td>
								<img src="/semiproject/images/mintCircle.png" alt="mainMenu" id="mainMenu">
								<p>공지사항</p>
							</td>
							<td>
								<img src="/semiproject/images/mintCircle.png" alt="mainMenu" id="mainMenu">
								<p>공지사항</p>
							</td>
							<td>
								<img src="/semiproject/images/mintCircle.png" alt="mainMenu" id="mainMenu">
								<p>공지사항</p>
							</td>

						</tr>
					</table>
				</form>
		</div>
		<div id="recentPost">
			<form>
				<table></table>
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
		<div>
			<form>
				<table></table>
			</form>
		</div>
		
		</div>















</body>
</html>