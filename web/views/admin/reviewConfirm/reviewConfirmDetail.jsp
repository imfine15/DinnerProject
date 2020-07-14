<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET 관리자페이지</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<style>
.hide {
	background-color: white;
	border: 0px;
	height: 30px;
}

#wrapper {
	width: 85%;
	height: 100%;
	margin-left: 230px;
	padding-top: 40px;
	padding-left: 30px;
}

#title-box {
	background: #F9F9F9;
	width: 100%;
	height: 50px;
	margin-bottom: 10px;
	padding-left: 10px;
	font-family: Noto Sans KR;
	font-size: 30px;
	font-weight: bolder;
}

#inner-box {
	width: 100%;
	height: auto;
}

#inner-wrap {
	padding-left: 50px;
	padding-right: 50px;
	background: white;
	width: 95%;
}

#send-btn {
	color: white;
	background-color: #E07370;
	border: none;
	width: 40px;
	height: 25px;
}

#sendcom-btn {
	color: white;
	background-color: #A0A0A0;
	border: none;
	width: 70px;
	height: 25px;
}

td {
	text-align: center;
}

#check-box {
	width: 50px;
}

#review-tb {
	border-collapse: collapse;
}

tr {
	border-bottom: 0.5px solid #9F9F9F;
	height: 40px;
}

#upload-btn {
	width: 60px;
	height: 24px;
	border: none;
	background: #E07370;
	border-radius: 2px;
	color: white;
	font-size: 15px;
}

#update-btn {
	width: 45px;
	height: 24px;
	border: none;
	background: #E07370;
	border-radius: 2px;
	color: white;
	font-size: 15px;
}

#delete-btn {
	width: 45px;
	height: 24px;
	border: none;
	background: #E07370;
	border-radius: 2px;
	color: white;
	font-size: 15px;
}

