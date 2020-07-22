<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.semi.question.model.vo.*"%>
<%@ page import="com.kh.semi.admin.model.vo.PageInfo" %>
<%
	ArrayList<QuestionVO> list = (ArrayList<QuestionVO>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET 관리자페이지</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	height: 700px;
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

#review-tb {
	border-collapse: collapse;
}

tr {
	border-bottom: 0.5px solid #9F9F9F;
	height: 40px;
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

#confirm-after-btn {
	width: 80px;
	height: 25px;
	border: none;
	background: #C4C4C4;
	border-radius: 2px;
	color: black;
	font-size: 15px;
}

#search-btn {
	width: 53px;
	height: 24px;
	background: #C4C4C4;
	color: black;
	border: none;
}

select{
border-radius: 0;
border: 1px solid gray;
outline-style: none;
}
input{
border-radius: 0;
border: 1px solid gray;
outline-style: none;
}

#goQuestionConfirm:link, #goQuestionConfirm:visited, #goQuestionConfirm:active, #goQuestionConfirm:hover {
	text-decoration:none; color:black;
	text-decoration:none; color:black;
	text-decoration:none; color:black;
	text-decoration:none; color:black;
}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div id="wrapper">
		<div id="title-box">
			<p><a id="goQuestionConfirm" href="<%=request.getContextPath()%>/selectQuestionList.qu" target = "_self">문의 관리</a></p>
			<br>
		</div>
		<div id="inner-wrap">
			<div id="inner-box">
				<div style="height: 30px;"></div>
				<form>
					<table id="review-tb" style="width: 100%;" >
						<tr>
							<th>글번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>회원 ID</th>
							<th>등록 날짜</th>
							<th>처리 상태</th>
						</tr>
					<%
					for (QuestionVO q : list) {
					%>
					<tr>
						<td align="center"><%=q.getQuestionNo() %></td>
						<td align="center"><%=q.getQuestionType() %></td>
						<td><%=q.getQuestionTitle() %></td>
						<td align="center"><%=q.getMemberId() %></td>
						<td align="center"><%=q.getQuestionDate() %></td>
						<td align="center"><% if(q.getQuestionDisposalStatus().equals("QDSC1")) {%> 
													미확인
										   <% } else if(q.getQuestionDisposalStatus().equals("QDSC2")){ %>	
										   			처리대기	
										   <% } else { %>		
													처리완료
										   <% } %>			
												</td>
					</tr>
					<%
						}
					%>
					</table>
				</form>
				<div style="height: 30px;"></div>
				<div id="search-box" align="center">
					<form>
						<table>
							<tr>
								<td><select style="height:25px; font-size:14px;">
										<option>제목</option>
										<option>회원 ID</option>
										<option>처리 상태</option>
										<option>카테고리</option>
								</select>&nbsp;&nbsp;&nbsp;</td>
								<td><input style="height:25px;" type="search" size="25"></td>
								<td>
									&nbsp;&nbsp;&nbsp;<button id="search-btn">검색</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		</div>
			<div class="pageingArea" align="center">
			<button
				onclick="location.href='<%=request.getContextPath()%>/selectQuestionList.qu?currentPage=1'"><<</button>

			<%
				if (currentPage <= 1) {
			%>
			<button disabled><</button>
			<%
				}
			%>

			<%
				for (int p = startPage; p <= endPage; p++) {
					if (p == currentPage) {
			%>
			<button disabled><%=p%></button>
			<%
				} else {
			%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/selectQuestionList.qu?currentPage=<%=p%>'"><%=p%></button>
			<%
				}
				}
			%>

			<%
				if (currentPage >= maxPage) {
			%>
			<button disabled>></button>
			<%
				} else {
			%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/selectQuestionList.qu?currentPage=<%=currentPage + 1%>'">></button>
			<%
				}
			%>

			<button
				onclick="location.href='<%=request.getContextPath()%>/selectQuestionList.qu?currentPage=<%=maxPage%>'">>></button>
	</div>
	<script>
		$(function() {
			$("#review-tb td").mouseenter(function() {
				$(this).parent().css({"background":"#E4E4E4", "cursor":"pointer"});
			}).mouseout(function() {
				$(this).parent().css({"background":"white"});
			}).click(function() {
				
				var num = $(this).parent().children().eq(0).text();
				
				location.href="<%=request.getContextPath()%>/selectOne.qu?num="+ num;
							});
		});
	</script>
</body>
</html>