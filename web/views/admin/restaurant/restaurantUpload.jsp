<%@page import="com.kh.semi.admin.model.vo.PageInfo"%>
<%@page import="com.kh.semi.enterprise.model.vo.EnpUpVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<EnpUpVo> list = (ArrayList<EnpUpVo>)request.getAttribute("list"); 
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
<style>
	table{
		border-collapse: collapse;
		width: 80%;
	}
	tr{
		border-bottom: 0.75px solid #CBCDD1;
	}
	td{
		text-align: center;
	}
	.btn{
		background: #E07370;
 		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 80px;
		height: 23px;
		font-size: 14px;
		border-radius: 3px;

	}

	.outer{
		width:85%; 
		height:600px;
		margin-left: 230px; 
		padding-top:40px; 
		padding-left:30px;
	}
	.header{
		 background: #F9F9F9;
		 width: 100%; 
		 margin-bottom: 10px; 
		 height:50px; 
		 padding-left:10px;
		 margin-left: auto;
		 margin-right: auto;
	}
	.inner{
		 padding-left:50px; 
		 background: white; 
		 width:95%; 
		 padding-top: 30px; 
		 height: 800px;
		 margin-left: auto;
		 margin-right: auto;
	}
		input{
		border-radius: 0;
border: 1px solid gray;
outline-style: none;
height: 20px;
vertical-align: top;
margin-top: 1px;
	}
	
	select{
		border-radius: 0;
border: 1px solid gray;
outline-style: none;
height: 25px;
	}
	.searchBtn{
		background: lightgray;
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 60px;
		height: 25px;
		font-size: 16px;
	}
	.searchBox{
		margin-top: 100px;
	}
	.pagingArea{
		margin-top: 50px;
	}
	.hide{
		border: 0;
		outline: 0;
		background: white;
		vertical-align: middle;
	}

	
	
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div class="outer" align="center">
		<div class="header" align="left">
			<h1>가게 등록 요청</h1><br>
		</div>
		<div class="inner">
			
			<table style="margin-top: 50px;">
				<tr>
					<td>가게명</td>
					<td>카테고리</td>
					<td>신청 날짜</td>
					<td>업로드 확인</td>
					<td>관리</td>
				</tr>
				<% for(EnpUpVo e : list) {%>
				<tr>
					<input type="hidden" value="<%= e.getEnpNo()%>">
					<td><%= e.getEnpName() %></td>
					<td><%= e.getEnpType() %></td>
					<td><%= e.getUploadDate() %></td>
					<td><%= e.getUploadApproval() %></td>
					<td><button class="btn" onclick="location.href='/selectOneEnt.up'">확인하기</button></td>
				</tr>
				<%} %>
			</table>
			<!-- 검색박스 -->
			<div class="searchBox">
				<select>
					<option>가게명</option>	
					<option>카테고리</option>
					<option>업로드여부</option>
				</select>
				<input type="text">
				<button class="searchBtn">검색</button>
			</div>
			<!-- 페이징처리 -->
			<div class="pagingArea" align="center" style="background: white;">
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectEntList.up?currentPage=1'"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow.png"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow.png"></button>
      	<% if(currentPage <= 1) {%>
      	<button class="hide" disabled><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow.png"></button>
      	<%} else { %>
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectEntList.up?currentPage='"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow.png"></button>
		<%} %>
		
		<% for(int p = startPage; p <= endPage; p++) { 
			if(p == currentPage) {
		%>
		
		<button class="hide" disabled><div style="height:18px; width:15px;"><%= p %></div></button>
		
		<% } else { %>
			<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectEntList.up?currentPage=<%= p%>'"><div style="height:18px; width:15px;"><%= p %></div></button>
		<% }
		}%>
		
		<% if(currentPage >= maxPage) {%>
		<button class="hide" disabled><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow2.png"></button>
		<%} else { %>
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectEntList.up?currentPage='"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow2.png"></button>
		<%} %>		
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectEntList.up?currentPage='"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow2.png"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow2.png"></button>
		
      </div>
		</div>
		
	</div>
</body>
</html>