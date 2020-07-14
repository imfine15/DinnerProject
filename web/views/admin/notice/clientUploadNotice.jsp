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
		border-bottom: 1px solid lightgray;
	}
	
	td{
		height: 30px;
	}
	.fileBtn{
		
 		color: #000000;
		border: 1px solid black;
		outline: 0;
		width: 100px;
		height: 25px;
		font-size: 14px;
		float: right;
		
	}
	.noticeBtn{
		background: #E07370;
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 100px;
		height: 26px;
		font-size: 16px;
		margin-top: 10px;
		
	}
	textarea{
		resize: none;
		border-radius: 0;
border: 1px solid gray;
outline-style: none;
margin-bottom: 10px;
margin-top: 10px;
	}
	input{
	border-radius: 0;
border: 1px solid gray;
outline-style: none;
margin-bottom: 10px;
margin-top: 10px;
	}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div style="width:85%; height:600px;margin-left: 230px; padding-top:40px; padding-left:30px;">
		<div style="background: #F9F9F9;width: 100%; margin-bottom: 10px; height:50px; padding-left:10px;">
			<h1>고객 공지사항</h1><br>
		</div>
		<div align="center" style="padding-left:50px; background: white; width:95%; padding-top: 30px; height: 800px;">
			<table>
				<tr>
					<td>제목</td>
					<td colspan="2"><input type="text" size="98"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="2"><textarea rows="23" cols="100"></textarea></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><textarea rows="11" cols="100"></textarea></td>
					<td valign="top"><button class="fileBtn" style="background: #FFFFFF; margin-top: 10px;">파일첨부</button><br><br><button class="fileBtn" style="background: #F6F6F6;">파일삭제</button></td>
				</tr>
			</table>
			<button class="noticeBtn">공지등록</button>
		</div>
		
	</div>
</body>
</html>