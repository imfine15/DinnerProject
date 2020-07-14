<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="/semiproject/views/myPage/css/myPage.css" />
<style>
.info {
	font-family: Roboto;
	font-style: normal;
	font-weight: 700;
	font-size: 15px;
	line-height: 18px;
}
.info2{
	font-family: Roboto;
	font-style: normal;
	font-weight: 500;
	font-size: 15px;
	line-height: 18px;
}
.navbar{
	color: #666666;
	font-size: 20px;
	
	
}
.left{
	list-style-type:none;
	float:left;
	margin-left: 20px;
}
.left2:hover{
	text-decoration: none;
	border-bottom: 3px #E1A9A9 solid;
}
ul li a span:hover{
	color: pink;
}
input{
	border-radius: 0;
	border: 1px solid gray;
	outline-style: none;
}
</style>
</head>
<body>
	<%@include file="../common/header.jsp" %>
	<div id="daumWrap" class="userinfo_type1 ">
		<div id="daumHead" role="banner">
			<div class="inner_head" style="padding-right:30px;">
				<h1>
					<a href="/semiproject/views/myPage/myPage.jsp" id="daumServiceLogo"><span class="ir_wa">내정보</span></a>
				</h1>
				<!-- PC 웹 내정보 GNB -->
				<div id="" role="navigation">
					<ul style="padding-top: 10px; padding-left:-30px;">
						<li class="left"><a class="left2" href="/semiproject/views/myPage/myPage.jsp"><span class="navbar" style="color: #E1A9A9;">내정보 홈</span></a></li>
						<li class="left"><a class="left2"  href="/semiproject/views/myPage/checkingPassword.jsp"><span class="navbar">내정보 관리</span></a></li>
						<li class="left"><a class="left2"  href="/semiproject/views/myPage/checkingPassword.jsp"><span class="navbar">비밀번호 변경</span></a></li>
						<li class="left"><a class="left2"  href=""><span class="navbar">고객센터</span></a></li>
						<li class="left"><a class="left2"  href="/semiproject/views/myPage/withdrawalFromMembership.jsp"><span class="navbar">회원탈퇴</span></a></li>
					</ul>
				</div>
			</div>
		</div>

		<hr class="hide" />
		<div id="daumContent" role="main">
			<div id="cMain">
				<div id="mArticle">
					<h2 id="daumBody" class="screen_out">내정보 홈 본문</h2>
					<div class="info_servicelist">
						<div class="bg_box box_tit" style="display: inline-block; border: 1px solid darkgray; width:277px;">
							<h1 style="color: #D5706D;">YUMEET 프로필</h1>
							<div class="section_myinfo">
								<a id="profileImageContainer" class="link_profile profile_img"
									data-tiara-action-name="프로필_이미지_관리"> <img id="profileImage"
									alt="프로필 사진" class="img_profile"
									src="https://img1.daumcdn.net/thumb/R158x158/?fname=http%3A%2F%2Ftwg.tset.daumcdn.net%2Fprofile%2F-IMNvhQBTjI0&t=1593580361035">
									<span class="frame_img">프로필 이미지 관리</span> <span
									class="">프로필 이미지 업로드</span>
								</a>
							</div>
							<div style="margin-top: -10px;">
								<label class="info">이름 : </label> <label class="info2">정용탁</label><br>
								<label class="info">닉네임 : </label> <label class="info2">Paduck</label><br> 
								<label class="info">주소 : </label> <label class="info2">서울 서초구 양재동 16-12</label><br> 
								<label class="info">번호 : </label> <label class="info2">010-4422-3043</label>
							</div>
						</div>
						<a href="/semiproject/views/myPage/writePostsByMe.jsp" class="bg_box" style="display: inline-block; border: 1px solid darkgray;"> <!-- 미사용시 class 'box_off', 사용시 class 'box_on' -->
							<h2>내가쓴 게시글</h2> <span class="txt_desc">"내가쓴 게시글이 한눈에!" </span>
						</a> 
						
						<a href="/semiproject/views/myPage/writeReviewsByMe.jsp" class="bg_box" style="display: inline-block; border: 1px solid darkgray;">
							<h2>내가쓴 리뷰</h2> <span class="txt_desc">"리뷰들을 모아서 보자!" </span>
						</a> 
						
						<a href="/semiproject/views/myPage/likePosts.jsp" class="bg_box" style="display: inline-block; border: 1px solid darkgray;"> <!-- 미사용시 class 'box_off2', 사용시 class 'box_on2' -->
							<h2>좋아요</h2>
							<ul>
								<li>· 장터식당</li>
								<li>· 뢰벤돈까스</li>
								<li>· 청목</li>
							</ul>
						</a>
						<a style="padding-left:0px; display:block; padding-top: 30px;">
						<img src="/semiproject/images/YUMEET LOGO.png" style="width:300px; height:100px;">
						</a>
						
					</div>
					<ul class="ir_pm"
						style="width: 678px; height: 116px; margin: 0 0 52px 16px; overflow: hidden; background: url(images/subbar.png) no-repeat 0 0">
						<li
							style="float: left; width: 161px; height: 116px; margin-right: 65px;">
							<a href="/semiproject/views/myPage/myPoint.jsp"
							style="display: block; width: 50px; height: 16px; margin-top: 95px">바로가기
						</a>
						</li>

						<li
							style="float: left; width: 161px; height: 116px; margin-right: 65px;">
							<a href="/semiproject/views/myPage/detailsOfPayandReservation.jsp"
							style="display: block; width: 50px; height: 16px; margin-top: 95px">바로가기
						</a>
						</li>
						<li
							style="float: left; width: 161px; height: 116px; margin-right: 65px;">
							
							<a href="/semiproject/views/myPage/inquiryHistory.jsp"
							style="display: block; width: 50px; height: 16px; margin-top: 95px">바로가기
						</a></li>
					</ul>
				</div>
				<!--// mArticle -->
				<div id="mAside">
					<div class="wing_userinfo">
						<div class="section_myinfo">
							<a id="profileImageContainer" href="/semiproject/views/myPage/checkingPassword.jsp" class="link_profile"
								data-tiara-action-name="프로필_이미지_관리"> <img id=""
								alt="프로필 사진" class="img_profile"
								src="https://img1.daumcdn.net/thumb/R158x158/?fname=http%3A%2F%2Ftwg.tset.daumcdn.net%2Fprofile%2F-IMNvhQBTjI0&t=1593580361035">
								<span class="frame_img">프로필 이미지 관리</span> <span
								class="">프로필 이미지 업로드</span>
							</a> <a href="/semiproject/views/myPage/checkingPassword.jsp" class="link_user"
								data-tiara-action-name="내_정보">dydxkr님<br>
							</a><a class="link_user" href="/semiproject/views/myPage/myPoint.jsp">
							<label class="" >포인트 : 300</label>	
							</a>
							
							<div id="profileImageAgreeDialog" class="layer_manage"
								style="display: none">
							</div>
							
							<div id="profileImageChangeDialog" class="layer_manage"
								style="display: none">
							</div>
						</div>
						<div id="profileImageEditor"
							style="display: none; position: absolute; left: 50%; margin-left: -400px; top: 100px; z-index: 998; width: 800px; height: 600px"></div>
						<div class="section_info section_activity">
							<h4 class="txt_comm txt_activity">내 활동 내역</h4>
							<ul class="list_activity">
								
							</ul>
						</div>
						
					</div>
				</div>
				<!--// mAside -->
			</div>
			<!-- // cMain -->

		</div>
		<!-- // daumContent -->
		<%@include file="../common/footer.jsp" %>
		<!-- // daumFoot -->

		<div id="wrapMinidaum"></div>
	</div>




</body>