#search-btn {
	width: 53px;
	height: 24px;
	background: #C4C4C4;
	color:black;
	border:none;
}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div id="wrapper">
		<div id="title-box">
			<p>리뷰 게시글 관리</p>
			<br>
		</div>
		<div id="inner-wrap">
			<div id="inner-box">
					<div
		style="margin-left: auto; margin-right: auto; height: auto;"
		align="center">
		<div style="display: inline;">
			<img src="/semiproject/views/reviews/images/recommend.png" style="width: 200px;">
		</div>
		<div
			style="display: inline; font-size: 30px; margin-bottom: auto; margin-top: auto; font-family: Roboto;">강남역
			친구들과 놀기 좋은곳</div>
		<div
			style="display: inline; font-size: 13px; margin-bottom: auto; margin-top: auto; font-family: Roboto;">
			<label>작성자 : 정파덕 &nbsp;&nbsp;</label> <label
				style="margin-right: -50px;">작성일 : 2020-06-18</label> <a href=""><img
				src="/semiproject/views/reviews/images/good.png"
				style="margin-bottom: 20px; margin-right: 10px;"></a> <br> <br>
			<hr style="width: 80%;">
			<br> <br>
		</div>
	</div>
	<div
		style="margin-left: auto; margin-right: auto; padding-left: 30px;"
		align="center">
		<div style="width: 80%;">
			<div style="float: left; display: inline; padding-left: 30px;">
				<img src="/semiproject/views/reviews/images/picture1.png">
			</div>
			<div style="padding-left: 20px; padding-top: 20px; width: 700px;">
				<label style="font-size: 23px">규카츠 하우스</label><br> <br> <label>친구들이랑
					점심에 규카츠하우스에 방문했어요~ <br>얼마전 YUMEET에서 예약자 후기를 보고 너무 <br>맘에
					들어서 바로 예약하고 방문했답니다~ㅎㅎ..<br> 역시YUMEET은 실패가 없는 사이트인거같아요!! <br>어딜가던
					평균은 하는...?여기 규동맛집입니다!! <br>꼭 가서 규동 드세요!!!!<br> <br>
					<br> <br> <br> <br> <br> <br> <br>
				</label>
			</div>
			<a href=""><img src="/semiproject/views/reviews/images/boru.png"
				style="float: right; margin-top: -40px; margin-right: 120px;"></a>
		</div>
			<hr style="width: 80%;">
			<br> <br>

		<div style="width: 80%;">
			<div style="float: left; display: inline; padding-left: 30px;">
				<img src="/semiproject/views/reviews/images/picture1.png">
			</div>
			<div style="padding-left: 20px; padding-top: 20px; width: 700px;">
				<label style="font-size: 23px">규카츠 하우스</label><br> <br> <label>친구들이랑
					점심에 규카츠하우스에 방문했어요~ <br>얼마전 YUMEET에서 예약자 후기를 보고 너무 <br>맘에
					들어서 바로 예약하고 방문했답니다~ㅎㅎ..<br> 역시YUMEET은 실패가 없는 사이트인거같아요!! <br>어딜가던
					평균은 하는...?여기 규동맛집입니다!! <br>꼭 가서 규동 드세요!!!!<br> <br>
					<br> <br> <br> <br> <br> <br> <br>
				</label>
			</div>
			<a href=""><img src="/semiproject/views/reviews/images/boru.png"
				style="float: right; margin-top: -40px; margin-right: 120px;"></a>
		</div>
			<hr style="width: 80%;">
			<br> <br>

		<div style="width: 80%;">
			<div style="float: left; display: inline; padding-left: 30px;">
				<img src="/semiproject/views/reviews/images/picture1.png">
			</div>
			<div style="padding-left: 20px; padding-top: 20px; width: 700px;">
				<label style="font-size: 23px">규카츠 하우스</label><br> <br> <label>친구들이랑
					점심에 규카츠하우스에 방문했어요~ <br>얼마전 YUMEET에서 예약자 후기를 보고 너무 <br>맘에
					들어서 바로 예약하고 방문했답니다~ㅎㅎ..<br> 역시YUMEET은 실패가 없는 사이트인거같아요!! <br>어딜가던
					평균은 하는...?여기 규동맛집입니다!! <br>꼭 가서 규동 드세요!!!!<br> <br>
					<br> <br> <br> <br> <br>
				<br>
				<br>
				</label>
			</div>
			<a href=""><img src="/semiproject/views/reviews/images/boru.png"
				style="float: right; margin-top: -40px; margin-right: 120px;"></a>
		</div>
			<hr style="width: 80%;">
			<br> <br>
	</div>

	<div
		style="margin-left: auto; margin-right: auto; padding-left: 30px;"
		align="center">
		<div style="width: 80%;">
			<div
				style="margin-left: auto; margin-right: auto; padding-left: 10px; float: left;">
				<label style="font-size: 30px;">해쉬태그</label><br> <label
					style="font-size: 14px; padding-left: 100px;">#규카츠&nbsp;</label> <label
					style="font-size: 14px;">#보드게임&nbsp;</label> <label
					style="font-size: 14px;">#유키노하나&nbsp;</label>
			</div>
			<br><br>
			<br> <br>
		</div>
			<hr style="width: 80%;">
			<br>
	</div>
	
	<div
		style="margin-left: auto; margin-right: auto; padding-left: 30px;"
		align="center">
		<div style="width: 80%;">
			<div
				style="margin-left: auto; margin-right: auto; padding-left: 10px; float: left;">
				<label style="font-size: 30px; float:left; padding-left:96px;">댓글(3)</label><br><br><br>
				<table style="padding-left:130px; font-size:14px;">
					<tr>
						<td style="width:90px;"><label>dduddu123</label></td>
						<td style="width:500px;;"><label>다음주 주말에 친구들이랑 가봐야겠어요~ 추천 꾹! 누르고 갑니다~!</label></td>
						<td style="width:70px;">
						<td style="width:190px;"><label>2020-04-33</label></td>
						<td><br><br></td>
					</tr>
					<tr>
						<td style="width:90px;"><label>dduddu123</label></td>
						<td style="width:500px;;"><label>다음주 주말에 친구들이랑 가봐야겠어요~ 추천 꾹! 누르고 갑니다~!</label></td>
						<td style="width:70px;">
						<td style="width:190px;"><label>2020-04-33</label></td>
						<td><br><br></td>
					</tr>
					<tr>
						<td style="width:90px;"><label>dduddu123</label></td>
						<td style="width:500px;;"><label>다음주 주말에 친구들이랑 가봐야겠어요~ 추천 꾹! 누르고 갑니다~!</label></td>
						<td style="width:70px;">
						<td style="width:190px;"><label>2020-04-33</label></td>
						<td><br><br></td>
					</tr>
				</table>
			</div>
		</div>
			<hr style="width: 80%;">
			<br> <br>
	</div>
	<div style="background: lightgray; width:70%; height:200px; margin-left:auto; margin-right:auto;">
		<div style="padding-top:85px; padding-left:50px;display:inline; float:left ">
			<label style="padding-right:30px; height:20px;">dduddu123님</label>
		</div>
		<div style="display:inline; height:200px;">
			<textarea style="width:60%; height:100px; margin-top:50px;"></textarea>
			<button>댓글달기</button>
		</div>
	</div>
			</div>
		</div>
	</div>

</body>
</html>