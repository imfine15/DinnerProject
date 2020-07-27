<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.kh.semi.enterprise.model.vo.ForEntCrVO"%>
<%@page import="com.kh.semi.enterprise.model.vo.PageInfo"%>
<%@page import="com.kh.semi.payment.model.vo.ReservationVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<ReservationVO> list = (ArrayList<ReservationVO>)request.getAttribute("list"); 
PageInfo pi = (PageInfo) request.getAttribute("pi");
int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
ArrayList<ForEntCrVO> modalList = (ArrayList<ForEntCrVO>)request.getAttribute("modalList");
ArrayList<Integer> visitCount = (ArrayList<Integer>)request.getAttribute("visitCount");
ArrayList<Integer> cancelCount = (ArrayList<Integer>)request.getAttribute("cancelCount");

String today = ""+(String)request.getAttribute("today")+"";
%>
<!doctype html>
<html lang="ko">
<head>
<title>YUMEET 사장님페이지</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/semiproject/views/enterprise/sidebar/css/style.css">
<style>
.payBtn {
	width: 50px;
	height: 25px;
	background: #EB7673;
	font-weight: bold;
	color: white;
	border: 0;
}

th, td {
	border-bottom: 1px solid black;
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

	<br>
	<br>

	<div style="margin-left: 15%;">
		<table align="center">

			<tr style="font-size: 30px;">
				<td
					style="font-weight: bolder; color: black; padding-right: 50px; border: 0; " id="backward">
					<</td>
				<td style="border: 0;" id="today"><%=today %></td>
				<td
					style="font-weight: bolder; color: black; padding-left: 50px; border: 0;" id="forward">
					></td>
			</tr>
		</table>
		<br>
		<table style="text-align: center;" align="center">
			<thead>
				<th style="width: 150px;">NO</th>
				<th style="width: 150px;">예약자</th>
				<th style="width: 150px;">시간</th>
				<th style="width: 150px;">인원</th>
				<th style="width: 150px;">전화번호</th>
				<th style="width: 150px;">고객 정보 확인</th>

			</thead>
			<tbody align="center">
				<!-- <tr>
					<td><a href="">00000001</a></td>
					<td><a href="">imfine123</a></td>
					<td>IMFINE</td>
					<td>imfine_123@kh.or.kr</td>
					<td>일반</td>
					<td><button class="payBtn" id="userInfoBtn123">확인</button></td>

				</tr> -->
				<%if(list != null){ %>
				<%for(ReservationVO r : list){ int i = 0;%>
				<tr>
					<td><a href=""><%=r.getrNo() %></a></td>
					<td><a href=""><%=r.getmNo() %></a></td>
					<td><%=r.getrDate3() %></td>
					<td><%=r.getPeople() %>명</td>
					<td><%=modalList.get(i).getPhone() %></td>
					<td><button class="payBtn" id="userInfoBtn<%=i%>">확인</button></td>

				</tr>
				<% i++;} %>
				<%}else{ %>
					<tr>
					<td colspan="6">오늘 예약이 없습니다.</td>

				</tr>
				<%} %>
				<%-- <% for(ReservationVO r : list){
               int i = 0 ;%>
               		
					<tr>
					<td><button  style="background:#EB7673; width:17px; height:17px; border:0;"></button></td>
                  		<td><a href=""><%=r.getrNo() %></a></td>
		                <td><a href=""><%=r.getmNo() %></a></td>
		                <td><%=r.getrDate3() %></td>
		                <td><%=r.getPeople() %></td>
		                <td><%=r.getrDate2() %></td>--%>
			</tbody>
		</table>
		<%-- <div class="pagingArea" align="center">
			<button class="hide"
				onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage=1'"><<</button>
			<button class="hide"
				onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='"><</button>

			<button class="hide"
				onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='">></button>
			<button class="hide"
				onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='">>></button>
		</div> --%>
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectReservationDateList.en?enpId=<%=loginEnp.getEnpNo()%>&currentPage=1&today=<%=today%>'"><<</button>
			<%System.out.println("currentPage : "+currentPage); %>
			<%if(currentPage <=1) {%>
			<button disabled><</button>
			<%}else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectReservationDateList.en?enpId=<%=loginEnp.getEnpNo()%>&currentPage=<%=currentPage - 1%>&today=<%=today%>'"><</button>
			<%} %>
			
			<%for(int p = startPage; p <= endPage; p++){ 
				if(p == currentPage) {
			%>
				<button disabled><%=p %></button>
			<%	}else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/selectReservationDateList.en?enpId=<%=loginEnp.getEnpNo()%>&currentPage=<%=p %>&today=<%=today%>'"><%=p %></button>
			<%	} 
			  }
			%>
			
			<%if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<%}else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectReservationDateList.en?enpId=<%=loginEnp.getEnpNo()%>&currentPage=<%=currentPage - 1%>&today=<%=today%>'">></button>
			
			<%} %>
			
			<button onclick="location.href='<%=request.getContextPath()%>/selectReservationDateList.en?enpId=<%=loginEnp.getEnpNo()%>&currentPage=<%=maxPage%>&today=<%=today%>'">>></button>
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
	<%-- <%if(modalList != null) {%>
	<% for(int i = 0 ; i < modalList.size(); i++){%>
	<div class="modal fade" id="testModal<%=i %>" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">상세 정보</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<br> <br>
				<div class="modal-body" id="">
					<table align="center">

						<thead>
							<tr style="font-size: 14px; color: black; text-align: center;">
								<th>총 방문횟수</th>
								<th>총 취소횟수</th>
								<th style="color: red;">No Show</th>
								<th>최근 방문일</th>
								<th>예약자 정보</th>
							</tr>
						</thead>
						<tr style="font-size: 10px; text-align: center;">
							<td style="font-weight: bolder; color: black;"><%=visitCount.get(i) %>
							</td>
							<td><%=cancelCount.get(i) %></td>
							<td style="font-weight: bolder; color: black;">0</td>
							<td><%=modalList.get(i).getReservationDate() %></td>
							<td><%=modalList.get(i).getNickName() %></td>

						</tr>
					</table>
				</div>
				<br> <br>


				<div class="modal-footer">
					<!-- <a class="btn" id="modalY" href="#">예</a> -->
					<button class="btn" type="button" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
				<% } %>
				<%}else{} %> --%>
	<% for(int j = 0 ; j < list.size(); j++){%>
	<div class="modal fade" id="testModal<%=j %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">상세 정보</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<br>
				<br>
				<div class="modal-body" id="">
					<table align="center">
					
		         		<thead>
			         		<tr style="font-size: 14px; color:black; text-align: center;">
			         			<th>총 방문횟수</th>
			         			<th>총 취소횟수</th>
			         			<th style="color:red;">No Show</th>
			         			<th>예약 요청일</th>
			         			<th>예약자 정보</th>
			         		</tr>
		         		</thead>
		         		<tr style="font-size: 10px; text-align: center;">
		         		<%if(visitCount.get(j) != null && cancelCount.get(j) != null) {%>
		         			<td style="font-weight: bolder; color:black;">
		         			 <%=visitCount.get(j) %>
		         			</td>
		         			<td>
		         			 <%=cancelCount.get(j) %> 
							</td>
							<%} %>
							<td style="font-weight: bolder; color:black;">
		         				0
		         			</td>
		         			<td>
		         				<%=modalList.get(j).getReservationDate() %>
		         			</td>
		         			<td>
		         				<%=modalList.get(j).getNickName() %>
		         			</td>
		         			
		         		</tr>
	         		</table>			
				</div>
				<br>
				<br>
				
				
				<div class="modal-footer">
					<!-- <a class="btn" id="modalY" href="#">예</a> -->
					<button class="btn" type="button" data-dismiss="modal">확인</button>
				</div>
		         		
				
			</div>
		</div>
	</div>
	<% } %>
	<!-- Calendar Page Start ^^; -->
	<!-- <div class="subb"
			style="width: 300px; position: absolute; margin-top: 300px; right: 340px;">
			<hr style="margin-right: -150px; margin-left: 0px;">
			<br> <label style="font-size: 20px">날짜</label> <label></label> <br>
			<br>

		</div>
	<div id="calendar"
		style="position: absolute; top: 100px; right: 170px;">
		<div id="calendar_header" onclick="dd();">
			<i class="icon-chevron-left"></i>
			<h1></h1>
			<i class="icon-chevron-right"></i>
		</div>
		<div id="calendar_weekdays"></div>
		<div id="calendar_content"></div>
	</div>
	<img src="/semiproject/images/blog.png"
		style="position: absolute; left: 200px; top: 100px;">
	<script>
