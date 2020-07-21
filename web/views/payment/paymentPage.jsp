<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String backPage = request.getContextPath() + "/views/payment/paymentPage.jsp";
	session.setAttribute("backPage", backPage);
	String enpNo = "";
	if(request.getParameter("enpNo") == null){
		enpNo = "ENP1";
	} else {
		enpNo = request.getParameter("enpNo");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMMET</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	$.ajax({
		type: "get",
		trl: "/semiproject/selectEnpimg.im",
		data: {
			enpNo:"<%=enpNo%>"
		},
		success: function(){
			
		},
		error: function(){
			
		}
	});
</script>
<style>
.subb {
	width: 44%;
	height: 100%;
	padding-top: 17%;
	padding-left: 10%;
	display: inline-block;
}

label {
	font-size: 15px;
}
.sle{
	width: 90px;
	padding: .8em .5em;
	border: 1px solid #999;
	font-family: inherit;
	background: url(/semiproject/views/payment/images/arrow.png) no-repeat 95% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: 0px;
}
.sle2{
	width: 60px;
	padding: .2em .2em;
	border: 1px solid #999;
	font-family: inherit;
	background: url(/semiproject/views/payment/images/arrow.png) no-repeat 95% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: 0px;
}
select::-ms-expand {
display: none;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>
<link rel='stylesheet prefetch'
	href='http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>

<link rel="stylesheet" href="css/style.css">
<link href='http://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>
<script src="js/index.js"></script>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
<form action="<%=request.getContextPath()%>/reservation.me" method="post" name="reserInfo">

	<input type="hidden" name="cals" value="CALC1">
	<div
		style="width: 80%; height: 1400px; margin-left: auto; margin-right: auto; padding-top: 100px;">
		<div class="subb">
			<div style="width: 100%; margin-right: 0px;">
				<label style="font-size: 28px;" id="eName"></label><br>
				<br> <label style="color: gray; font-size: 20px;" id="eAddress"> </label>
				<p style="width: 300px;" id="eIntro"></p>
				<br>
				<hr style="margin-left: -30px; margin-right: 50px;">
				<br> <input id="information" type="checkbox" style="width: 17px; height: 17px;">
				
				<label style="font-size: 20px">이용자 전체 약관 동의</label> <a href=""><label
					style="padding-left: 50px; font-size: 10px;">약관보기</label></a> <br>
				<br>

				<hr style="margin-left: -30px; margin-right: 50px;">
				<br> <label style="font-size: 20px;">└ </label> <label
					style="font-size: 20px">개인 정보 수집 동의</label> <a href=""><label
					style="padding-left: 90px; font-size: 10px;">보기</label></a> <br>
				<br>

				<hr style="margin-left: -30px; margin-right: 50px;">
				<br> <label style="font-size: 20px;">└ </label> <label
					style="font-size: 20px">개인 정보 제공 동의</label> <a href=""><label
					style="padding-left: 90px; font-size: 10px;">보기</label></a> <br>
				<br>

				<hr style="margin-left: -30px; margin-right: 50px;">
				<br> <label style="font-size: 27px;">판매자 정보</label><br>
				<br>
				<br>
				<div
					style="width: 130px; display: inline-block; font-size: 20px; font-weight: 600;">상호</div>
				<label id="eName2"></label><br>
				<br>
				<div
					style="width: 130px; display: inline-block; font-size: 20px; font-weight: 600;">대표자명</div>
				<label id="partnerName"></label><br>
				<br>
				<div
					style="width: 130px; display: inline-block; font-size: 20px; font-weight: 600;">소재지</div>
				<div style="display: inline-block; width: 300px;">
					<label id="eAddress2"></label>
				</div>
				<br>
				<br>
				<div
					style="width: 130px; display: inline-block; font-size: 20px; font-weight: 600;">사업자번호</div>
				<label id="eRegi"></label><br>
				<br>
				<div
					style="width: 130px; display: inline-block; font-size: 20px; font-weight: 600;">연락처</div>
				<label id="ePhone"></label><br>
				<br>

			</div>
		</div>
		<div class="subb"
			style="width: 300px; position: absolute; margin-top: 300px; right: 340px;">
			<hr style="margin-right: -150px; margin-left: 0px;">
			<br> <label style="font-size: 20px; padding-right:100px;">날짜</label> 
			<label id="year"></label>
			<label id="month"></label>
			<label id="day"></label>
			<label id="dayLabel"></label>
			
			<input type="hidden" id="year1" name="year">
			<input type="hidden" id="month1" name="month">
			<input type="hidden" id="day1" name="day">
			
			
			<br>
			<br>
			<hr style="margin-right: -150px; margin-left: 0px;"><br>
			<label style="font-size: 20px; padding-right:30px;">시간</label>
			<select name="hour" id="hour" class="sle" style="margin-right: 20px;">
				<option value="17">17시</option>
				<option value="18">18시</option>
				<option value="19">19시</option>
			</select>
			<select name="min" id="min" class="sle">
				<option value="00">00분</option>
				<option value="30">30분</option>
			</select>
			
			
			<hr style="margin-right: -150px; margin-left: 0px;"><br>
			<label style="font-size: 20px; padding-right:30px;">인원</label>
			<label style="font-size: 12px;">성인</label>
			<select name="adult" id="adult" class="sle2" style="margin-right: 20px;">
			
				<%for(int i = 1; i < 101; i ++){ %>
				<option value="<%=i%>"><%=i %>명</option>
				<%} %>
			</select>
			<label style="font-size: 12px;">어린이</label>
			<select id="child" class="sle2" name="child">
				<%for(int i = 0; i < 101; i ++){ %>
				<option value="<%=i%>"><%=i %>명</option>
				<%} %>
			</select>
			<br><br>
			
			<hr style="margin-right: -150px; margin-left: 0px;">
			<h2 style="font-weight: 500;">선택하신 예약 내역</h2>
			<label style="margin-right:30px; font-size:20px;">일정</label><label id="finaltime"></label><br><br>
			<label style="margin-right:30px; margin-top:10px; font-size:20px;">인원</label><label id="people"></label>
			<br><br>
			<hr style="margin-right: -150px; margin-left: 0px;">
			<label style="margin-right:150px; margin-top:10px; font-size:20px;">요청사항</label>
			<textarea cols=40 rows=10 style="resize: none;" placeholder="요청사항을 입력해 주세요." name="rcontent"></textarea><br><br>
			<label>사용하실 포인트 : </label><input style="background: white; border: 1px solid black; border-radius: 3px;" id="point" 
			class="sle2" name="point" type="number" min="0" max="2000" value="0"><br><br>
			
			<button type="button" onclick="reservation();" style="width:100%; height:50px; background: #DE6B6A; color:white; 
			border:0px; font-size: 26px;">예약하기</button><br>
			<div align="center">
				<label style="font-size: 15px;">예약시 보증금 </label><label id="pay"></label><label>원이 결제되며, </label><br>
				<label style="font-size: 14px;">식사 후 결제될 금액에서 빠지게 됩니다.</label>
				<input type="hidden" name="deposit" value="" id="deposit">
			</div>
		</div>
	</div>
	<input id="muid" name="muid" type="hidden" value="">
	<input id="payprice" name="payprice" type="hidden" value="">
</form>

<script>
	
	var IMP = window.IMP;
	IMP.init("imp12858574");
	function reservation(){
	if($("#finaltime").html() === null || $("#finaltime").html() === ""){
		alert("날짜 입력를 입력해주세요.");
		return false;
	} else if($("#information").is(":checked") != true){
		alert("이용자 약관 동의를 해주세요.");
		return false;
	} else if($("#people").html() === null || $("#people").html() === ""){
		alert("인원을 입력해주세요.");
		return false;
	} else {
		console.log(123);
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 1000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
				$("#payprice").val(rsp.paid_amount);
				$("#muid").val(rsp.merchant_uid);
		        document.reserInfo.submit();
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	}
	}
</script>
<%@ include file="/views/common/footer.jsp" %>

	<div id="calendar"
		style="position: absolute; top: 100px; right: 170px;">
		<div id="calendar_header" onclick="dd();">
			<i class="icon-chevron-left"></i>
			<h1></h1>
			<i class="icon-chevron-right"></i>
		</div>
		<div id="calendar_weekdays"></div>
		<div id="calendar_content"></div>
	</div>
	<img src="images/food.png"
		style="position: absolute; left: 200px; top: 100px;">
<script>

var yearAndMonth;
var year;
var month;
var day;
var hour = $("#hour").val();
var min = $("#min").val();
var week = new Array('일', '월', '화', '수', '목', '금', '토');
var today = new Date(year + "-" + month + "-" + day).getDay();
var todayLabel = week[today];

var adult = $("#adult").val();
var child = $("#child").val();

var check;

var date = new Date();
var nowyear = date.getFullYear();
var nowmonth = date.getMonth() + 1;
var nowdate = date.getDate();


var dhigher;
var dlower;

$.ajax({
	type: "get",
	url: "/semiproject/selectEnpInfo.re",
	data: {
		enpNo: "<%=enpNo%>"
	},
	success: function(data){
		console.log(data);
		$("#eName").html(data.enpName);
		$("#eAddress").html(data.enpAddress);
		$("#eIntro").html(data.introduce);
		$("#eName2").html(data.enpName);
		$("#partnerName").html(data.partnerName);
		$("#eAddress2").html(data.enpAddress);
		$("#eRegi").html(data.enpRegisterNo);
		$("#ePhone").html(data.enpPhone);
		dhigher = data.depositHigherLimit;
		dlower = data.depositLowerLimit;
	},
	error: function(){
		console.log("실패");
	}
});
$(".sle").change(function(){
	hour = $("#hour").val();
	min = $("#min").val();
	console.log("123123");
	if(nowyear == year && nowmonth >= month && nowdate >= day){
		
	} else{
	$("#year").html(year + "년");
	$("#month").html(month + "월");
	$("#day").html(day + "일");
	$("#dayLabel").html("("+todayLabel+")");
	
	$("#finaltime").html(year + "년 " + month + "월 " + day + "일 (" + todayLabel + 
			") " + hour + "시 " + min + "분")
	}
});


$(".sle2").change(function(){
	adult = $("#adult").val();
	child = $("#child").val();
	var pay = adult * dhigher + child * dlower - $("#point").val();
	$("#pay").html(pay);
	$("#people").html("어른 "+adult + ", 어린이 " + child) 
	$("#deposit").val(pay);
	if($("#point").val() > 2000){
		alert("포인트 사용은 2000포인트까지 사용이 가능합니다.");
		$("#point").val(0);
		pay = adult * dhigher + child * dlower;
		$("#deposit").val(pay);
		$("#pay").html(pay);
		return false;
	}
	console.log($("#deposit").val());
	console.log($("#point").val());
});

function dd(){
	$("#calendar_content div").click(function(){
		day = this.innerHTML;
		yearAndMonth = $("#calendar_header h1").html().split(" ");
		year = yearAndMonth[1];
		
		switch(yearAndMonth[0]){
		case "JANUARY" : month = 01; break;
		case "FEBRUARY" : month = 02; break;
		case "MARCH" : month = 03; break;
		case "APRIL" : month = 04; break;
		case "MAY" : month = 05; break;
		case "JUNE" : month = 06; break;
		case "JULY": month = 07; break;
		case "AUGUST": month = 08; break;
		case "SEPTEMBER": month = 09; break;
		case "OCTOBER": month = 10; break;
		case "NOVEMBER": month = 11; break;
		case "DECEMBER": month = 12; break;
		}
		
		week = new Array('일', '월', '화', '수', '목', '금', '토');
		today = new Date(year + "-" + month + "-" + day).getDay();
		todayLabel = week[today];
		
		if(nowyear == year && nowmonth >= month && nowdate >= day){
			alert("체크가 불가능 합니다.");

		} else{
		if(check == null){
			
		}else{
			check.css({"background":"white","color":"#787878"});
		}
		check = $(this);
		check.css({"background":"#EB7673","color":"white"});
		
		$("#year").html(year + "년");
		$("#month").html(month + "월");
		$("#day").html(day + "일");
		$("#dayLabel").html("(" + todayLabel + ")");
		
		$("#finaltime").html(year + "년 " + month + "월 " + day + "일 (" + todayLabel + 
				") " + hour + "시 " + min + "분");
		}
	});
}

 $(document).ready(function(){
	$("#calendar_content div").click(function(){
		day = this.innerHTML;
		yearAndMonth = $("#calendar_header h1").html().split(" ");
		year = yearAndMonth[1];
		
		switch(yearAndMonth[0]){
		case "JANUARY" : month = 1; break;
		case "FEBRUARY" : month = 2; break;
		case "MARCH" : month = 3; break;
		case "APRIL" : month = 4; break;
		case "MAY" : month = 5; break;
		case "JUNE" : month = 6; break;
		case "JULY": month = 7; break;
		case "AUGUST": month = 8; break;
		case "SEPTEMBER": month = 9; break;
		case "OCTOBER": month = 10; break;
		case "NOVEMBER": month = 11; break;
		case "DECEMBER": month = 12; break;
		}
		
		week = new Array('일', '월', '화', '수', '목', '금', '토');
		today = new Date(year + "-" + month + "-" + day).getDay();
		todayLabel = week[today];
		if(nowyear == year && nowmonth >= month && nowdate >= day){
			alert("체크가 불가능 합니다.");

		} else{
		if(check == null){
			
		}else{
			check.css({"background":"white","color":"#787878"});
		}
		check = $(this);
		check.css({"background":"#EB7673","color":"white"});
		
		$("#year").html(year + "년");
		$("#month").html(month + "월");
		$("#day").html(day + "일");
		$("#dayLabel").html("("+todayLabel+")");
		
		$("#year1").val(year);
		$("#month1").val(month);
		$("#day1").val(day);
		console.log($("#year1").val());
		$("#finaltime").html(year + "년 " + month + "월 " + day + "일 (" + todayLabel + 
				") " + hour + "시 " + min + "분");
		}
	});
}); 

</script>
</body>
</html>