<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.semi.notice.model.vo.*, com.kh.semi.board.model.vo.*"%>
<%@ page import="com.kh.semi.admin.model.vo.PageInfo" %>
<%
	ArrayList<BoardVO> listB = (ArrayList<BoardVO>) request.getAttribute("listB");
	ArrayList<AdminNoticeVO> list = (ArrayList<AdminNoticeVO>) request.getAttribute("list");	
%>
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
	height: auto;
	margin-left: 230px;
	padding-top: 30px;
	padding-left: 30px;
}

#title-box {
	font-family: Noto Sans KR;
	font-size: 30px;
	font-weight: bolder;
	background: #F9F9F9;
	width: 100%;
	margin-bottom: 10px;
	height: 50px;
	padding-left: 10px;
	padding-right: 10px;
}

#inner-box {
	width: 100%;
	height: 700px;
}

#inner-wrap {
	padding-left: 10px;
	padding-right: 10px;
	background: white;
	width: 100%;
	padding-top:20px;
	height: 80%;
	padding-bottom:20px;
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
#recentPost {
	margin-top:10px;
	width:570px;
}
a:link,a:visited, a:active, a:hover {
	text-decoration:none; 
	color:white;
}
#title {
	line-height:25px;
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
			<div id="mainMenuDiv" align="center"style="display: block;">
				<form id="mainMenuForm">
					<table>
						<tr>
							<td class="wrap">
								<div class="mone">
									<img src="/semiproject/images/mintCircle.png" alt="mainMenu"
										id="mainMenu" style="width: 200px">
								</div>
								<div class="main-text">
									<p><a href="/views/admin/">공지사항</a></p>
								</div>
							</td>
							<td class="wrap">
								<div class="mone">
									<img src="/semiproject/images/mintCircle.png" alt="mainMenu"
										id="mainMenu" style="width: 200px">
								</div>
								<div class="main-text">
									<p><a href="/views/admin/">공지사항</a></p>
								</div>
							</td>
							<td class="wrap">
								<div class="mone">
									<img src="/semiproject/images/mintCircle.png" alt="mainMenu"
										id="mainMenu" style="width: 200px">
								</div>
								<div class="main-text">
									<p><a href="/views/admin/">공지사항</a></p>
								</div>
							</td>
							<td class="wrap">
								<div class="mone">
									<img src="/semiproject/images/mintCircle.png" alt="mainMenu"
										id="mainMenu" style="width: 200px">
								</div>
								<div class="main-text">
									<p><a href="/views/admin/">공지사항</a></p>
								</div>
							</td>

						</tr>
					</table>
				</form>
			</div>
			</div>
				<div id="recentPost" style="display:inline-block">
					<div class="title" style="width:570px; display:inline-block; height:50px; background-color:#F9F9F9; line-height:50px; font-weight:normal; font-size:18px">&nbsp;&nbsp;&nbsp;&nbsp;게시글 현황</div>
					<form style="display:inline-block">
						<table
							style="background-color: white; width: 570px; height:280px; display:inline-block; margin-right:0px;">
							<% for (BoardVO b : listB) { %>
							<tr>
								<td style="padding-left:30px; padding-top:15px; padding-bottom:15px"><%=b.getBoardTitle() %></td>
							</tr>
							<% } %>
						</table>
					</form>
				</div>
				<div id="recentPost" style="display:inline-block; margin-left:0;">
				<div class="title"style="width:570px; display:inline-block; height:50px; background-color:#F9F9F9; line-height:50px; font-weight:normal; font-size:18px">&nbsp;&nbsp;&nbsp;&nbsp;YUMEET 공지사항</div>
					<form style="display:inline-block">
						<table style="background-color: white; width: 570px; height:280px; display:inline-block;">
								<% for (AdminNoticeVO an : list) { %>
							<tr>
								<td style="padding-left:30px; padding-top:15px; padding-bottom:15px"><%=an.getNoticeTitle() %></td>
								<td style="font-size:14px; color:gray;"> | <%=an.getNoticeDate() %></td>
							</tr>
							<% } %>
						</table>
					</form>
				</div>
			</div>
</body>
</html>