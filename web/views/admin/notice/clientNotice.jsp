<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.notice.model.vo.*"%>
<%@ page import="com.kh.semi.admin.model.vo.PageInfo" %>
<%
	ArrayList<NoticeVO> list = (ArrayList<NoticeVO>) request.getAttribute("list");
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
	table{
		border-collapse: collapse;
	}
	tr{
		border-bottom: 1px solid #E4E4E4;
		height:50px;
	}
	
	.writebtn{
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
#goNotice:link,#goNotice:visited, #goNotice:active, #goNotice:hover {
	text-decoration:none; color:black;
	text-decoration:none; color:black;
	text-decoration:none; color:black;
	text-decoration:none; color:black;
}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div style="width:80%; height:600px;margin-left: 230px; padding-top:40px; padding-left:30px;">
		<div style="background: #F9F9F9;width: 100%; margin-bottom: 10px; height:50px; padding-left:10px; padding-right:10px;">
			<h1><a id="goNotice"href="<%=request.getContextPath()%>/selectclist.no" target = "_self">고객 공지사항</a></h1><br>
		</div>
		<div align="center" style="padding-left:10px; padding-right:10px; background: white; width:100%; padding-top: 30px; height: 80%;">
			<table id="listArea">
				<tr>
					<th width="100px"></th>
					<th width="800px" align="center">제목</th>
					<th align="center" width="150px">등록날짜</th>
				</tr>
				<%
					for (NoticeVO n : list) {
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
			<button class="writebtn" onclick="location.href='<%=request.getContextPath()%>/views/admin/notice/clientUploadNotice.jsp'">글쓰기</button>
		</div>
			<div class="pageingArea" align="center">
			<button
				onclick="location.href='<%=request.getContextPath()%>/selectclist.no?currentPage=1'"><<</button>

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
				onclick="location.href='<%=request.getContextPath()%>/selectclist.no?currentPage=<%=p%>'"><%=p%></button>
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
				onclick="location.href='<%=request.getContextPath()%>/selectclist.no?currentPage=<%=currentPage + 1%>'">></button>
			<%
				}
			%>

			<button
				onclick="location.href='<%=request.getContextPath()%>/selectclist.no?currentPage=<%=maxPage%>'">>></button>


			<!-- table area end -->
			<!--  search area start -->
<%-- 			<div class="searchArea" align="center">
				<select id="searchCondition" name="searchCondition">
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select> <input type="search">
				<button type="submit">검색하기</button>
				<% if (loginUser != null && loginUser.getUserId().equals("admin")) { %>
				<button onclick="location.href='<%=request.getContextPath()%>/views/notice/noticeInsertForm.jsp'">작성하기</button>
				<% } %>
			</div> --%>
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
				
				location.href="<%=request.getContextPath()%>/clientSelectOne.no?num="+ num;
							});
		});
	</script>
</body>
</html>