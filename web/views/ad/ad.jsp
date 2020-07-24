<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<style>
.wrapper {
	height: auto;
	margin-top: 30px;
}

p {
	font-family: 나눔스퀘어_AC;
}

#adq {
	font-style: normal;
	font-weight: normal;
	font-size: 30px;
	color: #D5706D;
}

#explain {
	font-style: normal;
	font-weight: normal;
	font-size: 16px;
	color: #404040;
}

#option {
	font-style: normal;
	font-weight: normal;
	font-size: 30px;
	color: #404040;
}

#minit {
	font-style: normal;
	font-weight: normal;
	font-size: 14px;
	color: #666666;
}

td {
	padding: 15px;
}

input {
	font-size: 18px;
}

#submitad {
	font-style: normal;
	font-weight: normal;
	font-size: 30px;
	line-height: 35px;
	color: #000000;
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
	font-family:나눔스퀘어라운드;
	color: #FFFFFF;
}
#anno {
font-size: 14px;
line-height: 16px;

text-align: center;

color: #000000;
}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	<div class="wrapper" align="center">
		<div>
			<img src="/semiproject/images/YUMEET LOGO WITH REST.png" id="logo"
				alt="yumeet logo">
			<p id="adq">광고 문의</p>
			<p id="explain">
				사용자 데이터 기반의 식당추천 서비스로 주변 맛집 정보 및 추천 맛집 리스트 등,<br> 종합적인 맛집 발견
				경험을 제공합니다. <br> 30명 유저가 사용하는 YUMEET에서<br> 식당의 홍보/운영을 도와주는
				서비스입니다.
			</p>
			<div style="height: 10px;"></div>
		</div>
		<div style="height: 500px;">
			<p id="option">광고 종류</p>
			<table>
				<tr>
					<td><img src="/semiproject/images/banner_ad.png" id="banner_ad"
						alt="배너광고"></td>
					<td><label>YUMEEY 페이지 내에서의 배너 광고</label></td>
				</tr>
				<tr>
					<td><img src="/semiproject/images/mainad.png"
						id="main_ad"></td>
					<td><label>YUMEEY 메인 페이지 배너 광고</label></td>
				</tr>
			</table>
		</div>
		<hr style="width: 1000px;">
			<form action="<%=request.getContextPath() %>/insertAd.ad" method="post">
			<!-- <input type="hidden" name="managerNo" value=""> -->
		<div id="adsec">
			<p id="submitad">광고 상담 신청</p>
			<p id="minit">※모든 내용을 정확히 기입해주시면 원활한 상담이 진행될 수 있습니다.</p>
				<table>
					<tr>
						<td><input size="50" style="line-height: 30px;"
							placeholder="이름" name="adName"></td>
					</tr>
					<tr>
						<td><input size="50" style="line-height: 30px;"
							placeholder="전화번호" name="adPhone"></td>
					</tr>
					<tr>
						<td><input size="50" style="line-height: 30px;"
							placeholder="이메일" name="adEmail"></td>
					</tr>
					<tr>
						<td><input size="50" style="line-height: 30px;"
							placeholder="업체명" name="adEnpName"></td>
					</tr>
					<tr>
						<td><input size="50" style="line-height: 30px;"
							placeholder="업체주소" name="adEnpAddress"></td>
					</tr>
					<tr>
						<td><input size="50" style="line-height: 30px;"
							placeholder="업체종류" name="adEnpType"></td>
					</tr>
					<tr>
						<td><input size="50" style="line-height: 30px;"
							placeholder="어떤 경로를 통해 알게 되셨나요?" name="searchPath"></td>
					</tr>
					<tr>
						<td><select name="adType"
							style="font-size: 18px; width: 100%; height: 40px;font-family: 나눔스퀘어_AC;"><option value="메인배너">메인
									페이지 배너 광고</option>
								<option value="페이지배너">기타 페이지 배너 광고</option></select></td>
					</tr>
					<tr>
						<td><textarea placeholder="상담내용" name="counselContent"
								style="resize:none;font-size: 20px; width: 100%; height: 200px; font-family: 나눔스퀘어_AC;"></textarea></td>
					</tr>
				</table>
		</div>
		<div>
			<p id="anno">Phone : 02 6537 7772<br>
			E mail : dydxkr113@naver.com</p>
			<div style="height:30px;"></div>
			<button id="sub_click_" type="submit" style="color: white;">상담 신청하기</button>
		</div>
			</form>
	</div>
	<div style="height: 100px;"></div>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>





