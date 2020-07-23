<%@page import="com.kh.semi.enterprise.model.vo.PageInfo"%>
<%@page import="com.kh.semi.enterprise.model.vo.ForSdVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<ForSdVO> list = (ArrayList<ForSdVO>)request.getAttribute("list"); 
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/semiproject/views/enterprise/sidebar/css/style.css">
<style>
	.payBtn{
		width:50px;
		height:25px;
		background: pink;
	}

   th, td{
      border-bottom: 1px solid black;
   }
   a{
      text-decoration: none;
      color:black;
   }
   tr{
      height:30px;
   }
   .hide{
      background-color: white;
      border: 0px;
      height:30px;
      width:30px;
   }
</style>

</head>
<body>
	
<%@include file="../sidebar/sidebar.jsp" %>


	<!-- Page Content  -->
	<!-- <div id="content" class="p-4 p-md-5 pt-5">
           <div style="width:70%; height:600px;margin-left:auto; margin-right:auto;">
      <h1>회원관리</h1><br>
      <div style="padding-left:100px;">
         <label>사용자수 : 7명</label><br><br>
         <select style="width:70px; height:30px;">
            <option>이름</option>   
            <option>아이디</option>   
            <option>닉네임</option>
         </select>
         <input type="text" style="height: 23px;">
         <button style="height:30px;">검색</button> -->
         
         <br><br>
         <br><br>
         
         <div style="margin-left:15%;">
         	
         	<br>
            <table style="text-align: center;" align="center">
            <thead>
               <th style="width:150px;">번호</th>
               <th style="width:150px;">상품 이름</th>
               <th style="width:150px;">결제 금액</th>
               <th style="width:150px;">시작 일자</th>
               <th style="width:150px;">종료 일자</th>
               
            </thead>
            <tbody align="center">
               <%for(int i = 0 ; i < list.size(); i++) {%>
               	<tr>
                  <td><%=i+1 %></td>
                  <td><%=list.get(i).getProductName() %></td>
                  <td><%=list.get(i).getPartnerPrice() %></td>
                  <td><%=list.get(i).getStartDate() %></td>
                  <td><%=list.get(i).getEndDate() %></td>
               </tr>
               <%} %>
            </tbody>
            </table>
      <!-- 페이징 처리 버튼 -->
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectSDList.en?enpId=<%=loginEnp.getEnpNo()%>&currentPage=1'"><<</button>
			<%System.out.println("currentPage : "+currentPage); %>
			<%if(currentPage <=1) {%>
			<button disabled><</button>
			<%}else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectSDList.en?enpId=<%=loginEnp.getEnpNo()%>&currentPage=<%=currentPage - 1%>'"><</button>
			<%} %>
			
			<%for(int p = startPage; p <= endPage; p++){ 
				if(p == currentPage) {
			%>
				<button disabled><%=p %></button>
			<%	}else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/selectSDList.en?enpId=<%=loginEnp.getEnpNo()%>&currentPage=<%=p %>'"><%=p %></button>
			<%	} 
			  }
			%>
			
			<%if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<%}else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectSDList.en?enpId=<%=loginEnp.getEnpNo()%>&currentPage=<%=currentPage - 1%>'">></button>
			
			<%} %>
			
			<button onclick="location.href='<%=request.getContextPath()%>/selectSDList.en?enpId=<%=loginEnp.getEnpNo()%>&currentPage=<%=maxPage%>'">>></button>
		</div>
   </div>
   </div>
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	
	<%@include file="../../common/enterpriseFooter.jsp" %>
<br>
<script>
	$(function () {
		$("ul li a").click(function () {
			$(".logo").html($(this).html());
			$("ul li a").css("color", "white");
			$(this).css("color", "#5EB8B4");
		});
	});
</script>
<!-- <script src="/semiproject/views/enterprise/sidebar/js/jquery.min.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/popper.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/bootstrap.min.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/main.js"></script> -->
</body>
</html>