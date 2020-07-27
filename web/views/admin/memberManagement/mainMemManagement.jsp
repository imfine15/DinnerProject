<%@page import="com.kh.semi.admin.model.vo.PageInfo"%>
<%@page import="com.kh.semi.member.model.vo.MemberAdminVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<MemberAdminVo> list = (ArrayList<MemberAdminVo>)request.getAttribute("list");
PageInfo pi = (PageInfo)request.getAttribute("pi");
int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int countMem = (int)request.getAttribute("countMem");
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
	}
	a{
		text-decoration: none;
		color:black;
	}
	tr{
		height:30px;
		border-bottom: 1px solid gray;
	}
	.hide{
		background-color: white;
		border: 0px;
		height:25px;
		
	}
		input{
		border-radius: 0;
border: 1px solid gray;
outline-style: none;
height: 20px;
vertical-align: top;
	}
	
	select{
		border-radius: 0;
border: 1px solid gray;
outline-style: none;
height: 25px;
	}
	.btn{
		background: #E07370;
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 80px;
		height: 22px;
		font-size: 14px;
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
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div style="width:85%; height:600px;margin-left: 230px; padding-top:40px; padding-left:30px;">
		<div style="background: #F9F9F9;width:100%; margin-bottom: 10px; height:50px; padding-left:10px;">
			<h1>회원관리</h1><br>
		</div>
		<div align="center" style=" background: white; width:100%; height:800px; padding-top:50px;">
			<div>
			<label style="margin-right: 500px;">※ 사용자수 : <%= countMem %>명</label>
			<select>
				<option>이름</option>	
				<option>아이디</option>	
				<option>닉네임</option>
			</select>
			<input type="text">
			<button class="searchBtn">검색</button>
			</div>
			
			<br><br>
			
			<div style="width: 95%;">
				<table style="width: 95%;">
				<thead>
				<tr>
					<th>회원번호</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>예약횟수</th>
					<th>최근방문일</th>
					<th>최근예약일</th>
					<th>탈퇴여부</th>
					<th>노쇼횟수</th>
				</tr>
				</thead>
				<tbody align="center">
				<% for(MemberAdminVo ma : list) {%>
					<tr>
						<td><%=ma.getMemberNo() %></td>
						<td><%= ma.getMemberId() %></td>
						<td><%= ma.getMemberNickname() %></td>
						<td><%= ma.getReservationCount() %></td>
						<% if(ma.getVisitDate() != null) {%>
						<td><%= ma.getVisitDate() %></td>
						<%} else { %>
						<td>없음</td>
						<%} %>
						<% if(ma.getReservationDate() != null) {%>
						<td><%= ma.getReservationDate() %></td>
						<%} else { %>
						<td>없음</td>
						<%} %>
						<td><%= ma.getMemberStatus() %></td>
						<td><%= ma.getNoshowCount() %></td>
					</tr>
					<%} %>
				</tbody>
				</table>
			</div>
		</div>
		<div class="pagingArea" align="center" style="background: white;">
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectMember.ad?currentPage=1'"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow.png"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow.png"></button>
      	<% if(currentPage <= 1) {%>
      	<button class="hide" disabled><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow.png"></button>
      	<%} else { %>
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectMember.ad?currentPage=<%=currentPage - 1%>'"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow.png"></button>
		<%} %>
		
		<% for(int p = startPage; p <= endPage; p++) { 
			if(p == currentPage) {
		%>
		
		<button class="hide" disabled><div style="height:18px; width:15px;"><%= p %></div></button>
		
		<% } else { %>
			<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectMember.ad?currentPage=<%= p%>'"><div style="height:18px; width:15px;"><%= p %></div></button>
		<% }
		}%>
		
		<% if(currentPage >= maxPage) {%>
		<button class="hide" disabled><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow2.png"></button>
		<%} else { %>
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectMember.ad?currentPage=<%=currentPage + 1%>'"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow2.png"></button>
		<%} %>
      	<button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectMember.ad?currentPage=<%=maxPage%>'"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow2.png"><img style="width:15px; height:18px" src="/semiproject/views/admin/companyManagement/images/arrow2.png"></button>
		
      </div>
	</div>
</body>
</html>