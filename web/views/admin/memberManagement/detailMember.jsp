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
	th, td{
		border: 1px solid black;
		
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
		height:25px;
	}
	.info1{
		width: 180px; 
		height:43px; 
		border: 1px solid gray; 
		font-size: 17px; 
		background: rgba(196, 196, 196, 0.29); 
		display: inline-table;
		float:left;
		vertical-align: middle;
		padding-top: 10px;
		
	}
	.info2{
		width: 200px; 
		height:43px; 
		border: 1px solid gray; 
		font-size: 17px; 
		background: #FAFAFA; 
		text-align: left;
		display: inline-table;
		float:left;
		padding-left: 20px;
		padding-top: 10px;
	}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div style="width:85%; height:600px;margin-left: 230px; padding-top:40px; padding-left:30px;">
		<div style="background: #F9F9F9;width:100%; margin-bottom: 10px; height:50px; padding-left:10px;">
			<h1>회원관리</h1><br>
		</div>
		<div align="center" style="padding-left:50px; background: white; width:95%; height:800px; padding-top:50px;">
			<label style="font-size: 20px;">고객상세정보</label><br><br>

			<br><br>
			
			<div style="width:900px;">
				<div class="info1"><label>회원번호</label></div>
				<div class="info2"><label>00000001</label></div>
				<div class="info1"><label>이름</label></div>
				<div class="info2"><label>정용탁</label></div>
				
				<div class="info1"><label>아이디</label></div>
				<div class="info2"><label>taks22334</label></div>
				<div class="info1"><label>휴대폰번호</label></div>
				<div class="info2"><label>010-0622-0918</label></div>
				
				<div class="info1"><label>닉네임</label></div>
				<div class="info2"><label>paduck</label></div>
				<div class="info1"><label>보유포인트</label></div>
				<div class="info2"><label>0</label></div>
				
				<div class="info1"><label>이메일</label></div>
				<div class="info2"><label>taks22334@kh.or.kr</label></div>
				<div class="info1"><label>제재횟수</label></div>
				<div class="info2"><label>0</label></div>
				
				<div class="info1"><label>성별</label></div>
				<div class="info2"><label>여자</label></div>
				<div class="info1"><label>회원등급</label></div>
				<div class="info2"><label>일반</label></div>
				
				<div class="info1"><label>예약횟수</label></div>
				<div class="info2"><label>0</label></div>
				<div class="info1"><label>노쇼횟수</label></div>
				<div class="info2"><label>0</label></div>
				
				<div class="info1"><label>최근예약일</label></div>
				<div class="info2"><label>예약정보없음</label></div>
				<div class="info1"><label>가입일</label></div>
				<div class="info2"><label>2020/06/11</label></div>
				
				<div class="info1"><label>최근 방문일</label></div>
				<div class="info2"><label>2020/06/11</label></div>
				<div class="info1"><label>탈퇴 유무</label></div>
				<div class="info2"><label>N</label></div>
			</div>
		</div>
	</div>
</body>
</html>