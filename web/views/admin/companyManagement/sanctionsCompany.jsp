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
	
	.writebtn{
		background: #E07370;
 		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 120px;
		height: 30px;
		font-size: 14px;
		margin-top: 20px;
		
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
		height: 19px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	textarea{
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		margin-top: 5px;
	}
	
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div class="outer" align="center">
		<div class="header" align="left">
			<h1>업체 관리</h1><br>
		</div>
		<div class="inner">
			<h2>제재 정보 작성</h2>
			<table>
				<tr>
				<!-- 이메일 연락처는 자동기입 -->
					<td>이메일</td>
					<td><input type="email" style="width: 95%;"></td>
					<td>연락처</td>
					<td><input type="tel" style="width: 95%; float: right;"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><input type="text" size="99"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3"><textarea rows="15" cols="101" style="resize: none;"></textarea></td>
				</tr>
				
			</table>
			<button class="writebtn">제재 내용 전송</button>
		</div>
		
	</div>
</body>
</html>