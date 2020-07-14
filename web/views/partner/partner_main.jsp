<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<style>
#wrapper {
	width:100%;
	height:1500px;
	font-family: 나눔스퀘어_AC;
}
#logo {
	width: 287px;
	height: 120px;
}

.middle_box {
	align: center;
}

h3 {
	font-family: 나눔스퀘어라운드;
	font-style: normal;
	font-weight: normal;
	font-size: 23px;
	color: #E07370;
}

.box {
	margin: 50px;
}

#partner_click_ {
	background: url( "/semiproject/images/mintbutton.png" ) no-repeat;
	border: none;
	width: 212px;
	height: 49px;
	cursor: pointer;
	font-style: normal;
	font-weight: normal;
	font-size: 21px;
	font-family:나눔스퀘어라운드;
	color: #FFFFFF;
}
td {
	align:center;
	padding:50px;
}
#table_ali {
	text-align:center;
	margin-left:-70px;
	font-size:20px;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div id="wrapper" align="center">
		<div class="top box">
			<img src="/semiproject/images/YUMEET LOGO WITH REST.png" id="logo"
				alt="yumeet logo">
			<h3>제휴 서비스 종류</h3>
		</div>

		<div id="maarrgin"></div>
		<div data-aos="fade-up" class="middle_box">
			<img src="/semiproject/images/basic.png" class="box" id="box1">
			<img src="/semiproject/images/premium.png" class="box" id="box2">
		</div>
		<div style="height:50px"></div>
		<hr style="width:1000px">
		<form data-aos="fade-down">
			<table id="table_ali">
				<tr>
					<td></td>
					<td>베이직</td>
					<td></td>
					<td>프리미엄</td>
				</tr>
				<tr>
					<td>예약건수</td>
					<td>120/month</td>
					<td></td>
					<td>무제한 예약</td>
				</tr>
				<tr>
					<td>지원종류</td>
					<td>커뮤니티 지원</td>
					<td></td>
					<td>커뮤니티, 이메일 지원</td>
				</tr>
				<tr>
					<td>방문 서비스</td>
					<td>방문 서비스 불가</td>
					<td></td>
					<td>방문 서비스 가능</td>
				</tr>
			</table>
		</form>
		<div style="height:50px;"></div>
		<p style="color:gray; font-size:14px;">※ 단, 계약 해지 후 예약 리뷰는 2년간 보관 후 파기합니다. </p>
		<div style="height:70px;"></div>
		<button id="partner_click_">상담신청하기</button>
	</div>
		<div style="height:100px;"></div>
	<%@ include file="../common/footer.jsp"%>
		<script>
		AOS.init();
	</script>
</body>
</html>