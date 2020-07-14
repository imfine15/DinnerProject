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
	.btn{
		
 		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 60px;
		height: 25px;
		font-size: 14px;
		margin-top: 20px;
		float: right;
		margin-left: 10px;
	}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div style="width:85%; height:600px;margin-left: 230px; padding-top:40px; padding-left:30px;">
		<div style="background: #F9F9F9;width: 100%; margin-bottom: 10px; height:50px; padding-left:10px;">
			<h1>고객 공지사항</h1><br>
		</div>
		<div style="padding-left:50px; background: white; width:95%; padding-top: 30px; height: 800px;">
			<table>
				<tr>
					<td width="800px">공지사항1</td>
					<td align="center" width="150px">20/06/17 17:33</td>
				</tr>
				<tr>
					<td colspan="2">공지사항내용운애애앵우우우우웅</td>
				</tr>
			</table>
			<div style="margin-right: 150px;">
			<button class="btn" style="background: #5BB0AC;">수정</button>
			<button class="btn" style="background: #C4C4C4;">삭제</button>
			<button class="btn" style="background: #E07370;">글쓰기</button>
			</div>
		</div>
		
	</div>
</body>
</html>