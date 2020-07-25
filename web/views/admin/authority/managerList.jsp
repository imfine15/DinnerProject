<%@page import="com.kh.semi.manager.model.vo.ManagerVo"%>
<%@page import="com.kh.semi.admin.model.vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<ManagerVo> list = (ArrayList<ManagerVo>)request.getAttribute("list"); 
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
		width: 90%;
	}
	tr{
		border-bottom: 0.75px solid #CBCDD1;
	}
	td{
		text-align: center;
		height: 35px;
	}
	.btn{
		background: red;
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
	.insertBtn{
		background: #EE8E8C;
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 80px;
		height: 25px;
		font-size: 16px;
		float: right;
		margin-right: 80px;
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
			<h1>직원관리</h1><br>
		</div>
		<div class="inner">
			<button class="insertBtn" onclick="location.href='/semiproject/views/admin/authority/authority.jsp'">직원등록</button>
			<table style="margin-top: 50px;">
				<tr>
					<td>직원명</td>
					<td>직급</td>
					<td>부서</td>
					<td>ID</td>
					<td>전화번호</td>
					<td>이메일</td>
					<td>퇴사</td>
				</tr>
				<% for(ManagerVo m : list) {%>
				<tr>
					<td><%= m.getManagerName() %></td>
					<td><%= m.getJobName() %></td>
					<td><%= m.getDeptTitle() %></td>
					<td><%= m.getManagerId() %></td>
					<td><%= m.getManagerPhone() %></td>
					<td><%= m.getManagerEmail() %></td>
					<td><button class="btn" onclick="location.href='<%=request.getContextPath()%>/delete.ma?no=<%=m.getManagerNo()%>'">직원삭제</button></td>
				</tr>
				<%} %>
			</table>
			<!-- 검색박스 -->
			<div class="searchBox">
				<select>
					<option>직원명</option>	
					<option>직급</option>
					<option>부서</option>
				</select>
				<input type="text">
				<button class="searchBtn">검색</button>
			</div>
			<!-- 페이징처리 -->
			<div class="pagingArea" align="center" style="background: white;">
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.ma?currentPage=1'"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow.png"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow.png"></button>
      	<% if(currentPage <= 1) {%>
      	<button class="hide" disabled><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow.png"></button>
      	<%} else { %>
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.ma?currentPage='"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow.png"></button>
		<%} %>
		
		<% for(int p = startPage; p <= endPage; p++) { 
			if(p == currentPage) {
		%>
		
		<button class="hide" disabled><div style="height:18px; width:15px;"><%= p %></div></button>
		
		<% } else { %>
			<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.ma?currentPage=<%= p%>'"><div style="height:18px; width:15px;"><%= p %></div></button>
		<% }
		}%>
		
		<% if(currentPage >= maxPage) {%>
		<button class="hide" disabled><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow2.png"></button>
		<%} else { %>
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.ma?currentPage='"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow2.png"></button>
		<%} %>		
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.ma?currentPage='"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow2.png"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow2.png"></button>
		
      </div>
		</div>
		
	</div>
</body>
</html>