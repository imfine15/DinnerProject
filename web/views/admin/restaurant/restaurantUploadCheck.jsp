<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		border-collapse: collapse;
		width: 80%;
		border: 1px solid black;
	}
	tr{
		border-bottom: 1px solid black;
	}
	th{
		background: #EAEAEA;
		width: 100px;
		height: 50px;
		font-weight: normal;
		border-right: 1px solid black;
		border-left: 1px solid black;
	}
	td{
		padding-left: 5px;
	}
	
	
	.btn{
		background: #E07370;
 		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 100px;
		height: 28px;
		font-size: 18px;
		margin: 20px;
		margin-top: 50px;
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

	
	
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="../common/sidebar.jsp"%>
	<div class="outer" align="center">
		<div class="header" align="left">
			<h1>가게 등록 요청</h1><br>
		</div>
		<div class="inner">
			<h3>입점 가게 상세 정보</h3>
			<table>
				<tr>
					<th>신청자</th>
					<td>pika123</td>
					<th>신청 날짜</th>
					<td>20/06/29</td>
				</tr>
				<tr>
					<th>식당명</th>
					<td>역삼식당</td>
					<th>업로드 날짜</th>
					<td>20/07/01</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3">서울 강남구 테헤란로 123</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>010-3333-4444</td>
					<th>가격대</th>
					<td>~1만원대</td>
				</tr>
				<tr>
					<th>메뉴</th>
					<td colspan="3">오늘의 메뉴 6500원</td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td>9 : 00 ~ 21 : 00</td>
					<th>휴무일</th>
					<td>매주 주말 휴무</td>
				</tr>
				<tr>
					<th>해쉬태그</th>
					<td colspan="3">#역삼역 #정식 #@푸짐 #저렴함</td>
				</tr>
				<tr>
					<th>소개문구</th>
					<td colspan="3"> 오늘의 메뉴가 매일 다르고 매주 금요일 저녁에는 삼겹살이 무한리필이에요~!</td>
				</tr>
				<tr>
					<th>주차공간</th>
					<td>없음</td>
					<th>카테고리</th>
					<td>한식</td>
				</tr>
			</table>
			<button class="btn">업로드</button>
			<button class="btn">수정</button>
		</div>
		
	</div>
</body>
</html>