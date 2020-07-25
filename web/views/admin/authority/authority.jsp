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
	height: 500px;
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
}
td {
	text-align: left;
}

tr {
	height: 50px;
}
.tableBox{
	width: 300px;
	border-collapse: collapse;
}
.btn{
	background:#5BB8B4;
	color: #FFFFFF;
	border: 0;
	outline: 0;
	width: 90px;
	height: 30px;
	font-size: 16px;
	margin: 30px;
}
	input{
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		height: 20px;
	}
select{
border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		text-align: center;
		height: 20px;
}

</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div id="wrapper">
		<div id="title-box">
			<p>직원 등록</p>
			<br>
		</div>
		<div id="inner-wrap">
			<div id="inner-box" align="center">
				<form action="<%=request.getContextPath() %>/insertManager.ma" method="post">
				
				<table class="tableBox">
					<tr>
						<th><label>직원 이름</label></th>
						<td><input type="text" name="managerName"></td>
					</tr>
					<tr>
						<th><label>전화번호</label></th>
						<td><input type="tel" name="managerPhone"></td>
						
					</tr>
					<tr>
						<th><label>이메일</label></th>
						<td><input type="email" name="managerEmail"></td>
						
					</tr>
					<tr>
						<th><label>아이디</label></th>
						<td><input type="text" name="managerId"></td>
					
					</tr>
					<tr>
						<th><label>비밀번호</label></th>
						<td><input type="password" name="managerPwd"></td>
					</tr>
					<tr>
						<th><label>직급</label></th>
						<td>
							<select name="jobCode">
								<option value="J2">부사장</option>
								<option value="J3">부장</option>
								<option value="J4">차장</option>
								<option value="J5">과장</option>
								<option value="J6">대리</option>
								<option value="J7">사원</option>
								<option value="J8">인턴</option>
							</select>
							</td>
						
					</tr>
					<tr>
						
						<th><label>부서</label></th>
						<td><select name="deptCode">
							<option value="D1">DB관리부</option>
							<option value="D2">고객관리부</option>
							<option value="D3">영업1부</option>
							<option value="D4">영업2부</option>
							<option value="D5">업체관리부</option>
							<option value="D6">고객센터</option>
						</select></td>
					</tr>
		
				</table>
			<button class="btn">등록하기</button>
			</form>
		</div>
	</div>
	</div>
</body>
</html>