var day;
var yearAndMonth;
var month;
function dd(){
	$("#calendar_content div").click(function(){
		day = this.innerHTML;
		yearAndMonth = $("#calendar_header h1").html().split(" ");
		console.log(yearAndMonth);
		switch(yearAndMonth[0]){
		case "JANUARY" : month = 1; break;
		case "FEBRUARY" : month = 2; break;
		case "MARCH" : month = 3; break;
		case "APRIL" : month = 4; break;
		case "MAY" : month = 5; break;
		case "JUNE" : month = 6; break;
		case "JULY": month = 7; break;
		case "AUGUST": month = 8; break;
		case "SEPTEMBER": month = 9; break;
		case "OCTOBER": month = 10; break;
		case "NOVEMBER": month = 11; break;
		case "DECEMBER": month = 12; break;
		}
		console.log(month);
		console.log(day);
	});
}


 $(document).ready(function(){
	$("#calendar_content div").click(function(){
		day = this.innerHTML;
		yearAndMonth = $("#calendar_header h1").html().split(" ");
		console.log(yearAndMonth);
		switch(yearAndMonth[0]){
		case "JANUARY" : month = 1; break;
		case "FEBRUARY" : month = 2; break;
		case "MARCH" : month = 3; break;
		case "APRIL" : month = 4; break;
		case "MAY" : month = 5; break;
		case "JUNE" : month = 6; break;
		case "JULY": month = 7; break;
		case "AUGUST": month = 8; break;
		case "SEPTEMBER": month = 9; break;
		case "OCTOBER": month = 10; break;
		case "NOVEMBER": month = 11; break;
		case "DECEMBER": month = 12; break;
		}
		console.log(month);
		console.log(day);
	});
});  -->



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
	<%@include file="../../common/enterpriseFooter.jsp"%>
	<br>
	<script>
	
	$(function() {
		$("#backward").click(function () {
			var t = $("#today").html();
			location.href="/semiproject/selectReservationDateList.en?dayStatus=-1&enpId=<%=loginEnp.getEnpNo()%>&today="+t;
		});
		$("#forward").click(function () {
			var t = $("#today").html();
			location.href="/semiproject/selectReservationDateList.en?dayStatus=1&enpId=<%=loginEnp.getEnpNo()%>&today="+t;
		});
		
	});
		
	
	$(function () {
		$("ul li a").click(function () {
			$(".logo").html($(this).html());
			$("ul li a").css("color", "white");
			$(this).css("color", "#5EB8B4");
		});
	});
	
	
	$(function () {
		$(".payBtn").click(function () {
			var str = $(this).attr('id');
			var no=str.replace(/[^0-9]/g,'');
			
			$('#testModal' + no).modal("show");
		});
	});
	
</script>
	<!-- <script src="/semiproject/views/enterprise/sidebar/js/jquery.min.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/popper.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/bootstrap.min.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/main.js"></script> -->
</body>
</html>