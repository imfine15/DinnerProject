<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.semi.payment.model.vo.*, java.util.*"%>
<%
	ArrayList<ReservationVO> list = (ArrayList<ReservationVO>)session.getAttribute("list"); 
	ArrayList<String> enpList = (ArrayList<String>) session.getAttribute("enpList");

%>
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
.butt{
	width:45px; 
	border:1px solid #97D3D3; 
	background: #97D3D3;
	border-radius: 5px;
}
.butt button{
	color: white;
}
.tex {
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
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
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
					<div style="width:340px; display: inline-block;!important">
					<button class="text3">1개월</button><button class="text3">2개월</button><button class="text4">3개월이상</button>
					<button class="text6" id="reservation">예약</button><button class="text6" id="payment">결제</button>
					</div>
					<div style="width:340px; display: inline-block;!important;" align="right">
					<button class="text5">전체</button><button class="text5">결제완료</button><button class="text5" style="margin-right:5px;">결제취소</button>
					<button class="tex">전체</button><button class="tex">완료</button><button class="tex">예약중</button><button class="tex" style="margin-right:5px;">예약취소</button>
					</div>
					<div id="paymentArea">
					<br><br>
					<div style="width: 100%; background-color: pink; height: 30px; margin-top:-20px; vertical-align: middle; padding-top: 5px;'">
						<label style="margin-left: 20px;"class="text">번호</label>
						<label style="margin-left: 20px;"class="text">가게명</label>
						<label style="margin-left: 70px;"class="text">방문 예정 일자</label>
						<label style="margin-left: 80px;"class="text">상태</label>
						<label style="margin-left: 100px;"class="text">결제일자</label>
					</div>
					<table style="border-bottom: 1px solid pink; table-layout: fixed;" id="listArea" >
					<%for(int i = list.size() - 1; i >= 0; i --) {
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						String rDate = format.format(list.get(i).getrDate());
						String sysDate = format.format(list.get(i).getSysDate());
						
					%>
						<tr>
							<td><div style="padding-left:30px; width:30px" class="text2"><%=i+1 %></div></td>
							<td><div style="padding-left:10px; width:110px;" class="text2" ><%=enpList.get(i) %></div></td>
							<td><div style="padding-left:10px; width:150px;" class="text2"><%=rDate%></div></td>
							<td><div style="padding-left:30px; width:80px;" class="text2">결제완료</div></td>
							<td><div style="padding-left:50px; width:187px;" class="text2"><%=sysDate %></div></td>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
						</tr>
						<%} %>
					</table>
					</div>
					
					<div id="reservationArea">
					<div style="width: 100%; background-color: pink; height: 30px; margin-top:16px; vertical-align: middle; padding-top: 5px;'">
						<label style="margin-left: 20px;"class="text">번호</label>
						<label style="margin-left: 20px;"class="text">가게명</label>
						<label style="margin-left: 70px;"class="text">방문 예정 일자</label>
						<label style="margin-left: 80px;"class="text">상태</label>
						<label style="margin-left: 60px;"class="text">예약신청일자</label>
					</div>
					<table style="border-bottom: 1px solid pink; table-layout: fixed;" id="listArea" >
					<%for(int i = list.size() - 1; i >= 0; i --) {
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						String rDate = format.format(list.get(i).getrDate());
						String sysDate = format.format(list.get(i).getSysDate());
						
					%>
						<tr>
							<td><div style="padding-left:30px; width:30px" class="text2"><%=i + 1 %></div></td>
							<td><div style="padding-left:10px; width:110px;" class="text2" ><%=enpList.get(i) %></div></td>
							<td><div style="padding-left:10px; width:150px;" class="text2"><%=rDate %></div></td>
							<td><div style="padding-left:30px; width:80px;" class="text2">예약중</div></td>
							<td><div style="padding-left:10px; width:120px;" class="text2"><%=sysDate %></div></td>
							<td><div align="center" class="butt"><button>수정</button></div></td>
							<td><div align="center" class="butt"><button>취소</button></div></td>
						</tr>
						<%} %>
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
	<%@ include file="/views/common/footer.jsp" %>
		<!-- // daumFoot -->

		<div id="wrapMinidaum"></div>
	</div>
<script>
	$("#reservationArea").hide();
	$(".tex").hide();
	$("#reservation").click(function(){
		$("#paymentArea").hide();
		$(".text5").hide();
		
		$("#reservationArea").show();
		$(".tex").show();
		});
	
	$("#payment").click(function(){
		$("#paymentArea").show();
		$(".text5").show();
		
		$("#reservationArea").hide();
		$(".tex").hide();
		
	});
</script>

</body>