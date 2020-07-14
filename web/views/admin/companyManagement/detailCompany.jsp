<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMMET 관리자페이지</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<style>
	table{
		border-collapse: collapse;
	}
	
	th{
		width: 180px; 
		height:45px; 
		border: 1px solid gray; 
		font-size: 17px; 
		background: rgba(196, 196, 196, 0.29); 
		vertical-align: middle;
		text-align: center;

	}
	td{
		width: 200px; 
		height:45px; 
		border: 1px solid gray; 
		font-size: 17px; 
		background: #FAFAFA; 
		vertical-align: middle;
		text-align: middle;
		padding-left: 10px;
	}
	.btn{
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 120px;
		height: 30px;
		font-size: 18px;
		margin: 20px;
		margin-top: 50px;
	}

</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div style="width:85%; height:600px;margin-left: 230px; padding-top:40px; padding-left:30px;">
		<div style="background: #F9F9F9;width:100%; margin-bottom: 10px; height:50px; padding-left:10px;">
			<h1>제휴업체관리</h1><br>
		</div>
		<div style="padding-left:50px; background: white; width:95%; height:800px; padding-top:50px;">
			<label style="font-size: 20px;">제휴업체상세정보</label><br><br>

			<br><br>
			
			<div style="width:850px; margin-left: auto; margin-right: auto;">
				<table style="width: 850px; vertical-align: middle;">
					<tr>
						<th>업체번호</th>
						<td>00000001</td>
						<th>사업자명</th>
						<td>정용탁</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>taks22334</td>
						<th>휴대폰번호</th>
						<td>010-0622-0913</td>
					</tr>
					<tr>
						<th>매장명</th>
						<td>paduck</td>
						<th>매장번호</th>
						<td>02-123-4545</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>taks22334@kh.or.kr</td>
						<th>제제횟수</th>
						<td>0</td>
					</tr>
					<tr>
						<th>예금주</th>
						<td>정용탁</td>
						<th>계좌번호</th>
						<td>123-332432-213(농협)</td>
					</tr>
					<tr>
						<th>1인당 예약금 상한선</th>
						<td>0</td>
						<th>1인당 예약금 하한선</th>
						<td>0</td>
					</tr>
					<tr>
						<th>예약건수</th>
						<td>무제한</td>
						<th>제휴종류</th>
						<td>프리미엄</td>
					</tr>
					<tr>
						<th>제휴일</th>
						<td>2020/06/11</td>
						<th>제휴여부</th>
						<td>N</td>
					</tr>
					
				</table>
			
			</div>
			
			<div align="center">
				<button class="btn" style="background: #EB7673;">정산 내역</button>
				<button class="btn" style="background: #FF0700;">제휴 해지</button>
				<button class="btn" style="background: #5EB8B4;">업체 제재</button>
			</div>
		</div>
	</div>
</body>
</html>