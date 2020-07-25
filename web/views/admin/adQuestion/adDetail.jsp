<%@page import="com.kh.semi.ad.model.vo.AdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% AdVO ad = (AdVO)request.getAttribute("ad"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET 관리자</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<style>

#wrapper {
	width: 85%;
	height: 100%;
	margin-left: 230px;
	padding-top: 40px;
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
	width: 100%;
	height: 700px;
	padding-top: 50px;
}

#inner-wrap {
	padding-left: 50px;
	padding-right: 50px;
	background: white;
	width: 95%;
}
th{
	text-align: left;
	border-right: 0.5px solid #9F9F9F;
	border-left: 0.5px solid #9F9F9F;
	text-indent: 0.5em;
}

td {
	text-align: center;
	border-right: 0.5px solid #9F9F9F;
}

tr {
	border-bottom: 0.5px solid #9F9F9F;
	border-top: 0.5px solid #9F9F9F;
	height: 50px;
}
.tableBox{
	width: 80%;
	border-collapse: collapse;
}
.left{
	text-align: left;
	text-indent: 0.5em;
}

</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div id="wrapper">
		<div id="title-box">
			<p>광고 문의 관리</p>
			<br>
		</div>
		<div id="inner-wrap">
			<div id="inner-box" align="center">
				<table class="tableBox">
					<tr>
						<th>업체명</th>
						<td><%=ad.getAdEnpName() %></td>
						<th>이름</th>
						<td><%=ad.getAdName() %></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><%=ad.getAdPhone() %></td>
						<th>이메일</th>
						<td><%=ad.getAdEmail() %></td>
					</tr>
					<tr>
						<th>경로</th>
						<td><%=ad.getSearchPath() %></td>
						<th>광고 종류</th>
						<td><%=ad.getAdTitle() %></td>
					</tr>
					<tr>
						<th>업체 주소</th>
						<td colspan="3" class="left"><%=ad.getAdEnpAddress() %></td>
					</tr>
					
					<tr style="height: 250px;">
						<th>상담 내용</th>
						<td colspan="3" class="left"><%=ad.getCounselContent()%></td>
					</tr>
				</table>
				<button>처리완료</button>
				<button>취소</button>
			</div>
		</div>



	</div>
</body>
</html>