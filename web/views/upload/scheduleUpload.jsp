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
 .line{
 	width: 1000px;
 }
 .namelable{
 	display: inline-block;
 }
 .btn{
 	
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 130px;
		height: 35px;
		font-size: 24px;
		margin: 10px;
 }
 
 #btn1{
 	background: #5bb8b4;
 }
 #btn2{
 	background: #C4C4C4;
 }
 #btn3{
 	background: #666666;
 }
 #btnadd{
 		background: #EF9996;
 		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 120px;
		height: 30px;
		font-size: 20px;
		margin: 20px;
		
 }
 #btndel{
 		background: #C9C9C9;
 		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 120px;
		height: 30px;
		font-size: 20px;
		margin: 20px;
 }
 #textlabel{
 	margin-right: 500px;
 }
 input[type=checkbox]{
 	margin-right: 10px;
 }
 .area{
 	resize: none;
 }
 label, input, textarea{
 margin-bottom: 10px;
		margin-top: 10px;
 }
 h1{
 	margin-left: 200px;
 	margin-top: 30px;
 }
 	input[type=text]{
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		height: 20px;
	}
	textarea{
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
	}
	select{
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		height: 20px;
	}
 
</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
	<h1>일정 및 맛집 등록</h1>
	<div align="center">
		<hr class="line">
		<div align="left"  class="namelable">
		<label>ID</label>
		</div>
		<div align="right" class="namelable">
		<label>고객명</label>
		</div>
		<br>
		<hr class="line">
		<div style="margin-bottom: 80px;">
			<form action="">
				<table>
					<tr>
						<td width="70px;">제목</td>
						<td><input type="text" size="98px;" placeholder="제목을 입력하세요."></td>
						
					</tr>
					
					<tr>
						<td width="70px;">내용</td>
						<td><textarea cols="100px" rows="20px" class="area" 
						placeholder="
※ 업로드시 내용은 200글자 이상, 사진은 3장 이상이여야 업로드 가능합니다.

※ 게시 후 1주일 이내에는 삭제 및 수정 불가."></textarea></td>
					</tr>
				</table>
				
					<button id="btnadd">추가하기</button>
					<button id="btndel">삭제하기</button>
				<hr class="line">
				<table>
					<tr>
						<td width="70px;">해시태그</td>
						<td><textarea rows="7px" cols="100px" class="area" placeholder="#을 이용하여 태그를 사용해보세요(최대 30개)"></textarea></td>
					</tr>
				</table>
				<hr class="line">
				<br>
				<input type="checkbox"><label id="textlabel">부정평가 처리방침 동의</label><br><br>
				<label>※부정한 평가로 의심 또는 판단되는 계정, 식당, 평가는 별도 통보 없이 제재가 있을 수 있습니다.</label><br>
				<br><br>
				<button class="btn" id="btn1">접수</button>
				<button class="btn" id="btn2">임시저장</button>
				<button class="btn" id="btn3">취소</button>
			</form>
		</div>
	</div>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>