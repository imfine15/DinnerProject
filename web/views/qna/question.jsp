<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   String backPage = request.getContextPath() + "/views/upload/foodUpload.jsp";
   session.setAttribute("backPage", backPage);
%>
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

#questionContent {
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
	width:100px;/*width, height 값은 button(찾아보기)값과 같아야함 */
	height:30px;
	padding-left:3px;
}
div.upload-btn_wrap button {/*버튼 div*/
	width:100px;
	height:30px;
	font-weight:bold;
	background:#333;
	border:1px solid #333;
	color:#fff;
	text-align:center;
}
.file_input_textbox
{
float: left
}
 
.file_input_div
{
position: relative;
width: 100px;
height: 23px;
overflow: hidden;
}
 
.file_input_button
{
width: 100px;
position: absolute;
top: 0px;
background-color: #33BB00;
color: #FFFFFF;
border-style: solid;
}
 
.file_input_hidden
{
font-size: 45px;
position: absolute;
right: 0px;
top: 0px;
opacity: 0;
 
filter: alpha(opacity=0);
-ms-filter: "alpha(opacity=0)";
-khtml-opacity: 0;
-moz-opacity: 0;
}
 
/* 파일찾아보기 */
.wrap{width:260px; position:relative; margin-top:5px;}/* file_wrap의 위치를 임의로 감싸줌 */
.file_text{float:right; width:180px; height:16px; background-color:#f6f6f6; border:1px #eee; color:#777;}
/* 파일첨부했을 경우 경로가 나오는 input type="text" */
.file_wrap {display:inline-block; widht:64px; height:22px; background:url(../img/btn/btn_fileset.gif) 0 0 no-repeat; position:absolute; top:0; left:0;}
/* display:inline-block으로 변경 버튼이미지를 배경이미지로 삽입, 전체 사이즈는 버튼 이미지 사이즈와 동일 위치 절대값 top:0; right0; 또는 top:0; left:input text 박스 크기 및 +여백만큼 */
.file_add { filter:alpha(opacity:0); opacity:0; width:64px; height:22px;}
/* input type="file" 투명도를 0으로 만들기. 사이즈는 버튼 이미지 사이즈와 동일하게 */

.file_wrap_btn_del01 { position:relative; top:0; left:264px; }
.file_wrap_btn_del03 { position:absolute; top:0; left:308px; }
/* 파일삭제버튼 따로 span에 버튼 지정후에 위치지정을 따로함 */

/* 구비서류(첨부파일) 수정 */
.file_set{ line-height:18px; padding-top:5px; padding-bottom:5px;}
/* 구비서류(첨부파일) 선택영역 */
.box_type03 {margin-bottom:5px; padding:13px 13px 13px;background:#f8f8f9; border:1px solid #d2d2d2; text-align:left;}

.box_file_wrap{ position:relative; margin:0; padding:0; }
.file_wrap_btn_del02 { position:absolute; top:27px; left:412px; }
/* 파일삭제버튼 따로 span에 버튼 지정후에 위치지정을 따로함 */
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
<!-- <% //if(loginUser != null) { %>  -->	
	<div class="wrapper" align="center">
		<div>
			<p id="question-t" style="margin-top: 100px; margin-right: 850px;">문의하기</p>
		</div>
		<div>
			<form class="question-form" action="<%= request.getContextPath() %>/insert.qu" method="post" encType="multipart/form-data">
				<table style="width: 1000px">
					<tr class="td-top">
						<td class="first" style="width: 100px;">ID</td>
						<td style="width: 400px;">겟로그인유저아이디</td>
						<td style="text-align: center; width: 100px; font-weight:bolder;">고객명</td>
						<td style="width: 400px;">겟로그인유저네임</td>
					</tr>
					<tr>
						<td class="first" style="width: 100px;">문의 분류</td>
						<td colspan="3">
							<select style="height:30px; width:897px; font-size:16px;" name="qCategory">
								<option value="QTC1">예약 문의</option>
								<option value="QTC2">환불 및 결제 문의</option>
								<option value="QTC3">신고 및 제재 문의</option>
								<option value="QTC4">기타 문의</option>
								<option value="QTC5">회원 문의</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="first">제목</td>
						<td colspan="3"><input type="text" style="width:890px; height:26px;" name="qTitle" id="questionTitle">
						</td>
					</tr>
					<tr>
						<td class="first">내용</td>
						<td colspan="3"><textarea name="qContent" id="questionContent"></textarea></td>
					</tr>
					<tr>
						<td class="first">첨부파일</td>
						<td colspan="3">
						<!-- 
						<div id="file-div">
						<input type="text" class="upload_text" readonly="readonly"
												style="width:750px; height:26px;">
							<div class="upload-btn_wrap" style="margin-left:20px;">
								<input type="file" class="input_file" title="파일찾기">
								<button type="button" title="파일찾기" id="btn-file">
									<div align="center">파일찾기</div>
								</button>
							</div>
						  </div>
						  -->

<input type="text" id="fileName" class="file_input_textbox" readonly="readonly">
 
<div class="file_input_div">
<input type="button" value="Search files" class="file_input_button" />
<input type="file" class="file_input_hidden" onchange="javascript: document.getElementById('fileName').value = this.value" />
</div>


							<div class="box_file_wrap">
								<!-- 파일찾기영역 -->
								<p class="wrap">
									<span class="file_wrap" title="첨부파일 찾아보기"> <input
										type="file" class="file_add"
										onchange="javascript:document.getElementById('file_route').value=this.value" />
									</span>
									<!-- text 박스에 value="10MB를 넘을 수 없습니다." 라고 입력하면, value 값이 보여짐. 첨부파일이 첨부되면 문구는 없어집니다. -->
									<input type="text" id="file_route" class="file_text"
										readonly="readonly" title="첨부된 파일경로" value="10MB를 넘을 수 없습니다." />
								</p>
								<span class="t_btn07 file_wrap_btn_del01"><a href="#">삭제</a></span>
								<span class="t_btn06 file_wrap_btn_del03"><a href="#">등록</a></span>
								<!-- //파일찾기영역 -->
								<!-- 지정된 파일 선택 영역 -->
								<div class="file_set box_type03 mgt5" style="width: 380px;"
									tabindex="0">
									<ul>
										<li><label><input type="checkbox" name="ch1"
												title="파일명" /> 파일명.xls</label></li>
										<li><label><input type="checkbox" name="ch1"
												title="파일명" /> 파일명.hwp</label></li>
										<li><label><input type="checkbox" name="ch1"
												title="파일명" /> 파일명.pdf</label></li>
										<li><label><input type="checkbox" name="ch1"
												title="파일명" /> 파워포인트파일.ppt</label></li>
									</ul>
								</div>
								<span class="t_btn07 file_wrap_btn_del02"><a href="#">삭제</a></span>
								<!-- //지정된 파일 선택 영역 -->
							</div>


						</td>
					</tr>
					<tr>
						<td class="first" rowspan="2">답변 <br>알림받기</td>
						<td colspan="3">
							<p style="line-height: 40px;">※ 답변 등록 시 이메일로 보내드립니다.</p> 
							<input type="checkbox" id="mailAdmit"> 
							<div id="agree-div"><label style="line-height: 40px;">
							(선택)이메일 수집 및 이용 동의</label></div><div class="phone-div">
							<button class="btn-agree" id="mail-agree"
							onclick="window.open('/semiproject/views/qna/questionDetailMail.jsp', '_blank', 'width=650px,height=550px,toolbars=no,scrollbars=no'); return false;">전문보기</button></div>
							<br><br>
							<input type="email" id="qMail" placeholder="이메일 주소 입력" style="width:500px; height:26px; font-size:16px;"> 
						<br>
						<br>
						</td>
					</tr>
					<tr>
						<td colspan="3">
						<p style="line-height: 40px;">※ 답변 등록 시 알림문자를 보내드립니다.</p>
						<input type="checkbox" id="phoneAdmit"> 
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
							<input type="text" id="qPhone" placeholder="전화번호 입력" style="width:500px; height:26px; font-size:16px;"> 
						<br>

						<br>
						</td>
					</tr>
				</table>
				<div id="btnArea">
					<button type="submit" id="question-submit" onclick="questionSubmit">접수</button>
					<button type="reset" id="question-reset" onclick="questionReset">취소</button>
				</div>
			</form>
		</div>
	</div>
	<!--<% // } >else { 
	//	request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
	//	request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	//{ %>  -->	
	<div style="height: 200px;"></div>
	<script>
	function questionSubmit() {
		$("#question-submit").submit();
	}
	
	function questionReset() {
		$("#question-reset").reset();
	}
	
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