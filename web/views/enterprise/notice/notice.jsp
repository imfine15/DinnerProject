<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.notice.model.vo.*"%>
<%@ page import="com.kh.semi.admin.model.vo.PageInfo" %>
<%
	ArrayList<EntNoticeVO> list = (ArrayList<EntNoticeVO>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!doctype html>
<html lang="ko">
<head>
<title>YUMEET 사장님페이지</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<style>
th, td {
	border-bottom: 1px solid gray;
}

a {
	text-decoration: none;
	color: black;
}

tr {
	height: 30px;
}

.hide {
	background-color: white;
	border: 0px;
	height: 30px;
	width: 30px;
}
</style>

</head>
<body>
	<%@include file="../sidebar/sidebar.jsp"%>
	<div id="wrapper" style="margin-left: 15%;">
	<div style="height:150px;"></div>
	<div>
		<table style="text-align: center;" align="center" id="listArea">
			<thead>
				<th style="width:50px;">번호</th>
				<th style="width:750px;">제목</th>
				<th style="width:100px;">날짜</th>
			</thead>
			<tbody align="center">
				<% 
				for (EntNoticeVO n : list) {
				%>
				<tr>
					<td><%=n.getNoticeNo() %></td>
					<td><%=n.getNoticeTitle()%></td>
					<td align="center"><%=n.getNoticeDate()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		</div>
		<div style="height:40px"></div>
			<div class="pageingArea" align="center">
			<button class="hide"
				onclick="location.href='<%=request.getContextPath()%>/selectEnt.no?currentPage=1'"><<</button>

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
			<button class="hide"
				onclick="location.href='<%=request.getContextPath()%>/selectEnt.no?currentPage=<%=p%>'"><%=p%></button>
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
			<button class="hide"
				onclick="location.href='<%=request.getContextPath()%>/selectEnt.no?currentPage=<%=currentPage + 1%>'">></button>
			<%
				}
			%>

			<button class="hide"
				onclick="location.href='<%=request.getContextPath()%>/selectEnt.no?currentPage=<%=maxPage%>'">>></button>
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
				
				location.href="<%=request.getContextPath()%>/selectOneEnter.no?num="+ num;
							});
		});
	</script>
</body>
</html>