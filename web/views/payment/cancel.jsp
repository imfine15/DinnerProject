<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<style>
	.outer{
		width:100%; 
		height:850px;
	}
	.header{
	width:50%;  
	display:inline-block;
	margin-left: auto;
		margin-right: auto;
	}
	h3{
		font-size: 24px;
	}
	.inner{
		width: 70%;
		margin-left: auto;
		margin-right: auto;
	}
	th{
		background: #EB7673;
		color: white;
	}
	td{
		background: #FAFAFA;
		width: 230px;
		height: 200px;
		text-align: center;
	}
	.btn{
		
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 90px;
		height: 35px;
		font-size: 20px;
		margin: 50px;
	}
</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>

<div class="outer" align="center">
	
		<div class="header" align="left">
			<h3>예약취소</h3>
		</div>
		<div class="inner">
			<table border="1">
				<tr>
					<th>예약 업체명</th>
					<th>예약 일자</th>
					<th colspan="2">예약 금액</th>
				</tr>
				<tr>
					<td>파스타학교</td>
					<td>2020년 09월 18일 (금)</td>
					<td>현금 : 99,400 원</td>
					<td>포인트 : 600 점</td>
				</tr>
			</table>
		<div align="left">
			<pre>
* 이용 약관에 따라 현재 날짜로부터 예약 일자까지 남은 일 수에 대하여 환불 금액이 정해집니다.

* 예약 취소 환불 규정
             예약 당일로부터 4일 전 - 전액 환불 가능
             예약 당일로부터 3일 전 ~ 1일 전 - 50%환불 가능
             예약 당일로부터 24시간 전 - <label style="color: red;">환불 불가</label> 

* 기타 문의사항은 고객센터(010-3410-6215)로 연락하여 주시기 바립니다.</pre>
		</div>
		<div align="left">
		<p>취소 사유를 입력해주세요 (선택)</p>
		<textarea rows="10" cols="132px" style="resize: none;" placeholder="이곳에 취소 사유를 입력해 주세요."></textarea>
		<br><input type="checkbox" value="" ><label>상기 내용을 확인하고 동의합니다.</label>
		</div>
		<div>
			<button class="btn" style="background: #757575;">취소</button>
			<button class="btn" style="background: #EB7673;">확인</button>
		</div>
		
		
	</div>

		</div>

<%@ include file="/views/common/footer.jsp" %>
</body>
</html>