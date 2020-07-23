<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.semi.question.model.vo.*"%>
<%
	QuestionVO q = (QuestionVO) request.getAttribute("question");
%>

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
								<td style="font-weight:bolder;"><%=q.getQuestionTitle() %></td>
								<td style="font-weight:bolder;"><%=q.getMemberId() %></td>
								<td><%=q.getQuestionDate() %></td>
								<td><button id="confirm-before-btn"><%=q.getQuestionDisposalStatus() %></button></td>
							</tr>
							<tr>
								<td colspan="4"><hr></td>
							</tr>
							<tr>
								<td colspan="4">
								<div id="content-div">
								<p>
								<%=q.getQuestionContent() %>
								</p>
								</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div id="answer-box">
				<hr>
					<form id="answer-f">
						<table id="answer-tb">
							<tr style="height:40px;">
								<td style="width:10%;"></td>
								<td style="width:10%; font-weight:bolder;">이메일</td>
								<td style="width:35%;"><%=q.getQuestionEmail() %></td>
								<td style="width:10%; font-weight:bolder;">전화번호</td>
								<td style="width:35%;"><%=q.getQuestionPhone() %></td>
							</tr>
							<tr>
								<td style="width:10%; font-weight:bolder;">제목</td>
								<td colspan="4">
									<input type="text" name="answerT" style="width:100%; height:30px;">
								</td>
							</tr>
							<tr>
								<td style="width:10%; font-weight:bolder;">내용</td>
								<td colspan="4">
									<textarea name="answerC"style="width:100%; height:300px; margin-top:10px; resize:none;">
									
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