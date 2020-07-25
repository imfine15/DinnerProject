<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.semi.ad.model.vo.PartnerVO"%>
<% PartnerVO partner = (PartnerVO) request.getAttribute("partner"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET 관리자페이지</title>
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
	padding-top: 30px;
	height: 80%;
}

#send-btn {
	color: white;
	background-color: #E07370;
	border: none;
	width: 40px;
	height: 25px;
}

#sendcom-btn {
	color: white;
	background-color: #A0A0A0;
	border: none;
	width: 70px;
	height: 25px;
}

td {
	text-align: center;
}

#review-tb {
	border-collapse: collapse;
}

tr {
	border-bottom: 0.5px solid #9F9F9F;
	height: 40px;
}

#confirm-before-btn {
	width: 80px;
	height: 25px;
	border: none;
	background: #E07370;
	border-radius: 2px;
	color: white;
	font-size: 15px;
}

#confirm-after-btn {
	width: 80px;
	height: 25px;
	border: none;
	background: #C4C4C4;
	border-radius: 2px;
	color: black;
	font-size: 15px;
}

#search-btn {
	width: 53px;
	height: 24px;
	background: #C4C4C4;
	color: black;
	border: none;
}

#title {
	text-align: left;
	padding-left: 30px;
	width: 40%;
}

#toggle {
	background: url("/semiproject/images/toggle.png") no-repeat;
	width: 10px;
	height: 10px;
	border: none;
}

.checkBtn {
	background: gray;
	color: #FFFFFF;
	border: 0;
	outline: 0;
	width: 70px;
	height: 25px;
	font-size: 14px;
}

.innerText1 {
	display: none;
}

.productBtn {
	background: #E07370;
	color: #FFFFFF;
	border: 0;
	outline: 0;
	width: 80px;
	height: 25px;
	font-size: 14px;
}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div id="wrapper">
		<div id="title-box">
			<p>제휴 문의 관리</p>
			<br>
		</div>
		<div id="inner-wrap">
			<div id="inner-box">
				<div style="height: 30px;"></div>
				<form>
					<table class="" style="width: 100%;">
						<tr>
							<th><%=partner.getPartQType() %></th>
							<th><%=partner.getPartQTitle() %></th>
							<th><%=partner.getPartQName() %></th>
							<th><%=partner.getPartQDate() %></th>
						</tr>
						<tr>
							<td><%=partner.getPartQEnpType() %></td>
							<td><%=partner.getPartQAddress() %></td>
							<td><%=partner.getPartQEmail() %></td>
							<td><%=partner.getPartQPhone() %></td>
						</tr>
						<tr>
							<td colspan="4"><%=partner.getPartQContent() %></td>
						</tr>
					</table>
					<div style="margin-top:100px" align="center">
					<button>처리완료</button>
					</div>
				</form>
				<div style="height: 30px;"></div>
		</div>
		</div>
		</div>

</body>
</html>