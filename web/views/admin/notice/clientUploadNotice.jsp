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

table {
	border-collapse: collapse;
}

tr {
	border-bottom: 1px solid lightgray;
}

td {
	height: 30px;
	margin: 5px;
}

.fileBtn {
	color: #000000;
	border: 1px solid black;
	outline: 0;
	width: 100px;
	height: 25px;
	font-size: 14px;
	float: right;
}

.noticeBtn {
	background: #E07370;
	color: #FFFFFF;
	border: 0;
	width: 180px;
	height: 50px;
	font-size: 18px;
	margin-top: 30px;
}

textarea {
	resize: none;
	outline-style: none;
	margin-bottom: 10px;
	margin-top: 10px;
	border-radius: 0;
	border: 1px solid gray;
	outline-style: none;
	width:890px;
}

input {
	border-radius: 0;
	border: 1px solid gray;
	outline-style: none;
	margin-bottom: 10px;
	margin-top: 10px;
}
.first {
	font-size:16px;
	width:10%;	
	font-weight:normal;
	text-align:center;
}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div style="width:80%; height:600px;margin-left: 230px; padding-top:40px; padding-left:30px;">
		<div style="background: #F9F9F9;width: 100%; margin-bottom: 10px; height:50px; padding-left:10px; padding-right:10px;">
			<h1>고객 공지사항</h1><br>
		</div>
		<div align="center" style="padding-left:10px; padding-right:10px; background: white; width:100%; padding-top: 30px; height: 800px;">
				<div style="height:20px;"></div>
			<form class="notice-form" action="<%= request.getContextPath() %>/insertc.no" method="post" >
			<table>
				<tr>
					<td class="first">제목</td>
					<td colspan="2">
					<input type="text" style="width:890px; height:26px;" name="noticeTitle" id="nTitle">
					</td>
				</tr>
				<tr>
					<td class="first">내용</td>
					<td colspan="2"><textarea rows="23" cols="100"name="noticeContent" id="nContent"></textarea></td>
				</tr>
			</table>
			<button class="noticeBtn" type="submit" id="noticeC-submit" onclick="noticeCSubmit">공지등록</button>
			</form>
		</div>
	</div>
	<script>
		function noticeCSubmit() {
		$("#noticeC-submit").submit();
	}
		
		document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
		
	</script>
</body>
</html>