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
<style>
.text {
	font-family: Roboto;
	font-style: normal;
	font-weight: normal;
	font-size: 20px;
	line-height: 21px;
	color: #000000;
	display: inline-block;
}

.box {
	background: #FFFFFF;
	border: 1px solid #6D6D6D;
	box-sizing: border-box;
	border-radius: 5px;
}

.text2 {
	font-family: Roboto;
	font-style: normal;
	font-weight: 200;
	font-size: 16px;
	line-height: 16px;
	text-align: center;
	border-radius: 5px;
	width: 100px;
	height: 30px;
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
	<%@ include file="/views/common/header.jsp" %>
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
						<li class="left"><a class="left2" href="/semiproject/views/myPage/myPage.jsp"><span class="navbar" style="color: #E1A9A9;">내정보 홈</span></a></li>
						<li class="left"><a class="left2"  href="/semiproject/views/myPage/checkingPassword.jsp?num=1"><span class="navbar">내정보 관리</span></a></li>
						<li class="left"><a class="left2"  href="/semiproject/views/myPage/checkingPassword.jsp?num=2"><span class="navbar">비밀번호 변경</span></a></li>
						<li class="left"><a class="left2"  href=""><span class="navbar">고객센터</span></a></li>
						<li class="left"><a class="left2"  href="/semiproject/views/myPage/checkingPassword.jsp?num=3"><span class="navbar">회원탈퇴</span></a></li>
					</ul>
				</div>
			</div>
		</div>

	<div
		style="width: 500px; height: 500px; margin-left: auto; margin-right: auto;">
		<form id="check" method="post" action="/semiproject/changeMemPwd.ma">
		<input type="hidden" value="<%=loginUser.getmNo()%>" name="mNo">
		<table>
			<tr>
				<td><img src=images/changePassword.PNG; style="width: 500px"></td>
			<tr>
			<tr>
				<td>
					<hr style="background: #EFECE8;"> <br> <br>
				</td>
			</tr>
			<tr>
				<td><label class="text" style="margin-left: 50px">새로운 비밀번호 : &nbsp;</label>
						<input name="password"
					class="box" type="password" style="margin-left: 50px;" id="password1">
					<button style="background: #C4C4C4; border-radius: 5px;" id="pwdShowHide1">보기</button><br>
					<br></td>
			</tr>
			<tr>
				<td style="margin-top: 10px;"><label class="text"
					style="margin-left: 50px">새로운 비밀번호  확인:</label> <input
					class="box" type="password" style="margin-left: 50px;" id="password2">
					<button style="background: #C4C4C4; border-radius: 5px;" id="pwdShowHide2">보기</button>
					<br>
					<br> <br> <br></td>
			</tr>
			<tr>
				<td>
					<hr style="background: #EFECE8;"> <br> <br>
				</td>
			</tr>
			<tr align="center">
				<td>
					<button class="text2" style="background: #E4E4E4;">이전으로</button>
					<button type="button" onclick="check();"class="text2" style="background: #97D3D3; color: white">확인</button>
				</td>
			</tr>
		</table>
		</form>

	</div>
	<%@ include file="/views/common/footer.jsp" %>
	<script>
		function check(){
			var pwd = $("#password1").val();
			var pwd2 = $("#password2").val();
			
			if(pwd == pwd2 && pwd.length > 7){
				$("#check").submit();
			} else {
				alert("비밀번호가 다릅니다.");
				$("#password1").val("");
				$("#password2").val("");
				return false;
			}
		};
		$(function(){
		    $('#pwdShowHide2').on('click', function(){
		        $('.box').toggleClass('active');
		        
		        if(!$('input').hasClass('active')) {
		            $("#password2").attr('type',"text");
		        } else {
		            $("#password2").attr('type',"password");
		        }
		    });
		    $('#pwdShowHide1').on('click', function(){
		        $('.box').toggleClass('active');
		        
		        if(!$('input').hasClass('active')) {
		            $("#password1").attr('type',"text");
		        } else {
		            $("#password1").attr('type',"password");
		        }
		    });
		});
	</script>

</body>
</html>