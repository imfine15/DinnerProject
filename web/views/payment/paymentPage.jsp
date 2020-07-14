<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
</style>
<link rel='stylesheet prefetch'
	href='http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>

<link rel="stylesheet" href="css/style.css">
<link href='http://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>
<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="js/index.js"></script>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div
		style="width: 80%; height: 1200px; margin-left: auto; margin-right: auto; padding-top: 100px;">
		<div class="subb">
			<div style="width: 100%; margin-right: 0px;">
				<label style="font-size: 28px;">돼지되지</label><br>
				<br> <label style="color: gray; font-size: 20px;">서울
					역삼동 82-11번지 </label>
				<p style="width: 300px;">어느 곳보다 맛있는 돈까스 맛집! ‘돼지되지’ 입니다 맛있는 돈까스를
					합리적인 가격에 좋은 추억 만들어 드리겠읍니다...^^ 장미꽃 한 송이 놓고 갑니다..... @}--->-----</p>
				<br>
				<hr style="margin-left: -30px; margin-right: 50px;">
				<br> <input type="checkbox" style="width: 17px; height: 17px;">
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
				<label>돼지되지</label><br>
				<br>
				<div
					style="width: 130px; display: inline-block; font-size: 20px; font-weight: 600;">대표자명</div>
				<label>김진호</label><br>
				<br>
				<div
					style="width: 130px; display: inline-block; font-size: 20px; font-weight: 600;">소재지</div>
				<div style="display: inline-block; width: 300px;">
					<label>서울특별시 강남구 역삼동 59 파덕상가 지하철 2호선 역삼역 3번출구 100m</label>
				</div>
				<br>
				<br>
				<div
					style="width: 130px; display: inline-block; font-size: 20px; font-weight: 600;">사업자번호</div>
				<label>192-168-30-141</label><br>
				<br>
				<div
					style="width: 130px; display: inline-block; font-size: 20px; font-weight: 600;">연락처</div>
				<label>02)1544-9970</label><br>
				<br>

			</div>
		</div>
		<div class="subb"
			style="width: 300px; position: absolute; margin-top: 300px; right: 340px;">
			<hr style="margin-right: -150px; margin-left: 0px;">
			<br> <label style="font-size: 20px">날짜</label> <label></label> <br>
			<br>

		</div>
	</div>
	<%@include file="../common/footer.jsp"%>

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
var day;
var yearAndMonth;
var month;
function dd(){
	$("#calendar_content div").click(function(){
		day = this.innerHTML;
		yearAndMonth = $("#calendar_header h1").html().split(" ");
		console.log(yearAndMonth);
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
		console.log(month);
		console.log(day);
	});
}


 $(document).ready(function(){
	$("#calendar_content div").click(function(){
		day = this.innerHTML;
		yearAndMonth = $("#calendar_header h1").html().split(" ");
		console.log(yearAndMonth);
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
		console.log(month);
		console.log(day);
	});
}); 

</script>
</body>
</html>