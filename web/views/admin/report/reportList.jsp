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

	.title{
		text-align: left;
	}
	
	
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div class="outer" align="center">
		<div class="header" align="left">
			<h1>회원 신고 내역</h1><br>
		</div>
		<div class="inner">
			
			<table>
				<tr>
					<td class="title" width="250px">제목</td>
					<td>회원 ID</td>
					<td>신고 접수 날짜</td>
					<td>처리 상태</td>
					
				</tr>
				<tr>
					<td class="title">울부짖어라, ‘닭갈비'</td>
					<td>tak123</td>
					<td>20/06/29</td>
					<td>처리중</td>
					
				</tr>
				<tr>
					<td class="title">줄서서 먹는 대박돈까스집</td>
					<td>fine123</td>
					<td>20/06/24</td>
					<td>게시글삭제</td>
					
				</tr>
			</table>
			
		</div>
		
	</div>
</body>
</html>