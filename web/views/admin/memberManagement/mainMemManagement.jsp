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
	a{
		text-decoration: none;
		color:black;
	}
	tr{
		height:30px;
		border-bottom: 1px solid gray;
	}
	.hide{
		background-color: white;
		border: 0px;
		height:25px;
		
	}
		input{
		border-radius: 0;
border: 1px solid gray;
outline-style: none;
height: 20px;
vertical-align: top;
	}
	
	select{
		border-radius: 0;
border: 1px solid gray;
outline-style: none;
height: 25px;
	}
	.searchBtn{
		background: lightgray;
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 60px;
		height: 25px;
		font-size: 16px;
	}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div style="width:85%; height:600px;margin-left: 230px; padding-top:40px; padding-left:30px;">
		<div style="background: #F9F9F9;width:100%; margin-bottom: 10px; height:50px; padding-left:10px;">
			<h1>회원관리</h1><br>
		</div>
		<div align="center" style="padding-left:50px; background: white; width:95%; height:800px; padding-top:50px;">
			<div>
			<label style="margin-right: 500px;">※ 사용자수 : 7명</label>
			<select>
				<option>이름</option>	
				<option>아이디</option>	
				<option>닉네임</option>
			</select>
			<input type="text">
			<button class="searchBtn">검색</button>
			</div>
			
			<br><br>
			
			<div>
				<table>
				<thead>
				<tr>
					<th style="width:150px;">회원번호</th>
					<th style="width:100px;">아이디</th>
					<th style="width:100px;">닉네임</th>
					<th style="width:150px;">이메일</th>
					<th style="width:80px;">구분</th>
					<th style="width:80px;">예약횟수</th>
					<th style="width:150px;">최근방문일</th>
					<th style="width:150px;">최근예약일</th>
				</tr>
				</thead>
				<tbody align="center">
					<tr>
						<td><a href="">00000001</a></td>
						<td><a href="">imfine123</a></td>
						<td>IMFINE</td>
						<td>imfine_123@kh.or.kr</td>
						<td>일반</td>
						<td>7건</td>
						<td>2020/06/11</td>
						<td>2020/06/10</td>
					</tr>
					<tr>
						<td><a href="">00000002</a></td>
						<td><a href="">imfine123</a></td>
						<td>IMFINE</td>
						<td>imfine_123@kh.or.kr</td>
						<td>일반</td>
						<td>7건</td>
						<td>2020/06/11</td>
						<td>2020/06/10</td>
					</tr>
					<tr>
						<td><a href="">00000003</a></td>
						<td><a href="">imfine123</a></td>
						<td>IMFINE</td>
						<td>imfine_123@kh.or.kr</td>
						<td>일반</td>
						<td>7건</td>
						<td>2020/06/11</td>
						<td>2020/06/10</td>
					</tr>
					<tr>
						<td><a href="">00000004</a></td>
						<td><a href="">imfine123</a></td>
						<td>IMFINE</td>
						<td>imfine_123@kh.or.kr</td>
						<td>일반</td>
						<td>7건</td>
						<td>2020/06/11</td>
						<td>2020/06/10</td>
					</tr>
					<tr>
						<td><a href="">00000005</a></td>
						<td><a href="">imfine123</a></td>
						<td>IMFINE</td>
						<td>imfine_123@kh.or.kr</td>
						<td>일반</td>
						<td>7건</td>
						<td>2020/06/11</td>
						<td>2020/06/10</td>
					</tr>
					<tr>
						<td><a href="">00000006</a></td>
						<td><a href="">imfine123</a></td>
						<td>IMFINE</td>
						<td>imfine_123@kh.or.kr</td>
						<td>일반</td>
						<td>7건</td>
						<td>2020/06/11</td>
						<td>2020/06/10</td>
					</tr>
					<tr>
						<td><a href="">00000007</a></td>
						<td><a href="">imfine123</a></td>
						<td>IMFINE</td>
						<td>imfine_123@kh.or.kr</td>
						<td>일반</td>
						<td>7건</td>
						<td>2020/06/11</td>
						<td>2020/06/10</td>
					</tr>
				</tbody>
				</table>
			</div>
		</div>
		<div class="pagingArea" align="center" style="background: white;">
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage=1'"><img style="width:15px; height:18px" src="images/arrow.png"><img style="width:15px; height:18px" src="images/arrow.png"></button>
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='"><img style="width:15px; height:18px" src="images/arrow.png"></button>
		
		<button class="hide"><div style="height:18px; width:15px">1</div></button>
		<button class="hide"><div style="height:18px; width:15px">2</div></button>
		<button class="hide"><div style="height:18px; width:15px">3</div></button>
		<button class="hide"><div style="height:18px; width:15px">4</div></button>
      	
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='"><img style="width:15px; height:18px" src="images/arrow2.png"></button>
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='"><img style="width:15px; height:18px" src="images/arrow2.png"><img style="width:15px; height:18px" src="images/arrow2.png"></button>
      </div>
	</div>
</body>
</html>