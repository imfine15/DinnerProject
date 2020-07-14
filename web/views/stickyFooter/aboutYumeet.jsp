<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET 가이드라인</title>
<style>

	.outer{
		width: 900px;
		margin-left: 200px;
		
	}
	#text{
		text-align: left;
		white-space: pre-wrap;
		line-height: 2.3em;
		font-family: 나눔손글씨펜;
		font-size: 10px;
		
	}
	.btn{
		background: #5BB8B4;
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 130px;
		height: 35px;
		font-size: 24px;
		margin: 30px;
		margin-left:25%;
	}
	#title{
		color : #DE7270;
	font-size: 36px;
	font-weight: bold;
	}
	h2{
		color:#DE7270;
		margin-left:20%;
		margin-left:20%;
	}
	#semiT{
		color:gray;
		font-weight:bolder;
		margin-left:20%;
	}
	.semiSemiT{
		margin-left: 20%;
		color:#DE7270;
		font-weight: bold;
		font-size: 20px;
	}
	.smallFont{
		margin-right: 30%;
		font-size:18px;
	}
	h4{
		margin-left: 20%;
	
	}
	#img1{
		border:1px solid black;
		margin-left: 20%;
	}
</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
<div align="center" class="outer">
<p id="title" align="left">
ABOUT US
</p>

<br>
<br>
<br>
<img id="img1" src="../../images/forAboutYum.jpg" width="600px" height="300px">
<h2>"가슴이 너무 아픕니다(주접주접)"</h2>
<p id="semiT">내용 넣으면 되는데 조금 있어보이려고<br>일단 채워넣어둘게요</p>
<br>
<br>
<br>
<h4>CONTACT</h4>
<br>
<br>
<p align="left" class="semiSemiT">
전화번호
</p>
<p class="smallFont">010-1234-1234</p>
<br>
<p align="left" class="semiSemiT">
식당등록 및 정보 수정 문의
</p>
<p class="smallFont">yumeet@yum.com</p>
<br>
<p align="left" class="semiSemiT">
광고 문의
</p>
<p class="smallFont">yumeetAD@yum.com</p>
<br>
<p align="left" class="semiSemiT">
기타 문의
</p>
<p class="smallFont">yumeetES@yum.com</p>
<br>
<p align="left" class="semiSemiT">
채용 관련 메일
</p>
<p class="smallFont">yumJob@yum.com</p>


<br>
<br>
<br>
<br>
<br>
<br>
<h4>HISTORY</h4>
<br>
<br>
<p align="left" class="semiSemiT">
2020
</p>
<p class="smallFont">04.19&nbsp;&nbsp;&nbsp;<a style="font-size:14px; color:#DE7270;">세미 프로젝트</a></p>
<br>
<p class="smallFont">06.18&nbsp;&nbsp;&nbsp;<a style="font-size:14px; color:#DE7270;">배가 고픕니다</a></p>
<br>
<p class="smallFont">07.01&nbsp;&nbsp;&nbsp;<a style="font-size:14px; color:#DE7270;">저녁 뭐먹나요</a></p>
<br>
<p class="smallFont">07.03&nbsp;&nbsp;&nbsp;<a style="font-size:14px; color:#DE7270;">여밋소개 제작</a></p>
<br>
<!-- <br>
<p align="left" class="semiSemiT">
회사 주소
</p>
<p class="smallFont">     사랑시 고백구 행복동 너에게로 486</p> -->

<button class="btn">확인</button>
</div>
<br><br><br><br>


<%@ include file="/views/common/footer.jsp" %>
</body>
</html>