<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#quest-c {
	width: 150px;
	height: auto;
}

.wrapper {
	width: 100%;
	height: auto;
	font-family: 나눔스퀘어;
}

#main_t {
	font-style: normal;
	font-weight: bold;
	font-size: 36px;
	color: #DE7270;
	margin-bottom:10px;
	margin-top:15px;
}

#sub_t {
	font-style: normal;
	font-weight: normal;
	font-size: 18px;
	line-height: 21px;
	color: #000000;
	margin-top:10px;
	margin-bottom:30px;
}

#middle_box {
	width: 754px;
	height: 118px;
	background: #F5F5F5;
	border: 1px solid #C5C5C5;
	box-sizing: border-box;
	vertical-align: center;
}
#explain {
	margin-top:22px;
	font-style: normal;
	font-weight: normal;
	font-size: 16px;
	line-height: 25px;
	color: #000000;
	vertical-align:middle;
}

#question-confirm {
	background: url( "/semiproject/images/submitmb.png" ) repeat;
	border: none;
	width: 240px;
	height: 50px;
	cursor: pointer;
	font-style: normal;
	font-weight: normal;
	font-size: 22px;
	font-family: 나눔스퀘어라운드;
	color: #FFFFFF;
	margin-right: 30px;
	text-align: center;
}

#back {
	background: url( "/semiproject/images/resetb.png" ) no-repeat;
	border: none;
	width: 200px;
	height: 50px;
	cursor: pointer;
	font-style: normal;
	font-weight: normal;
	font-size: 22px;
	font-family: 나눔스퀘어라운드;
	color: #FFFFFF;
	margin-left: 30px;
	text-align: center;
}

#fooooter {
	height: 200px;
}

footer {
	clear: both;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div style="height: 150px;"></div>

	<!-- content div start -->
	<div class="wrapper" align="center">
		<img src="/semiproject/images/questionComplete.png" id="quest-c">
		<p id="main_t">1:1 문의 접수가 완료 되었습니다.</p>
		<p id="sub_t">고객님께서 문의하신 내용이 정상 접수 되었습니다.</p>
		<div id="middle_box">
			<div id="inner_box">
				<p id="explain">
					접수하신 문의 사항은 최대 48시간 이내에 처리되며, 경우에 따라 다소 지연될 수도 있음을 미리 알려드립니다.<br>
					1:1 문의 처리에 대한 내용은 이메일 및 문의 내역을 통해 확인하실 수 있습니다. 또한 질문 유형에 따라 본인 <br>
					확인이 추가로 진행될 수 있으니 처리 상태를 확인해 주시기 바랍니다. 감사합니다.
				</p>
			</div>
		</div>
		<div style="height: 50px;"></div>
		<div class="btnArea">
			<button id="question-confirm">문의 내역 확인하기</button>
			<button id="back">돌아가기</button>
		</div>
	</div>
	<!-- content div end -->


	<div id="fooooter"></div>
	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
</body>
</html>