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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	width: 80%;
	height: auto;
	margin-left: 230px;
	padding-top: 30px;
	padding-left: 30px;
}

#title-box {
	font-family: Noto Sans KR;
	font-size: 30px;
	font-weight: bolder;
	background: #F9F9F9;
	width: 100%;
	margin-bottom: 10px;
	height: 50px;
	padding-left: 10px;
	padding-right: 10px;
}

#inner-box {
	width: 100%;
	height: 700px;
}

#inner-wrap {
	padding-left: 10px;
	padding-right: 10px;
	background: white;
	width: 100%;
	padding-top: 30px;
	height: 80%;
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
	width: 90%;
}

#content-div {
	line-height: 30px;
}

#answer-box {
	width:85%;
	float:right;
	margin-right:60px;
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
	border: none;
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
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div id="wrapper">
		<div id="title-box">
			<p>문의 관리</p>
		</div>
		<div id="inner-wrap">
			<div id="inner-box">				
				<div id="body-form" align="center">
					<form action="<%= request.getContextPath() %>/send.qu" method="post">
						<table id="body-table">
							<tr>
								<td style="width:50%;font-weight: bolder;"><p style="margin-left:20px;"><%=q.getQuestionTitle()%></p></td>
								<td style="width:25%;font-weight: bolder;"><%=q.getMemberId()%></td>
								<td style="width:15%;"><%=q.getQuestionDate()%></td>
								<td style="width:10%;"><button id="confirm-before-btn" type="Button" >
										<%
											if (q.getQuestionDisposalStatus().equals("QDSC1")) {
										%>
										미확인
										<%
											} else if (q.getQuestionDisposalStatus().equals("QDSC2")) {
										%>
										처리대기
										<%
											} else if (q.getQuestionDisposalStatus().equals("QDSC3")){
										%>
										처리완료
										<%
											}
										%>
									</button></td>
							</tr>
							<tr>
								<td colspan="4" style="width:100%;"><hr></td>
							</tr>
							<tr>
								<td colspan="4">
								<div id="content-div">
								<p style="margin-left:20px;">
								<%=q.getQuestionContent() %>
								</p>
								</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div style="height:50px;"></div>
				<div id="answer-box" style="display:inline-block;">
				<img src="/semiproject/images/next.png" style="width:40px;display:inline-block;"> <hr style="display:inline-block;width:95%; color:gray;">
					<form id="answer-f" action="<%= request.getContextPath() %>/answer.qu" method="post">
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
								<% if(q.getQuestionDisposalStatus().equals("QDSC1")) { %>
									<input type="text" name="answerT" style="width:100%; height:30px;">
								<% } else if(q.getQuestionDisposalStatus().equals("QDSC3")) { %>
									<p>답변이 완료된 글입니다.</p>
								</td>
								<% } %>
							</tr>
							<tr>
								<td style="width:10%; font-weight:bolder;">내용</td>
								<td colspan="4">
								<% if(q.getQuestionDisposalStatus().equals("QDSC1")) { %>
									<textarea name="answerC"style="width:100%; height:300px; margin-top:10px; resize:none;">
									</textarea>
								<% } else if(q.getQuestionDisposalStatus().equals("QDSC3")) { %>
									<p>답변이 완료된 글입니다.</p>
								<% } %>			
								</td>
							</tr>
						</table>
						<div style="height:30px;">
						<input type="hidden" name="qNo" value="<%=q.getQuestionNo()%>">
						<input type="hidden" name="mNo" value="<%=q.getMemberNo()%>">
						<input type="hidden" name="mId" value="<%=q.getMemberId()%>">
						<input type="hidden" name="mail" value="<%=q.getQuestionEmail() %>">
						</div>
						<div id="btnArea" align="center">
							<% if(q.getQuestionDisposalStatus().equals("QDSC1")) { 
							%><button id="ans-btn">답변등록</button>
							<% } else { %>
							<button id="ans-btn" disabled style="background-color:gray">답변등록</button>
							<% } %>
						</div>
					</form>
				</div>
				<div style="height:30px;"></div>
			</div>
		</div>
	</div>
	<script>
		
	</script>
</body>
</html>



