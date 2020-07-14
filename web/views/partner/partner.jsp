<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/semiproject/fils/aos.css" />
<script src="/semiproject/fils/aos.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<style>
td {
	padding: 10px;
}

#wrapper {
	width: 100%;
	height: auto;
	font-family: 나눔스퀘어_AC;
}

#membership {
	font-family: 나눔스퀘어라운드;
	font-style: normal;
	font-weight: normal;
	font-size: 23px;
	color: #E07370;
}

#partner {
	font-style: normal;
	font-weight: bold;
	font-size: 23px;
	line-height: 35px;
	text-align: center;
	color: #000000;
}

#middle_hr {
	width: 1000px;
	border: 0.1px solid #9F9F9F;
}

#middle_title {
	font-size: 30px;
	color: #000000;
	font-weight: normal;
	margin: 0 auto;
}

#middle_ex {
	font-style: normal;
	font-weight: normal;
	font-size: 14px;
	color: #666666;
}

.partner_f {
	height: 20px;
}

input {
	height: 30px;
	outline: none;
}

textarea {
	width: 381px;
	height: 200px;
	margin-top: 2px;
}

#sub_click_ {
	background: url( "/semiproject/images/mintbutton.png" ) no-repeat;
	border: none;
	width: 212px;
	height: 49px;
	cursor: pointer;
	font-style: normal;
	font-weight: normal;
	font-size: 16px;
	font-family: 나눔스퀘어라운드;
	color: #FFFFFF;
}

#spacer {
	height: 100px;
}

.explain_img {
	width: 200px;
	display: inline-block;
	margin-right: 30px;
}

.exp_text {
	height: 200px;
	vertical-align: middle;
	display: inline-block;
}

#pro-choice {
	width: 387px;
	height: 40px;
	font-size: 16px;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<!-- wrapper div start -->
	<div id="wrapper" align="center">
		<!-- 상단 이미지 start -->
		<div style="height: 50px;"></div>
		<div id="logo_image">
			<img src="/semiproject/images/YUMEET LOGO WITH REST.png" id="logo"
				alt="yumeet logo">
			<p id="membership">제휴 문의</p>
		</div>
		<!-- 상단 이미지 end -->
		<!-- partner middle explain start -->
		<div id="middle_explain">
			<p id="partner">파트너 업체</p>
			<div class="explain_img">
				<img src="/semiproject/images/insta_logo_ss.png" id="insta"
					alt="insta">
			</div>
			<p id="exp_text1">YUMEET자체 SNS를 통해 제휴업체 홍보하실 수 있습니다.</p>
			<div class="explain_img">
				<img src="/semiproject/images/manage_loggg_s.png" id="manage"
					alt="manage">
			</div>
			<div class="exp_text">
				<p>YUMEET을 통해 예약을 관리하실 수 있습니다.</p>
			</div>
		</div>
		<div id="spacer"></div>
		<!-- partner middle explain start -->
		<div class="middle_ex_">
			<hr id="middle_hr">
			<div style="height: 50px"></div>
			<p id="middle_title">제휴 상담 신청</p>
			<p id="middle_ex">※ 모든 내용을 정확히 기입해주시면 원활한 상담이 진행될 수 있습니다.</p>
		</div>
		<!-- partner form start -->
		<div>
			<form action="" method="post">
				<table class="partner_f">
					<tr>
						<td>이름 :</td>
						<td colspan="4"><input type="text" size="50" name="title"></td>
					</tr>
					<tr>
						<td>전화번호 :</td>
						<td colspan="4"><input type="text" size="50" name="title"></td>
					</tr>
					<tr>
						<td>이메일 :</td>
						<td colspan="3"><input type="text" size="50" name="title"></td>
					</tr>
					<tr>
						<td>업체명 :</td>
						<td colspan="3"><input type="text" size="50" name="title"></td>
					</tr>
					<tr>
						<td>업체주소 :</td>
						<td colspan="3"><input type="text" size="50" name="title"></td>
					</tr>
					<tr>
						<td>업체종류 :</td>
						<td colspan="3"><input type="text" size="50" name="title"></td>
					</tr>
					<tr>
						<td>상품선택 :</td>
						<td colspan="3"><select id="pro-choice">
								<option>베이직</option>
								<option>프리미엄</option>
						</select></td>
					</tr>
					<tr>
						<td style="vertical-align: top;">상담내용 :</td>
						<td colspan="3"><textarea style="resize: none;"></textarea></td>
					</tr>
				</table>
				<div align="center"></div>
				<div style="height: 50px"></div>
				<button id="sub_click_" type="submit" style="color: white;">상담
					신청하기</button>
			</form>
		</div>
		<!-- partner form end -->
	</div>
	<div style="height: 200px;"></div>
	<!-- wrapper div end -->
	<%@ include file="../common/footer.jsp"%>
	<script>
		AOS.init();
	</script>
</body>
</html>
