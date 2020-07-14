<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<style>

.hide {
	background-color: white;
	border: 0px;
	height: 30px;
}

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
	height: 700px;
}

#inner-wrap {
	padding-left: 50px;
	padding-right: 50px;
	background: white;
	width: 95%;
}

td {
	text-align: center;
}
#objectTable {
	border-collapse: collapse;
}
tr {
	border-bottom: 0.5px solid #9F9F9F;
	border-top: 0.5px solid #9F9F9F;
	height: 40px;
}

#search-btn {
	width: 53px;
	height: 24px;
	background: #C4C4C4;
	color: black;
	border: none;
}

#title {
	text-align: left;
	padding-left:30px;
	width:40%;
}
#calender {
	display:inline-block;
	margin-left:44%;
}
#search-box {
	display:inline-block;
	float:right;
}
#detail {
	color: white;
	background-color: #E07370;
	border: none;
	width: 60px;
	height: 25px;
	font-size:16px;
}

</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div id="wrapper">
		<div id="title-box">
			<p>정산 이의 신청 내역</p>
			<br>
		</div>
		<div id="inner-wrap">
			<div id="inner-box">
				<div style="height: 30px;"></div>
				<div id="calender">
					<button class="hide"
						onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='"><</button>
					<!-- 달력 날짜 가져오기 -->
					&nbsp;&nbsp;<label style="font-size:25px;">2020.07.12</label>&nbsp;&nbsp;
					<button class="hide"
						onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='">></button>

				</div>
				<!-- 검색영역 -->
				<div id="search-box">
					<form>
						<table>
							<tr>
								<td><select style="height: 25px; font-size: 14px;">
										<option>제목</option>
										<option>회원 ID</option>
										<option>등록 날짜</option>
								</select>&nbsp;&nbsp;&nbsp;</td>
								<td><input style="height: 25px;" type="search" size="25"></td>
								<td>&nbsp;&nbsp;&nbsp;
									<button id="search-btn">검색</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<!--  검색영역 끝 -->
				<!-- 본문 테이블 start -->
				<div style="height:40px;"></div>
				<form>
					<table id="objectTable" style="width: 100%;">
						<tr>
							<th>이의 신청 번호</th>
							<th>업체명</th>
							<th>신청인</th>
							<th>전화 번호</th>
							<th>이메일</th>
							<th>이의 신청 일자</th>
							<th>상태</th>
							<th>더보기</th>
						</tr>
						<tr>
							<td>06220001</td>
							<td>예승이콩버거</td>
							<td>정용탁</td>
							<td>010-7777-5555</td>
							<td>YT_JUNG@kh.or.kr</td>
							<td>2020/06/22 23:19</td>
							<td>처리중</td>
							<td><button id="detail">자세히</button></td>
						</tr>


					</table>
				</form>
				<div style="height: 30px;"></div>
			</div>
		</div>
		<!-- 본문 테이블 끝 -->
		<!-- 페이징처리 -->
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

</body>
</html>