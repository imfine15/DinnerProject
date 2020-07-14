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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.text {
	font-family: Roboto;
	font-style: normal;
	font-weight: normal;
	font-size: 23px;
	line-height: 21px;
	color: #000000;
}

.box2 {
	width: 38px;
	height: 19px;
	background: #FFFFFF;
	border: 1px solid #AFAFAF;
	box-sizing: border-box;
	border-radius: 5px;
	margin-bottom: 10px;
	font-family: Roboto;
	font-style: normal;
	font-weight: normal;
	font-size: 11px;
	line-height: 13px;
}

.text2 {
	font-family: Roboto;
	font-style: normal;
	font-weight: normal;
	font-size: 18px;
	line-height: 21px;
	color: #000000;
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
	border-radius: 0; !important; 
border: 1px solid gray; !important;
outline-style: none; !important;
}
button{
		border-radius: 0; !important; 
border: 1px solid gray; !important;
outline-style: none; !important;
}
button:active{
	background: pink;
}
</style>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div id="daumIndex">
		<!-- 웹접근성용 바로가기 링크 모음 -->
		<a href="#daumBody" data-tiara-action-name="본문_바로가기">본문 바로가기</a> <a
			href="#daumGnb" data-tiara-action-name="메뉴_바로가기">메뉴 바로가기</a>
	</div>

	<div id="daumHead" role="banner">
			<div class="inner_head" style="padding-right:30px;">
				<h1>
					<a href="/semiproject/views/myPage/myPage.jsp" id="daumServiceLogo"><span class="ir_wa">내정보</span></a>
				</h1>
				<!-- PC 웹 내정보 GNB -->
				<div id="" role="navigation">
					<ul style="padding-top: 10px; padding-left:-30px;">
						<li class="left"><a class="left2" href="/semiproject/views/myPage/myPage.jsp"><span class="navbar"">내정보 홈</span></a></li>
						<li class="left"><a class="left2"  href="/semiproject/views/myPage/checkingPassword.jsp"><span class="navbar" style="color: #E1A9A9;">내정보 관리</span></a></li>
						<li class="left"><a class="left2"  href="/semiproject/views/myPage/checkingPassword.jsp"><span class="navbar">비밀번호 변경</span></a></li>
						<li class="left"><a class="left2"  href=""><span class="navbar">고객센터</span></a></li>
						<li class="left"><a class="left2"  href="/semiproject/views/myPage/withdrawalFromMembership.jsp"><span class="navbar">회원탈퇴</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	<form method="post">
	<div
		style="width: 700px; height: 700px; margin-left: auto; margin-right: auto;">
		
		<table>
			<tr>
				<td style="width: 800px"><img src=images/changeMyProfile.PNG; style="width: 600px"></td>
			<tr>
			<tr>
				<td>
					<hr style="background: #EFECE8;"> <br>
				</td>
			</tr>
			<tr>
				<td><label class="text">아이디 </label> <label class="text2"
					style="margin-left: 100px;">YUMEET 아이디 </label> <label
					class="text2" style="margin-left: 80px;">paducks </label> <br>
				<br>
				<hr>
				<br></td>
			</tr>
			
			<tr>
				<td><label class="text">닉네임/연락처</label> 
					<label class="text2"style="margin-left: 27px;">닉네임 </label> 
					<label id="nickname" class="text2" style="margin-left: 153px;">파덕이악사</label>
					<input name="nickname" id="changeNicknameInput" type="text" style="width:130px; margin-left:390px;">
					<button type="button" id="changeNickname" class="box2">변경</button> <br><br> 
					
					<label class="text2" style="margin-left: 178px;">연락처</label>
					
					<img src="images/phone.png.png" width=20px; style="margin-left: 155px;" >
					<label id="phone" class="text2">010-4444-3333</label>
					<input name="phone" id="changePhoneInput" type="text" style="width:130px; margin-left:390px;">
					<button type="button" id="changePhone" class="box2">변경</button> <br><br> 
					
					<img src="images/homePage.png.png" width=20px; style="margin-left: 391px;" >
					<label id="address" class="text2">서울 서초구 양재동</label>
					<input name="address" id="changeAddressInput" type="text" style="width:130px; margin-left:390px;">
					<button type="button" id="changeAddress" class="box2">변경</button> <br><br> 
					
					<img src="images/email.png.png" width=20px; style="margin-left: 391px;" >
					<label id="email" class="text2">ddddd@naver.com</label>
					<input name="email" id="changeEmailInput" type="text" style="width:130px; margin-left:390px;">
					<button type="button" id="changeEmail" class="box2">변경</button> <br>
					
					<label class="text2" style="margin-left: 411px; font-size:13px">연락처 1개는 필수 항목 입니다.</label>
					<br><br><hr><br>
					</td>
			</tr>
			<tr>
				<td><label class="text">이름/연령확인</label> 
				
				<label class="text2"style="margin-left: 27px;">이름 </label> 
				<label class="text2" id="name" style="margin-left: 171px;">정용탁</label>
				<input name="name" id="changeNameInput" type="text" style="width:100px; margin-left:390px;">
				<button type="button" id="changeName" class="box2">변경</button> 
				<br><br> 
					
				<label class="text2" style="margin-left: 178px;">나이</label>
				<label class="text2" id="age" style="margin-left: 175px;">33</label><label class="text2">살</label>
				<input name="age" id="changeAgeInput" type="text" style="width:100px; margin-left:390px;">
				<button type="button" id="changeAge" class="box2">변경</button><br><br> 
					
				</td>
			</tr>
		</table><div align="center">
			<input type="submit" value="수정하기">
			<input type="reset" value="취소하기">
		</div>
		</div>
	</form>
	<%@ include file="../common/footer.jsp"%>
	<script>
	var name = 1;
	$("#changeNameInput").hide();
	$("#changeNameInput").val($("#name").html())
	
	$("#changeAgeInput").hide();
	$("#changeAgeInput").val($("#age").html());
	
	$("#changeEmailInput").hide();
	$("#changeEmailInput").val($("#email").html());
	
	$("#changeAddressInput").hide();
	$("#changeAddressInput").val($("#address").html());
	
	$("#changePhoneInput").hide();
	$("#changePhoneInput").val($("#phone").html());
	
	$("#changeNicknameInput").hide();
	$("#changeNicknameInput").val($("#nickname").html());
	
	$("#changeName").click( function(){
		if(name == 0){
			$("#changeNameInput").hide();
			name = 1;
			$("#changeName").html("변경");
			$("#name").html($("#changeNameInput").val());
		} else {
			$("#changeNameInput").show();
			$("#changeNameInput").val($("#name").html());
			name = 0;
			$("#changeName").html("수정");
		}
	});
	
	$("#changeAge").click( function(){
		if(name == 0){
			$("#changeAgeInput").hide();
			name = 1;
			$("#changeAge").html("변경");
			$("#age").html($("#changeAgeInput").val());
		} else {
			$("#changeAgeInput").show();
			$("#changeAgeInput").val($("#age").html());
			name = 0;
			$("#changeAge").html("수정");
		}
	});
	
	$("#changeEmail").click( function(){
		if(name == 0){
			$("#changeEmailInput").hide();
			name = 1;
			$("#changeEmail").html("변경");
			$("#email").html($("#changeEmailInput").val());
		} else {
			$("#changeEmailInput").show();
			$("#changeEmailInput").val($("#email").html());
			name = 0;
			$("#changeEmail").html("수정");
		}
	});
	
	$("#changeAddress").click( function(){
		if(name == 0){
			$("#changeAddressInput").hide();
			name = 1;
			$("#changeAddress").html("변경");
			$("#address").html($("#changeAddressInput").val());
		} else {
			$("#changeAddressInput").show();
			$("#changeAddressInput").val($("#address").html());
			name = 0;
			$("#changeAddress").html("수정");
		}
	});
	
	$("#changePhone").click( function(){
		if(name == 0){
			$("#changePhoneInput").hide();
			name = 1;
			$("#changePhone").html("변경");
			$("#phone").html($("#changePhoneInput").val());
		} else {
			$("#changePhoneInput").show();
			$("#changePhoneInput").val($("#phone").html());
			name = 0;
			$("#changePhone").html("수정");
		}
	});
	
	$("#changeNickname").click( function(){
		if(name == 0){
			$("#changeNicknameInput").hide();
			name = 1;
			$("#changeNickname").html("변경");
			$("#nickname").html($("#changeNicknameInput").val());
		} else {
			$("#changeNicknameInput").show();
			$("#changeNicknameInput").val($("#nickname").html());
			name = 0;
			$("#changeNickname").html("수정");
		}
	});
	</script>

</body>
</html>