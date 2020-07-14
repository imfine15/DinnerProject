<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET 관리자페이지</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<style>
	
	.writebtn{
		background: #E07370;
 		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 120px;
		height: 30px;
		font-size: 14px;
		margin-top: 20px;
		
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
		 vertical-align: middle;
	}
	input{
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		height: 17px;
	}
	textarea{
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		margin-top: 5px;
	}
	.whenBtn{
		width:50px;
		height:25px;
		background: #EB7673;
		border:0;
		color:white;
		font-weight: bold;
		float: right;
		margin-top: 15px;
		margin-right: 10px;
	}
	.payBtn{
		width:70px;
		height:25px;
		background: #EB7673;
		border:0;
		color:white;
		font-weight: bold;
	}
	.allCheckBtn{
		width:70px;
		height:25px;
		background: #EB7673;
		border:0;
		color:white;
		font-weight: bold;
		float: right;
		margin-right: 90px;
		margin-top: 10px;
	}

	table{
	border-collapse: collapse;
	}
   a{
      text-decoration: none;
      color:black;
   }
   tr{
      border-bottom: 1px solid lightgary;
   }
   td{
      height: 25px;
      width: 120px;
   }
   .hide{
      background-color: white;
      border: 0px;
      height:30px;
      width:30px;
   }
   .dateText{
   	  font-size: 30px;
   	  font-weight: bold;
   }
</style>

</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div class="outer" align="center">
		<div class="header" align="left">
			<h1 >정산 요청 관리<button class="whenBtn">1개월</button><button class="whenBtn">3개월</button><button class="whenBtn">6개월</button><button class="whenBtn">1년</button></h1><br>
		</div>
		<div align="center" class="inner">
			<div style="width: 1000px;">
         		<label class="dateText">2020.06.01</label>
         		<label class="dateText"> ~ </label>
				<label class="dateText">2020.06.30</label>
         		<button class="allCheckBtn">일괄신청</button>
			</div>
					
         	<br>
            <table style="text-align: center;">
            <thead>
            <tr>
               <th style="width:100px;">업체명</th>
               <th style="width:100px;">구분</th>
               <th style="width:100px;">매출건수</th>
               <th style="width:100px;">매출금액</th>
               <th style="width:100px;">정산금액</th>
               <th style="width:100px;">처리일자</th>
               <th style="width:100px;">처리여부</th>
               <th style="width:100px;">요청하기</th>
            </tr>   
            </thead>
            <tbody align="center">
               <tr>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>IMFINE</td>
                  <td>imfine_123@kh.or.kr</td>
                  <td>일반</td>
                  <td>일반</td>
                  <td>일반</td>
                  <td><button class="payBtn">요청하기</button></td>
                 
               </tr>
               <tr>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>IMFINE</td>
                  <td>imfine_123@kh.or.kr</td>
                  <td>일반</td>
                  <td>일반</td>
                  <td>일반</td>
                  <td><button class="payBtn">요청하기</button></td>
                 
               </tr>
               <tr>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>IMFINE</td>
                  <td>imfine_123@kh.or.kr</td>
                  <td>일반</td>
                  <td>일반</td>
                  <td>일반</td>
                  <td><button class="payBtn">요청하기</button></td>
                 
               </tr>
               <tr>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>IMFINE</td>
                  <td>imfine_123@kh.or.kr</td>
                  <td>일반</td>
                  <td>일반</td>
                  <td>일반</td>
                  <td><button class="payBtn">요청하기</button></td>
                 
               </tr>
               <tr>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>IMFINE</td>
                  <td>imfine_123@kh.or.kr</td>
                  <td>일반</td>
                  <td>일반</td>
                  <td>일반</td>
                  <td><button class="payBtn">요청하기</button></td>
                 
               </tr>
               <tr>
                  <td><a href="">00000001</a></td>
                  <td><a href="">imfine123</a></td>
                  <td>IMFINE</td>
                  <td>imfine_123@kh.or.kr</td>
                  <td>일반</td>
                  <td>일반</td>
                  <td>일반</td>
                  <td><button class="payBtn">요청하기</button></td>
                 
               </tr>
            </tbody>
            </table>
            
			<!-- <button class="writebtn">제재 내용 전송</button> -->
		</div>
		
	</div>
</body>
</html>