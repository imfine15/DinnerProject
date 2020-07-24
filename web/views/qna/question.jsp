<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.semi.member.model.vo.*, com.kh.semi.common.*"%>
<% MemberVO loginUsers = (MemberVO) session.getAttribute("loginUser"); %>
<% SendMail mailing = new SendMail(); %>
<%
   String backPage = request.getContextPath() + "/views/qna/question.jsp";
   session.setAttribute("backPage", backPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	font-weight: bolder;
}

#questionContent {
	width: 890px;
	height: 300px;
	resize: none;
	margin-top: 10px;
	margin-bottom: 10px;
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
	width: 200px;
	font-size: 30px;
}

#btn-file {
	width: 90px;
	height: 35px;
	float: right;
}

#agree-div {
	display: inline-block;
	margin-right: 300px;
}

.phone-div {
	display: inline-block;
}

#agree-div2 {
	display: inline-block;
	margin-right: 280px;
}

.btn-agree {
	background-color: #666666;
	color: white;
	border: 0;
	outline: 0;
}

#uploadFiles {
	width: 770px;
	height: 200px;
	background: #f8f8f9;
	border: 1px solid #d2d2d2;
	text-align: left;
	margin-right: 0px;
	margin-top: 10px;
	margin-bottom: 10px;
	display: inline-block;
	float: left;
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 20px;
	letter-spacing :0.5px;
}

#fileDelete {
	margin-top: 10px;
	margin-left: 10px;
	width: 100px;
	font-size: 15px;
}

#fileWindow {
	border: 1px solid #d2d2d2;
	width: 770px;
	height: 30px;
	float: left;
	padding-left: 20px;
	cursor: pointer;
	margin-top: 10px;
	margin-bottom: 10px;
}

.file_input_textbox {
	float: left;
	width: 770px;
	padding-left: 20px;
	margin-right: 10px;
	height: 30px;
	margin-right: 0px;
	margin-top: 10px;
	margin-bottom: 10px;
}

.file_input_div {
	position: relative;
	width: 100px;
	height: 30px;
	overflow: hidden;
	margin: 0px;
	padding: 0px;
		cursor:pointer;
}

.file_input_button {
	width: 100px;
	background-color: white;
	color: black;
	border-style: solid;
	font-size: 15px;
	margin-top: 10px;
	margin-left: 10px;
	width: 100px;
	font-size: 15px;
	height: 30px;
	cursor:pointer;
}

.file_input_hidden {
	width:100%;
	font-size: 45px;
	position: absolute;
	right: 0px;
	top: 0px;
	opacity: 0;
	filter: alpha(opacity = 0);
	-ms-filter: "alpha(opacity=0)";
	-khtml-opacity: 0;
	-moz-opacity: 0;
}

