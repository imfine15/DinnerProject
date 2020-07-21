<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<title>YUMEET 사장님페이지</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<style>
th, td {
	border-bottom: 1px solid gray;
}

a {
	text-decoration: none;
	color: black;
}

tr {
	height: 30px;
}

.hide {
	background-color: white;
	border: 0px;
	height: 30px;
	width: 30px;
}
</style>

</head>
<body>
	<%@include file="../sidebar/sidebar.jsp"%>
	<div id="wrapper" style="margin-left: 15%;">
	<div style="height:150px;"></div>
		<table style="text-align: center;" align="center">
			<thead>
				<th style="width:50px;">번호</th>
				<th style="width:750px;">제목</th>
				<th style="width:100px;">날짜</th>
				<th style="width:50px;">조회수</th>
			</thead>
			<tbody align="center">
				<tr>
					<td><a href="">1</a></td>
					<td style="background-color:none" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="">안녕하세요, 파트너 사장님 여러분 .여밋이 오픈했습니다.</a></td>
					<td>IMFINE</td>
					<td></td>
				</tr>
				<tr>
					<td><a href=""></a></td>
					<td><a href="">imfine123</a></td>
					<td>IMFINE</td>
					<td></td>
				</tr>
				<tr>
					<td><a href=""></a></td>
					<td><a href="">imfine123</a></td>
					<td>IMFINE</td>
					<td></td>
				</tr>
				<tr>
					<td><a href=""></a></td>
					<td><a href="">imfine123</a></td>
					<td>IMFINE</td>
					<td></td>
				</tr>
				<tr>
					<td><a href=""></a></td>
					<td><a href="">imfine123</a></td>
					<td>IMFINE</td>
					<td></td>
				</tr>
				<tr>
					<td><a href=""></a></td>
					<td><a href="">imfine123</a></td>
					<td>IMFINE</td>
					<td></td>
				</tr>
				<tr>
					<td><a href=""></a></td>
					<td><a href="">imfine123</a></td>
					<td>IMFINE</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<div class="pagingArea" align="center">
			<button class="hide"
				onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage=1'"><<</button>
			<button class="hide"
				onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='"><</button>

			<button class="hide"
				onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='">></button>
			<button class="hide"
				onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='">>></button>
		</div>
	</div>
	<script>

</script>
</body>
</html>