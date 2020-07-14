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
		width: 80%;
	}
	
	td{
		text-align: left;
	}
	input{
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		margin-bottom: 10px;
		margin-top: 10px;
		height: 23px;
	}
	textarea{
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		resize: none;
		margin-bottom: 10px;
		margin-top: 10px;
	}
	select{
		margin-bottom: 10px;
		margin-top: 10px;
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		height: 25px;
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

	.title{
		text-align: left;
	}
		.btn{
		
 		color: #FFFFFF;
		border: 0;
		outline: 0;
		height: 30px;
		font-size: 16px;
		margin-top: 20px;
		
	}
	#downBtn{
		background: lightgray;
		color: #FFFFFF;
		border: 0;
		outline: 0;
		height: 60px;
		font-size: 14px;
	}
	
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div class="outer" align="center">
		<div class="header" align="left">
			<h1>회원 신고 내역</h1><br>
		</div>
		<div class="inner">
			
			<table>
				<tr>
					<td width="250px">ID</td>
					<td>paduck123</td>
					<td>고객명</td>
					<td>정파덕</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><input size="100" type="text" placeholder="닭갈비 관련 게시글 신고합니다" disabled></td>
				</tr>
				<tr>
					<td>신고당한 게시글</td>
					<td colspan="3"><input size="100" type="text" placeholder="울부짖어라, ‘닭갈비'" disabled></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3"><textarea cols="101" rows="7" placeholder="게시글이 광고인 것 같아요. 저는 너무 맛이 없었는데 닭갈비가 맛있대요!
참고로 저는 닭고기를 먹지 않습니다." disabled></textarea></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td colspan="2"><textarea cols="90" rows="5" placeholder="캡쳐.png" disabled></textarea></td>
					<td><button id="downBtn">첨부파일다운</button></td>
				</tr>
				<tr>
					<td rowspan="2">답변 전송 연락처</td>
					<td colspan="3"><input type="email" placeholder="paduck123@kh.co.kr" disabled></td>
				</tr>
				<tr>
					<td colspan="3"><input type="tel" placeholder="010-2222-3333" disabled></td>
				</tr>
				<tr>
					<td>답변 처리</td>
					<td colspan="3">
						<select>
							<option>게시글 유지</option>
							<option>게시글 삭제</option>
							<option>유저탈퇴</option>
							<option>유저제재</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>답변 내용</td>
					<td colspan="3"><textarea cols="100" rows="7"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;"><button class="btn"style="background: #E07370; margin-right: 100px; width: 150px;">답변 전송 및 처리</button></td>
					<td colspan="2"><button class="btn" style="background: gray; width: 80px;">취소</button></td>
				</tr>
			</table>
			
		</div>
		
	</div>
</body>
</html>