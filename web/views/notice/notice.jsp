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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

.outer {
	width: 1100px;
	height: 90%;
	margin:150px;
	
	overflow:hidden;
}

.toggle {
	margin-left: 740px;
	float: right;
	margin-right: 30px;
}

dt.on .toggle {
	transform: rotate(180deg);
}

dt, dd {
	padding: 10px;
	width:100%;
}

dt {
	background-color: #ffffff;
	border-bottom: 0.5px solid #E9E9E9;
}

dd {
	background-color: #E9E9E9;
	margin-bottom: 5px;
	display: none;
}

a {
	font-size: 12px;
	color: #B9B9B9;
}

#name {
	color: #DE7270;
	font-size: 36px;
	text-align:left;
	margin-left:
}

input {
	border-radius: 0;
	border: 1px solid gray;
	outline-style: none;
	vertical-align: top;
	height: 20px;
}

select {
	border-radius: 0;
	border: 1px solid gray;
	outline-style: none;
	height: 20px;
}

button {
	background: #DDDDDD;
	color: #000000;
	border: 0;
	outline: 0;
	width: 80px;
	height: 20px;
	font-size: 14px;
	vertical-align: top;
}

.searchArea {
	margin-top: 30px;
}

#noticeList {
	width: 70%;
}

#date {

}
</style>
<title>YUMEET</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>

	<div class="outer">
	<p id="name">공지사항</p>
		
	<br><br><br>
	<div id="noticeList" style="width:100%;">
		<dl>
		<% 
		for (NoticeVO n : list) {
		%>
		    <dt><%=n.getNoticeTitle() %><span><img src="/semiproject/images/toggle.png" class="toggle">
		    	<br><a id="date"><%=n.getNoticeDate() %></a></span></dt>
		    <dd><%=n.getNoticeContent() %></dd>
		<% } %>
		</dl>
		</div>
		<div style="height:100px;"></div>
	</div>
	

	
	<script>
	$('dt').on('click', function () {

	    if ($(this).hasClass('on')) {
	        slideUp();
	    } else {
	        slideUp();
	        $(this).addClass('on').next().slideDown();
	    }
	    function slideUp() {
	        $('dt').removeClass('on').next().slideUp();
	    };
	})
	</script>

	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>