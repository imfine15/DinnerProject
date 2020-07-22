<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.notice.model.vo.*"%>
<%@ page import="com.kh.semi.admin.model.vo.PageInfo" %>
<%
	ArrayList<AdminNoticeVO> list = (ArrayList<AdminNoticeVO>) request.getAttribute("list");
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
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#wrapper {
	width: 80%;
	height: 600px;
	margin-left: 230px;
	padding-top: 40px;
	padding-left: 30px;
}

#inner-wrap {
	background: #F9F9F9;
	width: 100%;
	margin-bottom: 10px;
	height: 50px;
	padding-left: 10px;
	padding-right: 10px;
}

table {
	border-collapse: collapse;
}

tr {
	border-bottom: 1px solid #E4E4E4;
	height: 50px;
}

.writebtn {
	background: #E07370;
	color: #FFFFFF;
	border: 0;
	outline: 0;
	width: 90px;
	height: 30px;
	font-size: 16px;
	margin-top: 20px;
	float: right;
	margin-right: 45px;
}

#goAdminNotice:link, #goAdminNotice:visited, #goAdminNotice:active,
	#goAdminNotice:hover {
	text-decoration: none;
	color: black;
	text-decoration: none;
	color: black;
	text-decoration: none;
	color: black;
	text-decoration: none;
	color: black;
}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
<div id="wrapper">
		<div id="inner-wrap">
			<h1><a id="goAdminNotice" href="<%=request.getContextPath()%>/selectAdminList.no" target = "_self">YUMEET 공지사항</a></h1><br>
		</div>
		<div align="center" style="padding-left:10px; padding-right:10px; background: white; width:100%; padding-top: 30px; height: 80%;">
			<table id="listArea">
				<tr>
					<th width="100px"></th>
					<th width="800px" align="center">제목</th>
					<th align="center" width="150px">등록날짜</th>
				</tr>
				<%
					for (AdminNoticeVO n : list) {
				%>
				<tr>
					<td align="center"><%=n.getNoticeNo() %></td>
					<td><%=n.getNoticeTitle()%></td>
					<td align="center"><%=n.getNoticeDate()%></td>
				</tr>
				<%
					}
				%>
			</table>
			<button class="writebtn" onclick="location.href='<%=request.getContextPath()%>/views/admin/notice/mainUploadNotice.jsp'">글쓰기</button>
		</div>
			<div class="pageingArea" align="center">
			<button
				onclick="location.href='<%=request.getContextPath()%>/selectAdminList.no?currentPage=1'"><<</button>

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
				onclick="location.href='<%=request.getContextPath()%>/selectElist.no?currentPage=<%=p%>'"><%=p%></button>
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
				onclick="location.href='<%=request.getContextPath()%>/selectAdminList.no?currentPage=<%=currentPage + 1%>'">></button>
			<%
				}
			%>

			<button
				onclick="location.href='<%=request.getContextPath()%>/selectAdminList.no?currentPage=<%=maxPage%>'">>></button>
	</div>
	</div>
		<script>
		$(function() {
			$("#listArea td").mouseenter(function() {
				$(this).parent().css({"background":"#E4E4E4", "cursor":"pointer"});
			}).mouseout(function() {
				$(this).parent().css({"background":"white"});
			}).click(function() {
				
				var num = $(this).parent().children().eq(0).text();
				
				location.href="<%=request.getContextPath()%>/selectOneAdmin.no?num="+ num;
							});
		});
	</script>
</body>
</html>