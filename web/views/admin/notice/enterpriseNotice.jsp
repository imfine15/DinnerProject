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
	}
	tr{
		border-bottom: 1px solid #CBCDD1;
	}
	td{
		height: 30px;
	}
	.writebtn{
		background: #E07370;
 		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 60px;
		height: 25px;
		font-size: 14px;
		margin-top: 20px;
		float: right;
		margin-right: 150px;
	}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div style="width:85%; height:600px;margin-left: 230px; padding-top:40px; padding-left:30px;">
		<div style="background: #F9F9F9;width: 100%; margin-bottom: 10px; height:50px; padding-left:10px;">
			<h1>업체 공지사항</h1><br>
		</div>
		<div style="padding-left:50px; background: white; width:95%; padding-top: 30px; height: 800px;">
			<table>
				<tr>
					<td width="800px" align="center">제목</td>
					<td align="center" width="150px">등록날짜</td>
				</tr>
				<tr>
					<td>공지사항1</td>
					<td align="center">20/06/17 17:33</td>
				</tr>
				<tr>
					<td>공지사항1</td>
					<td align="center">20/06/17 17:33</td>
				</tr>
				<tr>
					<td>공지사항1</td>
					<td align="center">20/06/17 17:33</td>
				</tr>
			</table>
			<button class="writebtn">글쓰기</button>
		</div>
		
	</div>
</body>
</html>