</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
    <% if(loginUser != null) { %>  
	<div class="wrapper" align="center">
		<div>
			<p id="question-t" style="margin-top: 100px; margin-right: 850px;">문의하기</p>
		</div>
		<div>
			<form class="question-form" action="<%= request.getContextPath() %>/insert.qu" method="post" encType="multipart/form-data">
				<table style="width: 1000px">
					<tr class="td-top">
						<td class="first" style="width: 100px;">ID</td>
						<td style="width: 400px;"><%= loginUsers.getmId() %></td>
						<td style="text-align: center; width: 100px; font-weight:bolder;">고객명</td>
						<td style="width: 400px;"><%= loginUsers.getmName() %></td>
					</tr>
					<tr>
						<td class="first" style="width: 100px;" >문의 분류</td>
						<td colspan="3">
							<select style="height:30px; width:897px; font-size:16px;" name="qCategory">
								<option value="QTC1">예약 문의</option>
								<option value="QTC2">환불 및 결제 문의</option>
								<option value="QTC3">신고 및 제재 문의</option>
								<option value="QTC4">회원 문의</option>
								<option value="QTC5">잘못된 정보 신고</option>
								<option value="QTC6"selected>폐업 신고</option>
								<option value="QTC7">기타 문의</option>
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
						<td class="first" rowspan="2">첨부파일</td>
						<td style="border-top:none; border-bottom:none; border-collapse:none;" colspan="3">
								<input id="fileName" class="file_input_textbox" placeholder="10MB 이하의 파일만 업로드 가능합니다." readonly/>
							<div class="file_input_div">
							<input type="button" value="파일찾기" class="file_input_button" style="cursor:pointer;"/>
								<input type="file" class="file_input_hidden" style="cursor:pointer;" name="upFile" id="upFile" onchange="dd(this,'name')"> 
							</div>

						</td>
					</tr>
					<tr>
						<td colspan="3" >
							<div id="uploadFiles">
								
							</div>
							<input type="button" value="파일삭제" id="fileDelete" onclick="deleteFile(this.form)" style="cursor:pointer;"> 
						</td>
					</tr>
					<tr>
						<td class="first" rowspan="2">답변 <br>알림받기</td>
						<td colspan="3">
							<p style="line-height: 40px;">※ 답변 등록 시 이메일로 보내드립니다.</p> 
							<input type="radio" id="mailAdmit" value="Y" name="mailAgree"> 
							<div id="agree-div"><label style="line-height: 40px;" for="mailAdmit">
							(선택)이메일 수집 및 이용 동의</label></div><div class="phone-div">
							<button class="btn-agree" id="mail-agree"
							onclick="window.open('/semiproject/views/qna/questionDetailMail.jsp', '_blank', 'width=650px,height=550px,toolbars=no,scrollbars=no'); return false;">전문보기</button></div>
							<br><br>
							<input type="email" name="eMail"id="qMail" placeholder="이메일 주소 입력" style="width:500px; height:26px; font-size:16px;"> 
						<br>
						<br>
						</td>
					</tr>
					<tr>
						<td colspan="3">
						<p style="line-height: 40px;">※ 답변 등록 시 알림문자를 보내드립니다.</p>
						<input type="radio" id="phoneAdmit" value="Y" name="pAdmit"> 
						<div id="agree-div2"><label style="line-height: 40px;" for="phoneAdmit">
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
							<input type="text" id="qPhone" name="phone" placeholder="전화번호 입력" style="width:500px; height:26px; font-size:16px;"> 
						<br>
							<input type="hidden" name="memberNo" value="<%= loginUsers.getmNo() %>">
							<input type="hidden" name="memberName" value="<%= loginUsers.getmName() %>">
							<input type="hidden" name="memberId" value="<%= loginUsers.getmId() %>">
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
	<div style="height: 200px;"></div>
	<script>

	
	/*<button type="button"id="dd" onclick="qq();">추가</button>*/
	$("#dd").change(function(){
		console.log(123);
	})
	function qq(){
		console.log("123123");
		var input = document.createElement('input');
		
		input.setAttribute("type", "file");
		console.log(input);
		$("#uploadFiles").append(input);
	}
	
	function questionSubmit() {
		$("#question-submit").submit();
	}
	
	function questionReset() {
		$("#question-reset").reset();
	}
	</script>
	<script>
 function getCmaFileInfo(obj,stype) {
    var fileObj, pathHeader , pathMiddle, pathEnd, allFilename, fileName, extName;
    if(obj == "[object HTMLInputElement]") {
        fileObj = obj.value
    } else {
        fileObj = document.getElementById(obj).value;
    }
    if (fileObj != "") {
            pathHeader = fileObj.lastIndexOf("\\");
            pathMiddle = fileObj.lastIndexOf(".");
            pathEnd = fileObj.length;
            fileName = fileObj.substring(pathHeader+1, pathMiddle);
            extName = fileObj.substring(pathMiddle+1, pathEnd);
            allFilename = fileName+"."+extName;
 
            if(stype == "all") {
                    return allFilename; // 확장자 포함 파일명
            } else if(stype == "name") {
                    return fileName; // 순수 파일명만(확장자 제외)
            } else if(stype == "ext") {
                    return extName; // 확장자
            } else {
                    return fileName; // 순수 파일명만(확장자 제외)
            }
    } else {
            alert("파일을 선택해주세요");
            return false;
    }
    // getCmaFileView(this,'name');
    // getCmaFileView('upFile','all');
 }
 
function getCmaFileView(obj,stype) {
    var s = getCmaFileInfo(obj,stype);
    alert(s);
}
function dd(obj, stype){
	var div = document.createElement('div');
	var inputc = document.createElement('input');
	var text = document.createElement('text');
	text.innerHTML = getCmaFileInfo(obj, stype);
	inputc.setAttribute("type","checkbox");
	
	div.append(inputc);
	div.append(text);
	$("#uploadFiles").append(div);
}

$("input[type=radio]").each(function(){
    var chk = $(this).is(":checked");
    var name = $(this).attr('name');
    if(chk == true) $("input[name='"+name+"']").data("previous",$(this).val());
});

$("input[type=radio]").click(function(){
    var pre = $(this).data("previous");
    var chk = $(this).is(":checked");
    var name = $(this).attr('name');
    if(chk == true && pre == $(this).val()){

        $(this).prop('checked',false);

        $("input[name='"+name+"']").data("previous",'');
    }else{
        if(chk == true) $("input[name='"+name+"']").data("previous",$(this).val());
    }

});

</script>
	<%} else { %>
	<script>
		alert("로그인 후 이용하시길 바랍니다.");
		document.location.href="/semiproject/views/signIn/signIn.jsp";
	</script>
	
	<% } %>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>