<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET 관리자페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	padding-left: 30px;
	width: 40%;
}

#calender {
	display: inline-block;
	margin-left: 44%;
}

#search-box {
	display: inline-block;
	float: right;
}

#detail {
	color: white;
	background-color: #E07370;
	border: none;
	width: 60px;
	height: 25px;
	font-size: 16px;
}

#modal {
	display: none;
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 1;
	vertical-align: middle;
	align:center;
}

#modal p {
	margin: 0;
}

#modal_close_btn {
	display: inline-block;
	color: white;
	background-color: #E07370;
	border: none;
	width: 60px;
	height: 25px;
	font-size: 16px;
	margin-left: 40%;
}

#modal .modal_content {
	width: 500px;
	height: auto;
	margin: 0 auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
	line-height: 30px;
	box-shadow: 10px 10px 20px #616161;
}

#modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div id="wrapper">
		<div id="title-box">
			<p>예약 내역</p>
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
							<th>예약 번호</th>
							<th>고객명</th>
							<th>고객 ID</th>
							<th>업체명</th>
							<th>인원</th>
							<th>보증 금액</th>
							<th>예약 일자</th>
							<th>더보기</th>
						</tr>
						<tr>
							<td>09180001</td>
							<td>정파덕</td>
							<td>paduck</td>
							<td>돼지되지</td>
							<td>28</td>
							<td>99,400원</td>
							<td>2020/07/28</td>
							<td><button id="detail">자세히</button></td>
						</tr>
					</table>
				</form>
				<div id="modal" class="mdeal-c">
					<div class="modal_content">
						<p style="font-size:25px;">예약 상세 정보</p><br>
						<label>고객 : 정파덕 (paduck)</label><br>
						<label>예약 상태 : 취소됨 </label><br>
						<label>일자 : 2020/09/18</label><br>
						<label>시간 : 12:00</label><br>
						<label>인원 : 28명</label><br>
						<label>결제 일자 : 2020/06/22 14:24</label><br>
						<label>취소 일자 : 2020/06/23 11:12</label><br>
						<label>업체 수락 일자 : 2020/06/24 23:42</label><br>
						<label>환불 금액 : 현금 99,400 원 | 포인트 600 점</label><br>
						<label>취소 사유 : (없음)</label><br><br>
						<button id="modal_close_btn">확인</button>
					</div>
					<div class="modal_layer"></div>
				</div>
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
	<script>
		$("#detail").click(function() {
			$("#modal").css("display", "block");
		});

		$("#modal_close_btn").click(function() {
			$("#modal-c").css("display", "none");
		});
	</script>
</body>
</html>