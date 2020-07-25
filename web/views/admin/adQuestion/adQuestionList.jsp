<%@page import="com.kh.semi.admin.model.vo.PageInfo"%>
<%@page import="com.kh.semi.ad.model.vo.AdVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<AdVO> list = (ArrayList<AdVO>) request.getAttribute("list");
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
<title>YUMEET 관리자</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
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
	height: 25px;
	background: #C4C4C4;
	color: black;
	border: none;
}

#title {
	text-align: left;
	padding-left: 30px;
	width: 40%;
}

.toggle {
	/* background: url("/semiproject/images/toggle.png") no-repeat; */
	width:10px;
	height:10px;
	border:none;
}
.innerText1{
	display: none;
}
.checkBtn{
		background: gray;
 		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 80px;
		height: 25px;
		font-size: 14px;
		
}
 .productBtn{
 	
 		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 90px;
		height: 25px;
		font-size: 14px;
 }

</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div id="wrapper">
		<div id="title-box">
			<p>광고 문의 관리</p>
			<br>
		</div>
		<div id="inner-wrap">
			<div id="inner-box">
				<div style="height: 30px;"></div>
				<form action="<%=request.getContextPath()%>/selectAdList.ad" method="post">
					<table id="review-tb" style="width: 100%;">
						<tr>
							<th>업체명</th>
							<th>전화번호</th>
							<th>이메일</th>
							<th>업체 종류</th>
							<th>상품 선택</th>
							<th>확인</th>
						</tr>
						<% for(AdVO ad : list) {%>
						<tr>
							<td><%=ad.getAdName() %></td>
							<td><%=ad.getAdPhone() %></td>
							<td><%=ad.getAdEmail() %></td>
							<td><%=ad.getAdEnpType() %></td>
							<td>
								<%if(ad.getAdTitle().equals("메인배너")) {%>
								<button class="productBtn" style="background: #E07370;"><%=ad.getAdTitle() %></button>
								<%} else { %>
								<button class="productBtn" style="background: #5BB8B4;"><%=ad.getAdTitle() %></button>
								<%} %>
							</td>
							<td>
								<button type="button" class="checkBtn" onclick="location.href='<%=request.getContextPath()%>/selectOneAd.ad?no=<%=ad.getAdNo()%>'">자세히</button>
							</td>
						</tr>
						<%} %>
						
					</table>
				</form>
				
				<div class="pageingArea" align="center">
			<button
				onclick="location.href='<%=request.getContextPath()%>/selectAdList.ad?currentPage=1'"><<</button>

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
				onclick="location.href='<%=request.getContextPath()%>/selectAdList.ad?currentPage=<%=p%>'"><%=p%></button>
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
				onclick="location.href='<%=request.getContextPath()%>/selectAdList.ad?currentPage=<%=currentPage + 1%>'">></button>
			<%
				}
			%>

			<button
				onclick="location.href='<%=request.getContextPath()%>/selectAdList.ad?currentPage=<%=maxPage%>'">>></button>
	</div>
				
				
				<div style="height: 30px;"></div>
				<div id="search-box" align="center">
					<form>
						<table>
							<tr>
								<td><select style="height:25px; font-size:14px;">
										<option>회원명</option>
										<option>업체명</option>
										<option>처리상태</option>
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
	
		<!-- <script>

	
	$(document).ready(function() {
		$("#toggle1").click(function() {
			status = $(".innerText1").css("display"); 
			console.log(status);
			if (status == "none") { 
				$(".innerText1").show();
			} else { 
				$(".innerText1").css("display", "none");
			}

		});
	});
	
	</script> -->
</body>
</html>