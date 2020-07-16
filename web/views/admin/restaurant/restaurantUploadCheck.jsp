<%@page import="com.kh.semi.enterprise.model.vo.EnpAttachment"%>
<%@page import="com.kh.semi.enterprise.model.vo.EnpUpVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	EnpUpVo eu = (EnpUpVo)request.getAttribute("enpUp");
	EnpAttachment ea = (EnpAttachment)request.getAttribute("ea");
%>
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
		border: 1px solid black;
	}
	tr{
		border-bottom: 1px solid black;
	}
	th{
		background: #EAEAEA;
		width: 100px;
		height: 50px;
		font-weight: normal;
		border-right: 1px solid black;
		border-left: 1px solid black;
	}
	td{
		padding-left: 5px;
	}
	
	
	.btn{
		
 		color: #FFFFFF;
		border: 0;
		outline: 0;
		height: 28px;
		font-size: 18px;
		margin: 20px;
		margin-top: 50px;
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

	
	
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div class="outer" align="center">
		<div class="header" align="left">
			<h1>가게 등록 요청</h1><br>
		</div>
		<div class="inner">
			<h3>입점 가게 상세 정보</h3>
			<table>
				<tr>
					<th>식당명</th>
					<td><%= eu.getEnpName() %></td>
					<th>신청 날짜</th>
					<td><%= ea.getUploadDate() %></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3"><%= eu.getEnpAddress() %></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><%= eu.getEnpPhone() %></td>
					<th>가격대</th>
					<td><%= eu.getPriceRange() %></td>
				</tr>
				<tr>
					<th>메뉴</th>
					<td colspan="3"><%= eu.getMenuName() %> <%= eu.getMenuPrice() %>원</td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td><%= eu.getEnpHour() %></td>
					<th>휴무일</th>
					<td><%= eu.getClosedDay() %></td>
				</tr>
				<tr>
					<th>해쉬태그</th>
					<td colspan="3"><%= eu.getHashTags() %></td>
				</tr>
				<tr>
					<th>소개문구</th>
					<td colspan="3"><%= eu.getIntroduce() %></td>
				</tr>
				<tr>
					<th>주차공간</th>
					<td><%= eu.getParkingPossible() %></td>
					<th>카테고리</th>
					<td><%= eu.getEnpType() %></td>
				</tr>
				<tr>
					<th>사진파일</th>
					<td colspan="3"><%= ea.getOriginName() %></td>
				</tr>
			</table>
			<button class="btn" style="background: #E07370; width: 160px;">업로드 및 수정</button>
			<button class="btn" style="background: red; width: 100px;">삭제</button>
		</div>
		
	</div>
</body>
</html>