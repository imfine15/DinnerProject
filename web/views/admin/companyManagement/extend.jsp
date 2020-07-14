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
	table{
		border-collapse: collapse;
	}
	th{

		border: 1px solid gray; 


	}
		textarea{
	border-radius: 0;
	border: 1px solid gray;
	outline-style: none;
	resize: none;
	margin: 10px;
	}
	input{
	border-radius: 0;
	border: 1px solid gray;
	outline-style: none;
	margin: 10px;
	}

	.btn{
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 80px;
		height: 25px;
		font-size: 16px;
		margin: 20px;
		margin-top: 50px;
		
	}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div style="width:85%; height:600px;margin-left: 230px; padding-top:40px; padding-left:30px;">
		<div style="background: #F9F9F9;width:100%; margin-bottom: 10px; height:50px; padding-left:10px;">
			<h1>제휴연장</h1><br>
		</div>
		<div style="padding-left:50px; background: white; width:95%; height:800px; padding-top:50px;">
			<label style="font-size: 20px;">제휴해지</label><br><br>

			<br><br>
			
			<div style="width:850px; margin-left: auto; margin-right: auto;">
				<table>
					<tr>
						<td><label>제휴기간 : </label></td>
						<!-- 날짜고정해야함 -->
						<td><input type="date"> ~ <input type="date"></td>
					</tr>
					<tr>
						<td><label>제휴 해지 사유 : </label></td>
						<td><textarea cols="80" rows="8"></textarea></td>
					</tr>
					<tr>
						<td align="center" colspan="2"><button class="btn" style="background: red;">해지하기</button><button class="btn" style="background: gray;">취소</button></td>
					</tr>
				</table>
			</div>	
		</div>
	</div>
</body>
</html>