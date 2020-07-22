<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.enterprise.model.vo.EnpAttachment"%>
<%@page import="com.kh.semi.enterprise.model.vo.EnpUpVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	EnpUpVo eu = (EnpUpVo)session.getAttribute("enpUp");
	ArrayList<EnpAttachment> fileList = (ArrayList<EnpAttachment>)request.getAttribute("fileList");
	EnpAttachment ea = (EnpAttachment)session.getAttribute("ea");
	if(fileList != null){
		ea = fileList.get(0);
	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET 관리자페이지</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	table{
		border-collapse: collapse;
		width: 80%;
		border: 1px solid gray;
	}
	tr{
		border-bottom: 1px solid gray;
	}
	th{
		background: #EE8E8C;
		width: 100px;
		height: 50px;
		color: white;
		border-right: 1px solid gray;
		border-left: 1px solid gray;
	}
	td{
		padding-left: 5px;
	}
	
	
	.btn{
		
 		color: #FFFFFF;
		border: 0;
		outline: 0;
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
		 height: 1000px;
		 margin-left: auto;
		 margin-right: auto;
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
		resize: none;
	}
	select{
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		height: 20px;
	}

	#titleImg{
		width: 300px;
		height: auto;
	}
	
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div class="outer" align="center">
		<div class="header" align="left">
			<h1>가게 등록 요청</h1><br>
		</div>
		
		<div class="inner">
			<form action="<%=request.getContextPath()%>/updateEnt.up" method="post" enctype="multipart/form-data">
			<input id="aaa" type="hidden" value="<%=eu.getEnpNo()%>" name="enpNo">
			<input type="hidden" value="<%=ea.getOriginName()%>" name="originName">
			<input type="hidden" value="<%=ea.getFilePath()%>" name="filePath">
			<input type="hidden" value="<%=ea.getChangeName()%>" name="changName">
			<h3>입점 가게 상세 정보</h3>
			
			<table>
				<tr>
					<th>식당명</th>
					<td><input type="text" name="enpName" value="<%= eu.getEnpName() %>"></td>
					<th>신청 날짜</th>
					<td><input type="text" name="uploadApproval" value="<%= ea.getUploadDate() %>"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3"><input type="text" name="enpAddress" value="<%= eu.getEnpAddress() %>"></td>
				</tr>
				<tr>
					<th>웹사이트</th>
					<td colspan="3"><input type="text" name="website" value="<%= eu.getWebsite()%>"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="enpPhone" value="<%= eu.getEnpPhone() %>"></td>
					<th>가격대</th>
					<td>
						<select name="priceRange" id="priceRange">
							<option value="~1만원대">~1만원대</option>
							<option value="1만원 ~ 2만원">1만원 ~ 2만원</option>
							<option value="2만원 ~ 3만원">2만원 ~ 3만원</option>
							<option value="3만원 ~ 5만원">3만원 ~ 5만원</option>
							<option value="5만원 ~ 7만원">5만원 ~ 7만원</option>
							<option value="7만원대~">7만원대~</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>메뉴</th>
					<td colspan="3"><input type="text" name="menuName" value="<%= eu.getMenuName() %>">  <input type="text" name="menuPrice" value="<%= eu.getMenuPrice() %>">원</td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td><input type="text" name="enpHour" value="<%= eu.getEnpHour() %>"></td>
					<th>휴무일</th>
					<td><input type="text" name="closedDay" value="<%= eu.getClosedDay() %>"></td>
				</tr>
				<tr>
					<th>해쉬태그</th>
					
					<td colspan="3"><input type="hidden" value="" id="ds" name="hash">
					<input type="button" onclick="dd();"><input type="text" id="h" name="hashTags" value="<%= eu.getHashTags() %>"></td>
					
					
				</tr>
				<tr>
					<th>소개문구</th>
					<td colspan="3"><textarea name="introduce" rows="5px" cols="22px"><%= eu.getIntroduce() %></textarea></td>
				</tr>
				<tr>
					<th>주차공간</th>
					<td>
					<select name="parkingPossible" id="parkingPossible">
					<option value="주차가능">주차가능</option>
					<option value="주차공간없음">주차공간없음</option>
					</select>
					</td>

					<th>카테고리</th>
					<td>
						<select name="enpType" id="enpType">
							<option value="한식">한식</option>
							<option value="중식">중식</option>
							<option value="일식">일식</option>
							<option value="패스트푸드">패스트푸드</option>
							<option value="양식">양식</option>
							<option value="카페">카페</option>
							<option value="분식">분식</option>
							<option value="아시아">아시아</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>사진파일</th>
					<td colspan="3">
					<img id="titleImg" src="<%=request.getContextPath()%>/thumbnail_uploadFile/<%=ea.getChangeName()%>">
					<input type="file" name="updateFile" onchange="loadImg(this,1);">
					</td>
				</tr>
			</table>
			<button type="button" class="btn" style="background: #E07370; width: 90px;">업로드</button>
			<button type="submit" class="btn" style="background: #E07370; width: 90px;">수정</button>
		</form>
		</div>
		<script>
		$(document).ready(function(){
			$("#priceRange option[value='<%= eu.getPriceRange() %>']").attr("selected", true);
		    $("#enpType option[value='<%= eu.getEnpType() %>']").attr("selected", true);
		    $("#parkingPossible option[value='<%= eu.getParkingPossible() %>']").attr("seleted", true);
		});

	


		</script>
		<script type="text/javascript">
	console.log("<%=eu%>");
	console.log("<%=ea%>");
	console.log("<%=fileList%>");
	console.log("<%=ea.getChangeName()%>");
	
	function dd() {
		console.log("h : "+$("#h").val());
		$("#ds").val($("#h").val());
		console.log("ds : " + $("#ds").val());
		 
		console.log("aaa : " + $("#aaa").val());
		console.log("<%=eu.getEnpNo()%>");
	} 
	function loadImg(value, num) {
		if(value.files && value.files[0]){
			var reader = new FileReader();
			
			reader.onload = function(e) {
				
				
				
				switch(num){
				
				case 1 : $("#titleImg").attr("src", e.target.result); break;
				
				
				}
				
				
			}
			
			reader.readAsDataURL(value.files[0]);
		}
	}
	
</script>
	</div>
</body>
</html>