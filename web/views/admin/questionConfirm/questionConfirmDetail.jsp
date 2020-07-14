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
<!-- 답변등록 버튼 누르면 제목과 내용 readonly로 바꾸고 폼 제출하고 textarea 없애는걸로 바꾸기 -->
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
	width: 90%;
	height: 90%;
}

#inner-wrap {
	padding-left: 50px;
	padding-right: 50px;
	background: white;
	width: 95%;
}

#confirm-before-btn {
	width: 80px;
	height: 25px;
	border: none;
	background: #E07370;
	border-radius: 2px;
	color: white;
	font-size: 15px;
}

#body-table {
	width: 100%;
}

#content-div {
	line-height: 30px;
}

#answer-box {
	
}

#answer-tb {
	border-collapse: collapse;
	width: 100%;
	text-align: center;
}

#an-top {
	border-top: 0.5px solid #9F9F9F;
}

#ans-btn {
	width: 110px;
	height: 30px;
	background: #E07370;
	font-size: 18px;
	color: #FFFBFB;
	border:none;
}
input{
border-radius: 0;
border: 1px solid gray;
outline-style: none;
}
textarea{
border-radius: 0;
border: 1px solid gray;
outline-style: none;
}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div id="wrapper">
		<div id="title-box">
			<p>문의 관리</p>
			<br>
		</div>
		<div id="inner-wrap">
			<div id="inner-box">
				<div style="height: 50px;"></div>
				<div id="body-form">
					<form>
						<table id="body-table">
							<tr>
								<td style="font-weight:bolder;">회원탈퇴 시 적립포인트는 어떻게 처리 되나요?</td>
								<td style="font-weight:bolder;">IMFINE_123</td>
								<td>20/06/17 17:33</td>
								<td><button id="confirm-before-btn">처리 대기</button></td>
							</tr>
							<tr>
								<td colspan="4"><hr></td>
							</tr>
							<tr>
								<td colspan="4">
								<div id="content-div">
								<p>
								안녕하세요<br>
								회원 탈퇴 후 기존에 적립됐던 포인트의 처리가 어떻게 되는지 궁금하여 문의 글 남깁니다.<br>
								쌓여있는 포인트가 꽤 되는데 사이트에서는 탈퇴를 하고 싶어서 <br>
								다른 방법으로 환급을 받을 수 있는지 궁금해서요.</p>
								</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div id="answer-box">
				<hr>
					<form>
						<table id="answer-tb">
							<tr style="height:40px;">
								<td style="width:10%;"></td>
								<td style="width:10%; font-weight:bolder;">이메일</td>
								<td style="width:35%;">imfine123@gmail.com</td>
								<td style="width:10%; font-weight:bolder;">전화번호</td>
								<td style="width:35%;">010-8888-7777</td>
							</tr>
							<tr>
								<td style="width:10%; font-weight:bolder;">제목</td>
								<td colspan="4">
									<input type="text" style="width:100%; height:30px;">
								</td>
							</tr>
							<tr>
								<td style="width:10%; font-weight:bolder;">내용</td>
								<td colspan="4">
									<textarea style="width:100%; height:300px; margin-top:10px; resize:none;">
									
									</textarea>
								</td>
							</tr>
						</table>
						<div style="height:30px;"></div>
						<div id="btnArea" align="center">
							<button id="ans-btn" type="submit">답변등록</button>
						</div>
					</form>
				</div>
						<div style="height:30px;"></div>
			</div>
		</div>
	</div>
</body>
</html>