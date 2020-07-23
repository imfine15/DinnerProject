<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.semi.payment.model.vo.*, java.util.*"%>
<%
	ArrayList<ReservationVO> list = (ArrayList<ReservationVO>)session.getAttribute("list"); 
	ArrayList<String> enpList = (ArrayList<String>) session.getAttribute("enpList");
	ArrayList<String> statusList = (ArrayList<String>) session.getAttribute("statusList");
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
	width:40px; 
	border:1px solid #97D3D3; 
	background: #97D3D3;
	border-radius: 5px;
	margin-left: 5px;
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
					<button class="text5" id="payAreaAll">전체</button>
					<button class="text5" id="payAreaSuc">결제완료</button>
					<button class="text5" style="margin-right:5px;" id="payAreaClo">결제취소</button>
					<button class="tex" id="reserAreaAll">전체</button>
					<button class="tex" id="reserAreaSuc">완료</button>
					<button class="tex" id="reserAreaYet">예약중</button>
					<button class="tex" style="margin-right:5px;" id="reserAreaClo">취소</button>
					</div>
					
					<!-- 결제전체 Area -->
					<div id="paymentArea">
					<br><br>
					<div style="width: 100%; background-color: pink; height: 30px; margin-top:-20px; vertical-align: middle; padding-top: 5px;'">
						<label style="margin-left: 20px;"class="text">번호</label>
						<label style="margin-left: 20px;"class="text">가게명</label>
						<label style="margin-left: 70px;"class="text">방문 예정 일자</label>
						<label style="margin-left: 80px;"class="text">상태</label>
						<label style="margin-left: 100px;"class="text">결제일자</label>
					</div>
					<table style="border-bottom: 1px solid pink; border-spacing: 0 10px; table-layout: fixed;" id="listArea" >
					<%
					int psuc = 0;
					int pclo = 0;
					
					for(int i = list.size() - 1; i >= 0; i --) {
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						String rDate = format.format(list.get(i).getrDate());
						String sysDate = format.format(list.get(i).getSysDate());
						String status = "";
						switch(statusList.get(i)){
						case "RSC1": status = "결제완료"; psuc++; break;
						case "RSC2": status = "결제완료"; psuc++; break;
						case "RSC3": status = "결제취소"; pclo++; break;
						case "RSC4": status = "결제취소"; pclo++; break;
						case "RSC5": status = "결제완료"; psuc++; break;
						}
					%>
						<tr>
							<td><div style="padding-left:30px; width:30px" class="text2"><%=i+1 %></div></td>
							<td><div style="padding-left:10px; width:110px;" class="text2" ><%=enpList.get(i) %></div></td>
							<td><div style="padding-left:10px; width:150px;" class="text2"><%=rDate%></div></td>
							<td><div style="padding-left:30px; width:80px;" class="text2"><%=status %></div></td>
							<td><div style="padding-left:50px; width:187px;" class="text2"><%=sysDate %></div></td>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
						</tr>
						<%} %>
					</table>
					</div>
					
					<!-- 결제 완료 Area -->
					<div id="paymentSucArea">
					<br><br>
					<div style="width: 100%; background-color: pink; height: 30px; margin-top:-20px; vertical-align: middle; padding-top: 5px;'">
						<label style="margin-left: 20px;"class="text">번호</label>
						<label style="margin-left: 20px;"class="text">가게명</label>
						<label style="margin-left: 70px;"class="text">방문 예정 일자</label>
						<label style="margin-left: 80px;"class="text">상태</label>
						<label style="margin-left: 100px;"class="text">결제일자</label>
					</div>
					<table style="border-bottom: 1px solid pink;border-spacing: 0 10px; table-layout: fixed;" id="listArea" >
					<%
					int psucCount = psuc;
					for(int i = list.size() - 1; i >= 0; i --) {
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						String rDate = format.format(list.get(i).getrDate());
						String sysDate = format.format(list.get(i).getSysDate());
						String status = "";
						switch(statusList.get(i)){
						case "RSC1": status = "결제완료"; break;
						case "RSC2": status = "결제완료"; break;
						case "RSC3": status = "결제취소"; break;
						case "RSC4": status = "결제취소"; break;
						case "RSC5": status = "결제완료"; break;
						}
						if(status.equals("결제완료")){
					%>
						<tr>
							<td><div style="padding-left:30px; width:30px" class="text2"><%=psucCount %></div></td>
							<td><div style="padding-left:10px; width:110px;" class="text2" ><%=enpList.get(i) %></div></td>
							<td><div style="padding-left:10px; width:150px;" class="text2"><%=rDate%></div></td>
							<td><div style="padding-left:30px; width:80px;" class="text2"><%=status %></div></td>
							<td><div style="padding-left:50px; width:187px;" class="text2"><%=sysDate %></div></td>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
						</tr>
						<%psucCount--;}} %>
					</table>
					</div>
					
					<!-- 결제 취소 Area-->
					<div id="paymentCloArea">
					<br><br>
					<div style="width: 100%; background-color: pink; height: 30px; margin-top:-20px; vertical-align: middle; padding-top: 5px;'">
						<label style="margin-left: 20px;"class="text">번호</label>
						<label style="margin-left: 20px;"class="text">가게명</label>
						<label style="margin-left: 70px;"class="text">방문 예정 일자</label>
						<label style="margin-left: 80px;"class="text">상태</label>
						<label style="margin-left: 100px;"class="text">결제일자</label>
					</div>
					<table style="border-bottom: 1px solid pink;border-spacing: 0 10px; table-layout: fixed;" id="listArea" >
					<%
					int pCloCount = pclo;
					for(int i = list.size() - 1; i >= 0; i --) {
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						String rDate = format.format(list.get(i).getrDate());
						String sysDate = format.format(list.get(i).getSysDate());
						String status = "";
						switch(statusList.get(i)){
						case "RSC1": status = "결제완료"; break;
						case "RSC2": status = "결제완료"; break;
						case "RSC3": status = "결제취소"; break;
						case "RSC4": status = "결제취소"; break;
						case "RSC5": status = "결제완료"; break;
						}
						if(status.equals("결제취소")){
					%>
						<tr>
							<td><div style="padding-left:30px; width:30px" class="text2"><%=pCloCount %></div></td>
							<td><div style="padding-left:10px; width:110px;" class="text2" ><%=enpList.get(i) %></div></td>
							<td><div style="padding-left:10px; width:150px;" class="text2"><%=rDate%></div></td>
							<td><div style="padding-left:30px; width:80px;" class="text2"><%=status %></div></td>
							<td><div style="padding-left:50px; width:187px;" class="text2"><%=sysDate %></div></td>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
						</tr>
						<%pCloCount--;}} %>
					</table>
					</div>
					
					<!-- 예약전체 Area -->
					<div id="reservationArea">
					<div style="width: 100%; background-color: pink; height: 30px; margin-top:16px; vertical-align: middle; padding-top: 5px;'">
						<label style="margin-left: 20px;"class="text">번호</label>
						<label style="margin-left: 20px;"class="text">가게명</label>
						<label style="margin-left: 70px;"class="text">방문 예정 일자</label>
						<label style="margin-left: 80px;"class="text">상태</label>
						<label style="margin-left: 60px;"class="text">예약신청일자</label>
					</div>
					<table style="border-bottom: 1px solid pink; border-spacing: 0 10px; table-layout: fixed;" id="listArea" >
					<%
					int suc = 0;
					int yet = 0;
					int clo = 0;
					int cc = 0;
					for(int i = list.size() - 1; i > -1; i --) {
						
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						String rDate = format.format(list.get(i).getrDate());
						String sysDate = format.format(list.get(i).getSysDate());
						
						Calendar cal = Calendar.getInstance();
						String today = format.format(cal.getTime());
						
						
						Date systamp = format.parse(today);
						Date rstamp = format.parse(rDate);
						
						int compare = systamp.compareTo(rstamp);
						
						String status = "";
						switch(statusList.get(i)){
						case "RSC1": status = "예약중"; yet++; break;
						case "RSC2": status = "예약완료"; suc++; break;
						case "RSC3": status = "결제취소"; clo++; break;
						case "RSC4": status = "예약거절"; clo++; break;
						case "RSC5": status = "방문완료"; suc++; break;
						}
					%>
						<tr>
							<td><div style="padding-left:30px; width:30px" class="text2"><%=i + 1 %></div></td>
							<td><div style="padding-left:10px; width:110px;" class="text2" ><%=enpList.get(i) %></div></td>
							<td><div style="padding-left:10px; width:150px;" class="text2"><%=rDate %></div></td>
							<td><div style="padding-left:30px; width:80px;" class="text2"><%=status %></div></td>
							<td><div style="padding-left:10px; width:120px;" class="text2"><%=sysDate %></div></td>
							<%if(compare < 0 && (status.equals("예약중")) || status.equals("예약완료")){ %>
							<td><div align="center" class="butt"><button style="width: 100%; height: 100%;" class="change" value="<%=list.get(i).geteNo()%>">수정</button></div></td>
							<td><div align="center" class="butt"><button style="width: 100%; height: 100%;" class="cencle" value="<%=list.get(i).geteNo()%>">취소</button></div></td>
							<td><input type="hidden" value="<%=list.get(i).getrNo()%>"></td>
							<%}%>
						</tr>
						<%}%>
					</table>
					</div>
					
					<!-- 방문완료, 예약완료 Area -->
					<div id="reservationSucArea">
					<div style="width: 100%; background-color: pink; height: 30px; margin-top:16px; vertical-align: middle; padding-top: 5px;'">
						<label style="margin-left: 20px;"class="text">번호</label>
						<label style="margin-left: 20px;"class="text">가게명</label>
						<label style="margin-left: 70px;"class="text">방문 예정 일자</label>
						<label style="margin-left: 80px;"class="text">상태</label>
						<label style="margin-left: 60px;"class="text">예약신청일자</label>
					</div>
					<table style="border-bottom: 1px solid pink; border-spacing: 0 10px; table-layout: fixed;" id="listArea" >
					<%
					
					int sucCount = suc;
					for(int i = list.size() - 1; i > -1; i --) {
						
						String status = "";
						switch(statusList.get(i)){
						case "RSC1": status = "예약중"; break;
						case "RSC2": status = "예약완료"; break;
						case "RSC3": status = "결제취소"; break;
						case "RSC4": status = "예약거절"; break;
						case "RSC5": status = "방문완료"; break;
						}
						if(status.equals("방문완료") || status.equals("예약완료")){
						
						
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						String rDate = format.format(list.get(i).getrDate());
						String sysDate = format.format(list.get(i).getSysDate());
						
						Calendar cal = Calendar.getInstance();
						String today = format.format(cal.getTime());
						
						
						Date systamp = format.parse(today);
						Date rstamp = format.parse(rDate);
						
						int compare = systamp.compareTo(rstamp);
						
						
					%>
						<tr>
							<td><div style="padding-left:30px; width:30px" class="text2"><%=sucCount %></div></td>
							<td><div style="padding-left:10px; width:110px;" class="text2" ><%=enpList.get(i) %></div></td>
							<td><div style="padding-left:10px; width:150px;" class="text2"><%=rDate %></div></td>
							<td><div style="padding-left:30px; width:80px;" class="text2"><%=status %></div></td>
							
							<%if(compare < 0 && (status.equals("예약중")) || status.equals("예약완료")){ %>
							<td><div style="padding-left:10px; width:120px;" class="text2"><%=sysDate %></div></td>
							<td><div align="center" class="butt"><button style="width: 100%; height: 100%;">수정</button></div></td>
							<td><div align="center" class="butt"><button style="width: 100%; height: 100%;">취소</button></div></td>
							<%} else {%>
							<td><div style="padding-left:10px; width:230px;" class="text2"><%=sysDate %></div></td>
							<%} %>
						</tr>
						<%sucCount--;}
						} %>
					</table>
					</div>
					
					<!-- 예약중Area -->
					<div id="reservationYetArea">
					<div style="width: 100%; background-color: pink; height: 30px; margin-top:16px; vertical-align: middle; padding-top: 5px;'">
						<label style="margin-left: 20px;"class="text">번호</label>
						<label style="margin-left: 20px;"class="text">가게명</label>
						<label style="margin-left: 70px;"class="text">방문 예정 일자</label>
						<label style="margin-left: 80px;"class="text">상태</label>
						<label style="margin-left: 60px;"class="text">예약신청일자</label>
					</div>
					<table style="border-bottom: 1px solid pink; border-spacing: 0 10px; table-layout: fixed;" id="listArea" >
					<%
					int yetCount = yet;
					for(int i = list.size() - 1; i > -1; i --) {
						
						String status = "";
						switch(statusList.get(i)){
						case "RSC1": status = "예약중"; break;
						case "RSC2": status = "예약완료"; break;
						case "RSC3": status = "결제취소"; break;
						case "RSC4": status = "예약거절"; break;
						case "RSC5": status = "방문완료"; break;
						}
						if(status.equals("예약중")){
							
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						String rDate = format.format(list.get(i).getrDate());
						String sysDate = format.format(list.get(i).getSysDate());
						
						Calendar cal = Calendar.getInstance();
						String today = format.format(cal.getTime());
						
						
						Date systamp = format.parse(today);
						Date rstamp = format.parse(rDate);
						
						int compare = systamp.compareTo(rstamp);
						
						
					%>
						<tr>
							<td><div style="padding-left:30px; width:30px" class="text2"><%=yetCount %></div></td>
							<td><div style="padding-left:10px; width:110px;" class="text2" ><%=enpList.get(i) %></div></td>
							<td><div style="padding-left:10px; width:150px;" class="text2"><%=rDate %></div></td>
							<td><div style="padding-left:30px; width:80px;" class="text2"><%=status %></div></td>
							
							<%if(compare < 0 && (status.equals("예약중")) || status.equals("예약완료")){ %>
							<td><div style="padding-left:10px; width:120px;" class="text2"><%=sysDate %></div></td>
							<td><div align="center" class="butt"><button style="width: 100%; height: 100%;">수정</button></div></td>
							<td><div align="center" class="butt"><button style="width: 100%; height: 100%;">취소</button></div></td>
							<%} else {%>
							<td><div style="padding-left:10px; width:230px;" class="text2"><%=sysDate %></div></td>
							<%} %>
						</tr>
						<%
						yetCount --;
						}
						} %>
					</table>
					</div>
					
					<!-- 결제취소, 예약취소 Area -->
					<div id="reservationCloArea">
					<div style="width: 100%; background-color: pink; height: 30px; margin-top:16px; vertical-align: middle; padding-top: 5px;'">
						<label style="margin-left: 20px;"class="text">번호</label>
						<label style="margin-left: 20px;"class="text">가게명</label>
						<label style="margin-left: 70px;"class="text">방문 예정 일자</label>
						<label style="margin-left: 80px;"class="text">상태</label>
						<label style="margin-left: 60px;"class="text">예약신청일자</label>
					</div>
					<table style="border-bottom: 1px solid pink; border-spacing: 0 10px; table-layout: fixed;" id="listArea" >
					<%
					int cloCount = clo;
					for(int i = list.size() - 1; i > -1; i --) {
						
						String status = "";
						switch(statusList.get(i)){
						case "RSC1": status = "예약중"; break;
						case "RSC2": status = "예약완료"; break;
						case "RSC3": status = "결제취소"; break;
						case "RSC4": status = "예약거절"; break;
						case "RSC5": status = "방문완료"; break;
						}
						if(status.equals("예약거절")||status.equals("결제취소")){
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						String rDate = format.format(list.get(i).getrDate());
						String sysDate = format.format(list.get(i).getSysDate());
						
						Calendar cal = Calendar.getInstance();
						String today = format.format(cal.getTime());
						
						
						Date systamp = format.parse(today);
						Date rstamp = format.parse(rDate);
						
						int compare = systamp.compareTo(rstamp);
						
						
					%>
						<tr>
							<td><div style="padding-left:30px; width:30px" class="text2"><%=cloCount %></div></td>
							<td><div style="padding-left:10px; width:110px;" class="text2" ><%=enpList.get(i) %></div></td>
							<td><div style="padding-left:10px; width:150px;" class="text2"><%=rDate %></div></td>
							<td><div style="padding-left:30px; width:80px;" class="text2"><%=status %></div></td>
							
							<%if(compare < 0 && (status.equals("예약중")) || status.equals("예약완료")){ %>
							<td><div style="padding-left:10px; width:120px;" class="text2"><%=sysDate %></div></td>
							<td><div align="center" class="butt"><button style="width: 100%; height: 100%;">수정</button></div></td>
							<td><div align="center" class="butt"><button style="width: 100%; height: 100%;">취소</button></div></td>
							<%} else {%>
							<td><div style="padding-left:10px; width:230px;" class="text2"><%=sysDate %></div></td>
							<%} %>
						</tr>
						<%
						cloCount --;
						}
						} %>
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

	$(".change").click(function(){
		location.href="<%=request.getContextPath()%>/views/payment/paymentPage.jsp";
	});
	
	$(".cencle").click(function(){
		console.log(this.value);
		
		console.log($(this).parent().parent().next().children().val());
		var rNo = $(this).parent().parent().next().children().val();
		location.href="<%=request.getContextPath()%>/views/payment/cancel.jsp?eNo=" + this.value + "&rNo=" + rNo;
		
	});
	
