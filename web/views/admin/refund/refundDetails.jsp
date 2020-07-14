<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET 관리자페이지</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<style>
	table{
		border-collapse: collapse;
		width: 80%;
	}
	tr{
		border-bottom: 0.75px solid #CBCDD1;
	}
	td{
		text-align: center;
	}
	#search-btn {
	width: 53px;
	height: 25px;
	background: #C4C4C4;
	color: black;
	border: none;
}
	.btn{
		
 		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 80px;
		height: 25px;
		font-size: 14px;
		border-radius: 3px;
		margin-bottom: 2px;
	}

	.outer{
		width:85%; 
		height:600px;
		margin-left: 230px; 
		padding-top:40px; 
		padding-left:30px;
	}
	.header{
		 background: #F9F9F9;
		 width: 100%; 
		 margin-bottom: 10px; 
		 height:50px; 
		 padding-left:10px;
		 margin-left: auto;
		 margin-right: auto;
	}
	.inner{
		 padding-left:50px; 
		 background: white; 
		 width:95%; 
		 padding-top: 30px; 
		 height: 800px;
		 margin-left: auto;
		 margin-right: auto;
	}
	input{
		border-radius: 0;
border: 1px solid gray;
outline-style: none;
	}

	
	
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div class="outer" align="center">
		<div class="header" align="left">
			<h1>업체 환불 내역</h1><br>
		</div>
		<div class="inner">
			
			<table>
				<tr>
					<td>가게명</td>
					<td>신청 ID</td>
					<td>신청 날짜</td>
					<td>환불 날짜</td>
					<td>환불 여부</td>
					<td>환불 금액</td>
					<td>환불 관리</td>
				</tr>
				<tr>
					<td>역삼식당</td>
					<td>tak123</td>
					<td>20/06/29</td>
					<td></td>
					<td>N</td>
					<td>54900원</td>
					<td><button class="btn" style="background: #E07370;">환불하기</button></td>
				</tr>
				<tr>
					<td>돼지되지</td>
					<td>fine123</td>
					<td>20/06/24</td>
					<td>20/06/28</td>
					<td>Y</td>
					<td>24900원</td>
					<td><button class="btn" style="background: gray;">환불완료</button></td>
				</tr>
			</table>
			<div style="height: 30px;"></div>
			<div id="search-box" align="center" style="vertical-align: middle;">
					<form style="vertical-align: middle;">
						<select style="height:25px; font-size:14px;">
								<option>업체명</option>
								<option>회원 ID</option>
								<option>환불 여부</option>
						</select>
						<input style="height:25px; vertical-align: top;" type="search" size="25">
						<button id="search-btn">검색</button>	
					</form>
				</div>
		</div>
		
	</div>
</body>
</html>