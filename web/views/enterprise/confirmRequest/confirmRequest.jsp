<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<title>YUMEET 사장님페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/semiproject/views/enterprise/sidebar/css/style.css">
<style>
	.reservateBtn{
		width:50px;
		height:25px;
		background: #EB7673;
		border:0;
		color:white;
		font-weight: bold;
	}
	.moreInfoBtn{
		width:50px;
		height:25px;
		background: #EB7673;
		border:0;
		color:white;
		font-weight: bold;
	}
	.userInfoBtn{
		width:50px;
		height:25px;
		background: #EB7673;
		border:0;
		color:white;
		font-weight: bold;
	}
	.cancelBtn{
		width:50px;
		height:25px;
		background: #EB7673;
		border:0;
		color:white;
		font-weight: bold;
	}
 tr{
   		width:120px;
      height:30px;
   }
   th, td{
     width:100px;
      border-bottom: 1px solid black;
   }
   a{
      text-decoration: none;
      color:black;
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
         
         <div style="margin-left:15%;">
         	<!-- <table align="center">
         		<tr>
         			<td></td>
         			<td></td>
         			<td></td>
         			
         		</tr>
         		<tr style="font-size: 30px;">
         			<td style="font-weight: bolder; color:black; padding-right: 50px;">
         				<
         			</td>
         			<td>
         				2020.06.22
					</td>
					<td style="font-weight: bolder; color:black;  padding-left: 50px;">
         				>
         			</td>
         		</tr>
         	</table> -->
         	<h3 style="text-align: left; margin-left: 5%; color:black; font-weight:normal;">예약 요청 확인</h3>
         	
            <table style="text-align: center;" align="center">
            <thead>
               <th style="width:30px;">&nbsp;</th>
               <th style="width:130px;">NO</th>
               <th style="width:130px;">예약자</th>
               <th style="width:130px;">시간</th>
               <th style="width:130px;">인원</th>
               <th style="width:130px;">요청 일자</th>
               <th style="width:130px;">상세 정보</th>
               <th style="width:130px;">고객 정보 확인</th>
               <th style="width:130px;">예약 접수</th>
                
            </thead>
            <tbody align="center">
               <tr>
                  <td><button  style="background:#EB7673; width:17px; height:17px; border:0;"></button></td>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>13:30</td>
                  <td>3</td>
                  <td>2020/06/22</td>
                  <td><button class="moreInfoBtn">확인</button></td>
                  <td><button class="userInfoBtn">확인</button></td>
                  <td><button class="reservateBtn">확인</button> <button class="cancelBtn" style="background-color: gray;">취소</button></td>
                 
               </tr>
               <tr>
                  <td><button  style="background:#EB7673; width:17px; height:17px; border:0;"></button></td>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>13:30</td>
                  <td>3</td>
                  <td>2020/06/22</td>
                  <td><button class="moreInfoBtn">확인</button></td>
                  <td><button class="userInfoBtn">확인</button></td>
                  <td><button class="reservateBtn">확인</button> <button class="cancelBtn" style="background-color: gray;">취소</button></td>
                 
               </tr>
               <tr>
                  <td><button  style="background:#EB7673; width:17px; height:17px; border:0;"></button></td>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>13:30</td>
                  <td>3</td>
                  <td>2020/06/22</td>
                  <td><button class="moreInfoBtn">확인</button></td>
                  <td><button class="userInfoBtn">확인</button></td>
                  <td><button class="reservateBtn">확인</button> <button class="cancelBtn" style="background-color: gray;">취소</button></td>
                 
               </tr>
               <tr>
                  <td><button  style="background:#EB7673; width:17px; height:17px; border:0;"></button></td>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>13:30</td>
                  <td>3</td>
                  <td>2020/06/22</td>
                  <td><button class="moreInfoBtn">확인</button></td>
                  <td><button class="userInfoBtn">확인</button></td>
                  <td><button class="reservateBtn">확인</button> <button class="cancelBtn" style="background-color: gray;">취소</button></td>
                 
               </tr>
               <tr>
                  <td><button  style="background:#5EB8B4; width:17px; height:17px; border:0;"></button></td>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>13:30</td>
                  <td>3</td>
                  <td>2020/06/22</td>
                  <td><button class="moreInfoBtn">확인</button></td>
                  <td><button class="userInfoBtn">확인</button></td>
                  <td><button class="reservateBtn">확인</button> <button class="cancelBtn" style="background-color: gray;">취소</button></td>
                 
               </tr>
               <tr>
                  <td><button  style="background:#5EB8B4; width:17px; height:17px; border:0;"></button></td>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>13:30</td>
                  <td>3</td>
                  <td>2020/06/22</td>
                  <td><button class="moreInfoBtn">확인</button></td>
                  <td><button class="userInfoBtn">확인</button></td>
                  <td><button class="reservateBtn">확인</button> <button class="cancelBtn" style="background-color: gray;">취소</button></td>
                 
               </tr>
            </tbody>
            </table>
      <div class="pagingArea" align="center">
         <button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage=1'"><<</button>
         <button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='"><</button>

         <button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='">></button>
         <button class="hide" onclick="location.href='<%=request.getContextPath()%>/selectList.no?currentPage='">>></button>
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
	
	<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
				<div class="modal-body">
					<table align="center" >
					
		         		<thead>
			         		<tr style="font-size: 14px; color:black; text-align: center;">
			         			<th>총 방문횟수</th>
			         			<th>총 취소횟수</th>
			         			<th style="color:red;">No Show</th>
			         			<th>최근 방문일</th>
			         			<th>예약자 정보</th>
			         		</tr>
		         		</thead>
		         		<tr style="font-size: 10px; text-align: center;">
		         			<td style="font-weight: bolder; color:black;">
		         				1
		         			</td>
		         			<td>
		         				0
							</td>
							<td style="font-weight: bolder; color:black;">
		         				0
		         			</td>
		         			<td>
		         				2020.06.21
		         			</td>
		         			<td>
		         				군필 여고생
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
	
	$(function () {
		$(".userInfoBtn").click(function () {
			console.log("asd");
			$('#testModal').modal("show");
		});
	});
	$(function () {
		$(".reservateBtn").click(function () {
			$(this).parent().parent().children().children().eq(0).css("background","#5EB8B4");
		});
	});
	$(function () {
		$(".cancelBtn").click(function () {
			
			$(this).parent().parent().children().empty();
		});
	})
</script>
<!-- <script src="/semiproject/views/enterprise/sidebar/js/jquery.min.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/popper.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/bootstrap.min.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/main.js"></script> -->
</body>
</html>