<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET 관리자페이지</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<style>
table {
	border-collapse: collapse;
}

a {
	text-decoration: none;
	color: black;
}

tr {
	height: 30px;
	border-bottom: 1px solid gray;
}

.hide {
	background-color: white;
	border: 0px;
	height: 25px;
}

td>button {
	width: 55px;
	height: 30px;
	background: #E07370;
	border-radius: 2px;
	border: white;
	color: white;
	margin-right: 2px;
	margin-left: 2px;
}

input {
	border-radius: 0;
	border: 1px solid gray;
	outline-style: none;
	height: 20px;
	vertical-align: top;
}

select {
	border-radius: 0;
	border: 1px solid gray;
	outline-style: none;
	height: 25px;
}

.searchBtn {
	background: lightgray;
	color: #FFFFFF;
	border: 0;
	outline: 0;
	width: 60px;
	height: 25px;
	font-size: 16px;
}

.btn {
	background: #5BB0AC;
}

.btn2 {
	background: gray;
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

#inner-wrap {
	padding-left: 10px;
	padding-right: 10px;
	background: white;
	width: 100%;
	padding-top: 30px;
	height: 80%;
}

#inner-box {
	width: 100%;
	height: 700px;
}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div id="wrapper">
		<div id="title-box">
			<p>업체 관리</p>
		</div>
		<div id="inner-wrap">
			<div align="center" id="inner-box">
			<label style="margin-right: 500px;">※ 등록된 업체수 : 7명</label>
			<select>
				<option>업체번호</option>	
				<option>업체명</option>
			</select>
			<input type="text">
			<button class="searchBtn">검색</button>
					
			<br><br>
			
			<div align="center">
				<table>
				<thead>
				<tr>
					<th style="width:150px;">업체번호</th>
					<th style="width:400px;">업체명</th>
					<th style="width:150px;">업주아이디</th>
					<th style="width:200px;">업체등록날짜</th>
					<th style="width:150px;">상세정보</th>
				</tr>
				</thead>
				<tbody align="center">
					<tr>
						<td><a href="">00000001</a></td>
						<td>이곳은업체명</td>
						<td><a href="">imfine123</a></td>
						<td>2020/06/10 17:33</td>
						<td><button>자세히</button></td>
					</tr>
				</tbody>
				</table>
			</div>
			<div style="height:50px;"></div>
		<div class="pagingArea" align="center" style="background: white;">
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage=1'"><img style="width:15px; height:18px" src="images/arrow.png"><img style="width:15px; height:18px" src="images/arrow.png"></button>
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='"><img style="width:15px; height:18px" src="images/arrow.png"></button>
		
		<button class="hide";><div style="height:18px; width:15px;">1</div></button>
		<button class="hide"><div style="height:18px; width:15px;">2</div></button>
		<button class="hide"><div style="height:18px; width:15px;">3</div></button>
		<button class="hide"><div style="height:18px; width:15px;">4</div></button>
      	
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='"><img style="width:15px; height:18px" src="images/arrow2.png"></button>
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='"><img style="width:15px; height:18px" src="images/arrow2.png"><img style="width:15px; height:18px" src="images/arrow2.png"></button>
			</div>
		</div>
      </div>
	</div>
</body>
</html>