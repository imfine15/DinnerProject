<%@page import="com.kh.semi.admin.model.vo.PageInfo"%>
<%@page import="com.kh.semi.board.model.vo.BoardUpVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<BoardUpVo> list = (ArrayList<BoardUpVo>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

#check-box {
	width: 50px;
}

#review-tb {
	border-collapse: collapse;
}

tr {
	border-bottom: 0.5px solid #9F9F9F;
	height: 40px;
}

#upload-btn {
	width: 60px;
	height: 24px;
	border: none;
	background: #E07370;
	border-radius: 2px;
	color: white;
	font-size: 15px;
}

#update-btn {
	width: 45px;
	height: 24px;
	border: none;
	background: gray;
	border-radius: 2px;
	color: white;
	font-size: 15px;
}

#delete-btn {
	width: 45px;
	height: 24px;
	border: none;
	background: red;
	border-radius: 2px;
	color: white;
	font-size: 15px;
}

#search-btn {
	width: 53px;
	height: 24px;
	background: #C4C4C4;
	color:black;
	border:none;
}
.hide{
		border: 0;
		outline: 0;
		background: white;
		vertical-align: middle;
	}
		.pagingArea{
		margin-top: 50px;
	}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div id="wrapper">
		<div id="title-box">
			<p>게시글 관리</p>
			<br>
		</div>
		<div id="inner-wrap">
			<div id="inner-box">
				<div style="height: 30px;"></div>
				<form>
					<table id="review-tb" style="width: 100%;">
						<tr>
							<th id="check-box"></th>
							<th>제목</th>
							<th>회원 ID</th>
							<th>등록 날짜</th>
							<th>관리</th>
						</tr>
						<% for(BoardUpVo b : list) {%>
						<tr>
							<td id="check-box"><input type="checkbox"></td>
							<td><%=b.getBoardTitle() %></td>
							<td><%=b.getMemberId() %></td>
							<td><%=b.getUploadDate() %></td>
							<td>
								<button type="button" id="upload-btn" onclick="location.href='<%=request.getContextPath()%>/selectOneBoard.up?no=<%= b.getBoardNo()%>'">업로드</button>
								<button id="delete-btn">삭제</button>
							</td>
						</tr>
						<%} %>
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
										<option>등록 날짜</option>
								</select>&nbsp;&nbsp;&nbsp;</td>
								<td><input style="height:25px;" type="search" size="25"></td>
								<td>
									&nbsp;&nbsp;&nbsp;<button id="search-btn">검색</button>
								</td>
							</tr>
						</table>
						
					</form>
				</div>
							<!-- 페이징처리 -->
			<div class="pagingArea" align="center" style="background: white;">
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectListSchedule.up?currentPage=1'"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow.png"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow.png"></button>
      	<% if(currentPage <= 1) {%>
      	<button class="hide" disabled><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow.png"></button>
      	<%} else { %>
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectListSchedule.up?currentPage=<%=currentPage - 1%>'"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow.png"></button>
		<%} %>
		
		<% for(int p = startPage; p <= endPage; p++) { 
			if(p == currentPage) {
		%>
		
		<button class="hide" disabled><div style="height:18px; width:15px;"><%= p %></div></button>
		
		<% } else { %>
			<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectListSchedule.up?currentPage=<%= p%>'"><div style="height:18px; width:15px;"><%= p %></div></button>
		<% }
		}%>
		
		<% if(currentPage >= maxPage) {%>
		<button class="hide" disabled><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow2.png"></button>
		<%} else { %>
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectListSchedule.up?currentPage=<%=currentPage + 1%>'"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow2.png"></button>
		<%} %>
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectListSchedule.up?currentPage=<%=maxPage%>'"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow2.png"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow2.png"></button>
		
      </div>
			</div>
		</div>

	</div>

</body>
</html>