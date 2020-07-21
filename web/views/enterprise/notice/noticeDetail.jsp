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
		<form>
		<table style="text-align: center;" align="center" id="listArea">
			
		</table>
		</form>
		</div>
</body>
</html>