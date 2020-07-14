<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* REMOVE THIS, USE YOUR OWN  */
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	font-family: Arial, Helvetica, Sans-serif;
}

.dummy_page {
	min-height: 90%;
	width: 100%;
	background-color: #f0f0f0;
	text-align: center;
	box-sizing: border-box;
	padding: 60px 0px;
}
/* STYLES SPECIFIC TO FOOTER  */

.footer .col {
	width: 210px;
	height: 100%;
	float: left;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	padding: 0px 20px 20px 20px;
}

.footer .col h1 {
	margin: 0;
	padding: 0;
	font-family: inherit;
	font-size: 12px;
	line-height: 17px;
	padding: 20px 0px 5px 0px;
	color: rgba(255, 255, 255, 0.2);
	font-weight: normal;
	text-transform: uppercase;
	letter-spacing: 0.250em;
}

.footer .col ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.footer .col ul li {
	color: #999999;
	font-size: 16px;
	font-family: inherit;
	font-weight: lighter;
	padding: 5px 0px 5px 0px;
	cursor: pointer;
	transition: .2s;
	-webkit-transition: .2s;
	-moz-transition: .2s;
}

.footer .col2 ul li {
	color: #999999;
	font-size: 12px;
	font-family: inherit;
	font-weight: bold;
	padding: 5px 0px 5px 0px;
	cursor: pointer;
	transition: .2s;
	-webkit-transition: .2s;
	-moz-transition: .2s;
}

.social ul li {
	display: inline-block;
	padding-right: 5px !important;
}

.footer .col ul li:hover {
	color: #D5706D;
	transition: .1s;
	-webkit-transition: .1s;
	-moz-transition: .1s;
}

.footer .col2 {
	width: 300px;
	height: auto;
	float: left;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	padding: 0px 20px 20px 20px;
}

.footer .col2 h1 {
	margin: 0;
	padding: 0;
	font-family: inherit;
	font-size: 12px;
	line-height: 17px;
	padding: 20px 0px 5px 0px;
	color: rgba(255, 255, 255, 0.2);
	font-weight: normal;
	text-transform: uppercase;
	letter-spacing: 0.250em;
}

.footer .col2 ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.footer .col2 ul li {
	color: #999999;
	font-size: 14px;
	font-family: inherit;
	font-weight: bold;
	padding: 5px 0px 5px 0px;
	cursor: pointer;
	transition: .2s;
	-webkit-transition: .2s;
	-moz-transition: .2s;
}

.footer .col2 ul li {
	color: #999999;
	font-size: 12px;
	font-family: inherit;
	font-weight: normal;
	padding: 5px 0px 0px 0px;
	cursor: pointer;
	transition: .2s;
	-webkit-transition: .2s;
	-moz-transition: .2s;
}

.social ul li {
	display: inline-block;
	padding-right: 5px !important;
}

.clearfix {
	clear: both;
}

.footer .col3 {
	border: none;
	width: 35px;
	height: auto;
	float: left;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	padding: 0px 20px 20px 20px;
}

.footer {
	box-shadow: 0px -2px 10px 2px #DE6B6B;
}

#ylogo {
	width: 150px;
	height: auto;
}

.footer {
	width: 100%;
	height: auto;
	background-color: white;
	font-family:-윤고딕310;
}
}
</style>
</head>
<body>
	<header></header>

	<!-- FOOTER START -->
	<div class="footer">
		<div class="contain">
			<div class="col" style="margin-top:20px; margin-left:30px; ">
				<img src="/semiproject/images/YUMEET LOGO.png" id="ylogo"
					alt="yumeetlogo">
			</div>
			<div class="col2" id="dd" style="margin-left:0px;">
				<ul style="margin-top:45px;">
					<li style="font-size:20px; font-weight:bold;">회사소개</li>
					<hr style=" margin-left:0px;background-color:#E4E4E4; border: 1px solid #E4E4E4; size: 1px; width:100px;">
					<li>(주)YUMEET</li>
					<li>서울 강남구 테헤란로 14길 6 남도빌딩</li>
					<li>고객센터 : 010-3410-6215</li>
					<li>대표이사 : 정파덕</li>
					<li>ⓒ 2020 YUMEET Co., Ltd. All rights reserved.</li>
				</ul>
			</div>

			<div class="col3">
				<br> <br>
				<hr width="1px" size="150px"
					style="background-color:#E4E4E4; border:1px;">
			</div>

			<div class="col" style="">
				<ul style="margin-top:10px;">
					<br>
					<br>
					<li style="padding:8px">공지사항</li>
					<li style="padding:8px">이용약관</li>
					<li style="padding:8px">가이드라인</li>
					<li style="padding:8px">개인정보 처리방침</li>
				</ul>
			</div>

			<div class="col">
				<ul style="margin-top:10px;">
					<br>
					<br>
					<li style="padding:8px">문의하기</li>
					<li style="padding:8px">이용정책</li>
					<li style="padding:8px">제휴문의</li>
					<li style="padding:8px">광고문의</li>
				</ul>
			</div>
			
			<div class="col" style="width: 400px;">
				<ul style="margin-top:30px;">
					<br>
					<li>여밋소개</li>
					<br>
					<li style="display: inline-block;"><img
						src="/semiproject/images/blog.png" style="width: 60px;"></li>
					<li style="display: inline-block;"><img
						src="/semiproject/images/facebook.png" style="width: 60px;"></li>
					<li style="display: inline-block;"><img
						src="/semiproject/images/kakao.png" style="width: 60px;"></li>
					<li style="display: inline-block;"><img
						src="/semiproject/images/picture.png"style="width: 60px;"></li>
					<li style="display: inline-block;"><img
						src="/semiproject/images/youtube.png" style="width: 60px;"></li>
				</ul>
			</div>
			
			
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- END OF FOOTER -->
</body>
</html>