<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script async src="//jsfiddle.net/mLjyupjh/1/embed/"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet" />
   <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <!-- select2 javascript cdn -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
<style>
.wrapper {
	height: auto;
	font-family: 나눔스퀘어;
}

#question-t {
	font-family: -윤고딕320;
	font-weight: lighter;
	font-size: 40px;
	color: #000000;
}

tr {
	height: 50px;
}

.first {
	text-align: center;
	font-weight:bolder;
}

#content {
	width: 890px;
	height: 300px;
	resize: none;
	margin-top:10px;
	margin-bottom:10px;
}

.question-form {
	font-size: 16px;
	margin-top: 50px;
}

#question-submit {
	background: url("/semiproject/images/submitmb.png");
	border: none;
	width: 180px;
	height: 50px;
	cursor: pointer;
	font-style: normal;
	font-weight: normal;
	font-size: 22px;
	font-family: 나눔스퀘어라운드;
	color: #FFFFFF;
	margin-right: 30px;
}

#question-reset {
	background: url("/semiproject/images/resetb.png");
	border: none;
	width: 180px;
	height: 50px;
	cursor: pointer;
	font-style: normal;
	font-weight: normal;
	font-size: 22px;
	font-family: 나눔스퀘어라운드;
	color: #FFFFFF;
	margin-left: 30px;
}

table {
	border-collapse: collapse;
}
input {
border-radius: 0;
border: 1px solid gray;
outline-style: none;
}
textarea {
border-radius: 0;
border: 1px solid gray;
outline-style: none;
}
select {
border-radius: 0;
border: 1px solid gray;
outline-style: none;
}
tr {
	border-bottom: 1px solid #9F9F9F;
	border-top: 0.5px solid #343434;
}

#btnArea {
	margin-top: 30px;
}
#mail-choice {
	width:200px;
	font-size:30px;
}
#btn-file {
	width: 150px;
	float:right;
}

#agree-div {
	display:inline-block; 
	margin-right:300px;
}
.phone-div {
	display:inline-block;
}
#agree-div2 {
	display:inline-block; 
	margin-right:280px;
}
.btn-agree {
	background-color:#666666;
	color:white;
	border:0;
	outline:0;
}
#file-div {
	font-size: 12px;
	font-family: dotum, '돋움';
}

input.upload_text {/*읽기전용 인풋텍스트*/
	float:left;
	width:100%;/* 버튼 포함 전체 가로 길이*/
	height:19px;
	line-height:19px;
	padding:0 3px;
	border:1px solid #bbb;
}

div.upload-btn_wrap input.input_file {/*파일찾기 폼 투명하게*/
	position:absolute;
	top:0;
	right:0;
	cursor:pointer;
	opacity:0;
	filter:alpha(opacity=0);
	-ms-filter:"alpha(opacity=0)";
	-moz-opacity:0;
}
div.upload-btn_wrap {/*버튼테두리 감싼 div*/
	overflow:hidden;
	position:relative;
	float:left;
	width:70px;/*width, height 값은 button(찾아보기)값과 같아야함 */
	height:21px;
	padding-left:3px;
}
div.upload-btn_wrap button {/*버튼 div*/
	width:70px;
	height:21px;
	font-weight:bold;
	background:#333;
	border:1px solid #333;
	color:#fff;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="wrapper" align="center">
		<div>
			<p id="question-t" style="margin-top: 100px; margin-right: 850px;">문의하기</p>
		</div>
		<div>
			<form class="question-for m">
				<table style="width: 1000px">
					<tr class="td-top">
						<td class="first" style="width: 100px;">ID</td>
						<td style="width: 400px;"></td>
						<td style="text-align: center; width: 100px; font-weight:bolder;">고객명</td>
						<td style="width: 400px;"></td>
					</tr>
					<tr>
						<td class="first" style="width: 100px;">문의 분류</td>
						<td colspan="3"><select style="height:30px; width:897px; font-size:16px;">
								<option>예약 문의</option>
								<option>환불 및 결제 문의</option>
								<option>신고 및 제재 문의</option>
								<option>기타 문의</option>
								<option>회원 문의</option>
						</select></td>
					</tr>
					<tr>
						<td class="first">제목</td>
						<td colspan="3"><input type="text" style="width:890px; height:26px;" id="">
						</td>
					</tr>
					<tr>
						<td class="first">내용</td>
						<td colspan="3"><textarea id="content"></textarea></td>
					</tr>
					<tr>
						<td class="first">첨부파일</td>
						<td colspan="3">
						<div id="file-div">
						<input type="text" class="upload_text" readonly="readonly"
												style="width:700px; height:26px;">
							<div class="upload-btn_wrap">
								<button type="button" title="파일찾기" id="btn-file">
									<div>파일찾기</div>
								</button>
								<input type="file" class="input_file" title="파일찾기">
							</div>
						  </div>
						</td>
					</tr>
					<tr>
						<td class="first" rowspan="2">답변 <br>알림받기</td>
						<td colspan="3">
							<p style="line-height: 40px;">※ 답변 등록 시 이메일로 보내드립니다.</p> 
							<input type="checkbox" id=""> 
							<div id="agree-div"><label style="line-height: 40px;">
							(선택)이메일 수집 및 이용 동의</label></div><div class="phone-div">
							<button class="btn-agree" id="mail-agree"
							onclick="window.open('/semiproject/views/qna/questionDetailMail.jsp', '_blank', 'width=650px,height=550px,toolbars=no,scrollbars=no'); return false;">전문보기</button></div>
							<br><br>
							<input type="email" placeholder="이메일 주소 입력" style="width:500px; height:26px; font-size:16px;"> 
						<br>
						<br>
						</td>
					</tr>
					<tr>
						<td colspan="3">
						<p style="line-height: 40px;">※ 답변 등록 시 알림문자를 보내드립니다.</p>
						<input type="checkbox" id=""> 
						<div id="agree-div2"><label style="line-height: 40px;">
						(선택)휴대폰번호 수집 및 이용 동의&nbsp;( -(하이픈) 을 제외하고 입력해주세요.)<br>
						
						</label></div><div class="phone-div">
						
						<!--
						window.open('', '', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
						
var popupX = (window.screen.width / 2) - (popupWidth / 2);
// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

var popupY= (window.screen.height / 2) - (popupHeight / 2);
						!-->
						<button class="btn-agree" id="phone-agree" 
						onclick="window.open('/semiproject/views/qna/questionDetail.jsp', '_blank', 'width=650px,height=550px,toolbars=no,scrollbars=no'); return false;">전문보기</button></div>
						<br> <br>
							<input type="text" placeholder="전화번호 입력" style="width:500px; height:26px; font-size:16px;"> 
						<br>

						<br>
						</td>
					</tr>
				</table>
				<div id="btnArea">
					<button type="submit" id="question-submit">접수</button>
					<button type="reset" id="question-reset">취소</button>
				</div>
			</form>
		</div>
	</div>
	<div style="height: 200px;"></div>
	<script>
	$("#mail-choice").select2({
	    placeholder: "선택하세요"
	});

	$(function(){
		$('.upload_text').val('');
		$('.input_file').change(function(){
			var i = $(this).val();
			$('.upload_text').val(i);
		});
	});
	
	</script>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>


