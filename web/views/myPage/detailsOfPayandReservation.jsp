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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
   $(function(){
	  	$("#listArea td").mouseenter(function(){
	  		$(this).parent().css({"background":"darkgray","cursor":"pointer"});
	  	}).mouseout(function(){
	  		$(this).parent().css({"background":"white"});
	  	}).click(function(){
	  		var num = $(this).parent().children().eq(0).text();
	  		
	  		console.log(num);
	  		location.href="<%=request.getContextPath()%>/selectOne.no?num=" + num;
	  	})
   });
   </script>
<style>
.info {
	font-family: Roboto;
	font-style: normal;
	font-weight: 500;
	font-size: 15px;
	line-height: 18px;
}

.text {
	font-family: Roboto;
	font-style: normal;
	font-weight: 600;
	font-size: 16px;
	color: #343434;
}
.text2 {
	font-family: Roboto;
	font-style: normal;
	font-weight: 500;
	font-size: 14px;
	line-height: 18px;
	color: #343434;
}
.text3 {
	font-family: Roboto;
	font-style: normal;
	font-weight: 550;
	font-size: 16px;
	line-height: 16px;
	text-align: center;
	border-radius: 5px;
	width: 50px;
	height: 30px;
}
.text4 {
	font-family: Roboto;
	font-style: normal;
	font-weight: 550;
	font-size: 16px;
	line-height: 16px;
	text-align: center;
	border-radius: 5px;
	width: 80px;
	height: 30px;
}
.text5 {
	font-family: Roboto;
	font-style: normal;
	font-weight: 550;
	font-size: 16px;
	line-height: 16px;
	text-align: center;
	border-radius: 5px;
	width: 70px;
	height: 30px;
	background: #B7E1E1;
	margin-left:5px;
	color: white;
}
.text6 {
	font-family: Roboto;
	font-style: normal;
	font-weight: 550;
	font-size: 16px;
	line-height: 16px;
	text-align: center;
	border-radius: 5px;
	width: 70px;
	height: 30px;
	background: #DE6B6B;
	margin-left:5px;
	color: white;
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
</style>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div id="daumWrap" class="userinfo_type1 ">

		<div id="daumWrap" class="userinfo_type1 ">
		<div id="daumHead" role="banner">
			<div class="inner_head" style="padding-right:30px;">
				<h1>
					<a href="/semiproject/views/myPage/myPage.jsp" id="daumServiceLogo"><span class="ir_wa">내정보</span></a>
				</h1>
				<!-- PC 웹 내정보 GNB -->
				<div id="" role="navigation">
					<ul style="padding-top: 10px; padding-left:-30px;">
						<li class="left"><a class="left2" href="/semiproject/views/myPage/myPage.jsp"><span class="navbar"">내정보 홈</span></a></li>
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
					<br>
					<h1 style="color: #DA817F;">예약 및 결제내역</h1>
					<div style="width:400px; display: inline-block;!important">
					<button class="text3">1개월</button><button class="text3">2개월</button><button class="text4">3개월이상</button>
					<button class="text6" id="reservation">예약</button><button class="text6" id="payment">결제</button>
					</div>
					<div style="width:295px; display: inline-block;!important;" align="right">
					<button class="text5">전체</button><button class="text5">결제완료</button><button class="text5" style="margin-right:5px;">결제취소</button>
					</div>
					<div id="paymentArea">
					<br><br>
					<div style="width: 100%; background-color: pink; height: 30px; margin-top:-20px; vertical-align: middle;'">
						<label style="margin-left: 30px;"class="text">번호</label>
						<label style="margin-left: 20px;"class="text">가게명</label>
						<label style="margin-left: 50px;"class="text">방문예정일자</label>
						<label style="margin-left: 80px;"class="text">상태</label>
						<label style="margin-left: 100px;"class="text">결제일자</label>
					</div>
					<table style="border-bottom: 1px solid pink; table-layout: fixed; " id="listArea" >
						<tr> 
							<td width="100px" nowrap><div style="width:30px; margin-left:0px; !important"><label class="text2">3</label></div></td>
							<td><div style="width:90px; margin-left:0px;"><label class="text2">돼지되지</label></div></td>
							<td><div style="width:130px; margin-left:0px;"><label class="text2">2020-05-11 11:01</label></div></td>
							<td><div style="width:80px; margin-left:50px;"><label class="text2">결제취소</label></div></td>
							<td><div style="width:130px; margin-left:30px;"><label class="text2">20/09/18 12:00</label></div></td>
						</tr>
						<tr>
							<td><div style="width:72px; margin-left:40px;"><label class="text2">2</label></div></td>
							<td><div style="width:60px; margin-left:0px;"><label class="text2">갈비천왕</label></div></td>
							<td><div style="width:130px; margin-left:40px;"><label class="text2">2020-05-10 14:09</label></div></td>
							<td><div style="width:80px; margin-left:50px;"><label class="text2">결제완료</label></div></td>
							<td><div style="width:130px; margin-left:30px;"><label class="text2">20/09/18 12:00</label></div></td>
						</tr>
						<tr>
							<td><div style="width:72px; margin-left:40px;"><label class="text2">1</label></div></td>
							<td><div style="width:60px; margin-left:0px;"><label class="text2">숯불갈비</label></div></td>
							<td><div style="width:130px; margin-left:40px;"><label class="text2">2020-05-11</label></div></td>
							<td><div style="width:80px; margin-left:50px;"><label class="text2">결제완료</label></div></td>
							<td><div style="width:130px; margin-left:30px;"><label class="text2">20/09/18 12:00</label></div></td>
						</tr>
					</table>
					</div>
					
					<div id="reservationArea">
					<br><br>
					<div style="width: 100%; background-color: pink; height: 30px; margin-top:-10px">
						<label style="margin-left: 30px;"class="text">번호</label>
						<label style="margin-left: 50px;"class="text">가게명</label>
						<label style="margin-left: 50px;"class="text">결제 완료 일자</label>
						<label style="margin-left: 80px;"class="text">상태</label>
						<label style="margin-left: 100px;"class="text">방문예정일자</label>
					</div>
					<table style="border-bottom: 1px solid pink" id="listArea">
						<tr> 
							<td><div style="width:72px; margin-left:40px;"><label class="text2">3</label></div></td>
							<td><div style="width:60px; margin-left:0px;"><label class="text2">돼지되지</label></div></td>
							<td><div style="width:130px; margin-left:40px;"><label class="text2">2020-05-11 11:01</label></div></td>
							<td><div style="width:80px; margin-left:50px;"><label class="text2">결제취소</label></div></td>
							<td><div style="width:130px; margin-left:30px;"><label class="text2">20/09/18 12:00</label></div></td>
						</tr>
						<tr>
							<td><div style="width:72px; margin-left:40px;"><label class="text2">2</label></div></td>
							<td><div style="width:60px; margin-left:0px;"><label class="text2">갈비천왕</label></div></td>
							<td><div style="width:130px; margin-left:40px;"><label class="text2">2020-05-10 14:09</label></div></td>
							<td><div style="width:80px; margin-left:50px;"><label class="text2">결제완료</label></div></td>
							<td><div style="width:130px; margin-left:30px;"><label class="text2">20/09/18 12:00</label></div></td>
						</tr>
						<tr>
							<td><div style="width:72px; margin-left:40px;"><label class="text2">1</label></div></td>
							<td><div style="width:60px; margin-left:0px;"><label class="text2">숯불갈비</label></div></td>
							<td><div style="width:130px; margin-left:40px;"><label class="text2">2020-05-11</label></div></td>
							<td><div style="width:80px; margin-left:50px;"><label class="text2">결제완료</label></div></td>
							<td><div style="width:130px; margin-left:30px;"><label class="text2">20/09/18 12:00</label></div></td>
						</tr>
					</table>
					</div>
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
		</div>
		<!-- // daumContent -->
		<%@include file="../common/footer.jsp"%>
		<!-- // daumFoot -->

		<div id="wrapMinidaum"></div>
	</div>
<script>
	$("#paymentArea").show();
	$("#reservationArea").hide();
	$("#reservation").click(function(){
		$("#paymentArea").hide();
		$(".text5").hide();
		
		$("#reservationArea").show();
	});
	
	$("#payment").click(function(){
		$("#paymentArea").show();
		$(".text5").show();
		
		$("#reservationArea").hide();
	});
</script>

</body>