</script>
<script>

	$("#reservationArea").hide();
	$(".tex").hide();
	$("#reservationSucArea").hide();
	$("#reservationYetArea").hide();
	$("#reservationCloArea").hide();
	$("#paymentSucArea").hide();
	$("#paymentCloArea").hide();
	
	$("#payment, #payAreaAll").click(function(){
		$("#paymentArea").show();
		$(".text5").show();
		
		$("#reservationArea").hide();
		$(".tex").hide();
		
		$("#reservationSucArea").hide();
		$("#reservationYetArea").hide();
		$("#reservationCloArea").hide();
		
		$("#paymentSucArea").hide();
		$("#paymentCloArea").hide();

	});
	
	$("#payAreaSuc").click(function(){
		$("#paymentArea").hide();
		$(".text5").show();
		
		$("#reservationArea").hide();
		$(".tex").hide();
		
		$("#reservationSucArea").hide();
		$("#reservationYetArea").hide();
		$("#reservationCloArea").hide();
		
		$("#paymentSucArea").show();
		$("#paymentCloArea").hide();

	});
	
	$("#payAreaClo").click(function(){
		$("#paymentArea").hide();
		$(".text5").show();
		
		$("#reservationArea").hide();
		$(".tex").hide();
		
		$("#reservationSucArea").hide();
		$("#reservationYetArea").hide();
		$("#reservationCloArea").hide();
		
		$("#paymentSucArea").hide();
		$("#paymentCloArea").show();

	});
	$("#reservation, #reserAreaAll").click(function(){
		$("#paymentArea").hide();
		$(".text5").hide();
		
		$("#reservationArea").show();
		$(".tex").show();
		
		$("#reservationSucArea").hide();
		$("#reservationYetArea").hide();
		$("#reservationCloArea").hide();

		$("#paymentSucArea").hide();
		$("#paymentCloArea").hide();
		
		});
	

	
	$("#reserAreaSuc").click(function(){
		$("#paymentArea").hide();
		$(".text5").hide();
		
		$("#reservationArea").hide();
		$(".tex").show();
		
		$("#reservationYetArea").hide();
		$("#reservationSucArea").show();
		$("#reservationCloArea").hide();

		$("#paymentSucArea").hide();
		$("#paymentCloArea").hide();
	});
	
	$("#reserAreaYet").click(function(){
		$("#paymentArea").hide();
		$(".text5").hide();
		
		$("#reservationArea").hide();
		$(".tex").show();
		
		$("#reservationYetArea").show();
		$("#reservationSucArea").hide();
		$("#reservationCloArea").hide();
		
		$("#paymentSucArea").hide();
		$("#paymentCloArea").hide();
	});
	
	$("#reserAreaClo").click(function(){
		$("#paymentArea").hide();
		$(".text5").hide();
		
		$("#reservationArea").hide();
		$(".tex").show();
		
		$("#reservationYetArea").hide();
		$("#reservationSucArea").hide();
		$("#reservationCloArea").show();
		
		$("#paymentSucArea").hide();
		$("#paymentCloArea").hide();
	});
	
</script>

</body>