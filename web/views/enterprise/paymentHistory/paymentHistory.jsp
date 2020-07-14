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
	
	.payBtn{
		width:50px;
		height:25px;
		background: #EB7673;
		font-weight: bold;
		color:white;
		border:0;
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
         
         <div style="margin-left:15%;">
         	<table align="center">
         		
         		<tr style="font-size: 30px;">
         			<td style="border:0; padding-right:50px;">
         				<
         			</td>
         			<td style="font-weight: bolder; color:black; padding-right: 50px;  border:0;">
         				2020/06/01
         			</td>
         			<td style=" border:0;">
         				~
					</td>
					<td style="font-weight: bolder; color:black;  padding-left: 50px;  border:0;">
         				2020.06.22
         			</td>
         			<td style="border:0; padding-left:50px;">
         				>
         			</td>
         		</tr>
         	</table>
         	<br>
            <table style="text-align: center;" align="center">
            <thead>
               <th style="width:150px;">일자</th>
               <th style="width:150px;">예약 건수</th>
               <th style="width:150px;">매출 금액</th>
               <th style="width:150px;">정산 금액</th>
               <th style="width:150px;">처리 여부</th>
               <th style="width:150px;">이의 신청</th>
               <th style="width:150px;">전자 서명</th>
            </thead>
            <tbody align="center">
               <tr>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>IMFINE</td>
                  <td>imfine_123@kh.or.kr</td>
                  <td><button class="payBtn" style="background-color: #5EB8B4; width: 80px; border:0; color:gray;">입금 예정</button></td>
                  <td><button class="payBtn">신청</button></td>
                  <td><button class="payBtn">확인</button></td>
                 
               </tr>
               <tr>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>IMFINE</td>
                  <td>imfine_123@kh.or.kr</td>
                  <td><button class="payBtn" style="background-color: #5EB8B4; width: 80px; border:0; color:gray;">입금 예정</button></td>
                  <td><button class="payBtn">신청</button></td>
                  <td><button class="payBtn">확인</button></td>
                 
               </tr>
               <tr>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>IMFINE</td>
                  <td>imfine_123@kh.or.kr</td>
                  <td><button class="payBtn" style="background-color: #5EB8B4; width: 80px; border:0; color:gray;">입금 예정</button></td>
                  <td><button class="payBtn">신청</button></td>
                  <td><button class="payBtn">확인</button></td>
                 
               </tr>
               <tr>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>IMFINE</td>
                  <td>imfine_123@kh.or.kr</td>
                  <td><button class="payBtn" style="background-color: #5EB8B4; width: 80px; border:0; color:gray;">입금 예정</button></td>
                  <td><button class="payBtn">신청</button></td>
                  <td><button class="payBtn">확인</button></td>
                 
               </tr>
               <tr>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>IMFINE</td>
                  <td>imfine_123@kh.or.kr</td>
                  <td><button class="payBtn" style="background-color: #5EB8B4; width: 80px; border:0; color:gray;">입금 예정</button></td>
                  <td><button class="payBtn">신청</button></td>
                  <td><button class="payBtn">확인</button></td>
                 
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
					<h5 class="modal-title" id="exampleModalLabel">이의 신청</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<br>
				<br>
				<div class="modal-body">
					<form action="" style="margin-left: 10%;">
						<p>업체명 : <a>피카츄돈까스</a></p>
						<br>
						<p>신청인 : <input type="text"></p>
						<br>
						<p>핸드폰 : <input type="tel"></p>
						<br>
						<p>이메일 : <input type="email"></p>
						<br>
						<p>이의신청 취지 및 사유 : </p>
						
						<textarea rows="5" cols="40" style="resize:none; border-radius: 0; border: 1px solid gray; outline-style: none;"></textarea>
						<br>
						<button type="submit" style="text-align: center; margin-left: 80%;">확인</button>
						
						
						
						
					</form>
				</div>
					<br>
				
					
				
				
				<div class="modal-footer">
					<!-- <a class="btn" id="modalY" href="#">예</a> -->
					<button class="btn" type="button" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	
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
		$("button").click(function () {
			console.log("asd");
			$('#testModal').modal("show");
		});
	});
</script>
<!-- <script src="/semiproject/views/enterprise/sidebar/js/jquery.min.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/popper.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/bootstrap.min.js"></script>
<script src="/semiproject/views/enterprise/sidebar/js/main.js"></script> -->
</body>
</html>