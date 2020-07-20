<%@page import="com.kh.semi.board.model.vo.BoardUpVo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)session.getAttribute("list");
	BoardUpVo board = (BoardUpVo)session.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET 관리자페이지</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.hide {
	background-color: white;
	border: 0px;
	height: 30px;
}

#wrapper {
	width: 85%;
	height: 100%;
	margin-left: 230px;
	padding-top: 40px;
	padding-left: 30px;
}

#title-box {
	background: #F9F9F9;
	width: 100%;
	height: 50px;
	margin-bottom: 10px;
	padding-left: 10px;
	font-family: Noto Sans KR;
	font-size: 30px;
	font-weight: bolder;
}

#inner-box {
	width: 100%;
	height: auto;
}

#inner-wrap {
	padding-left: 50px;
	padding-right: 50px;
	background: white;
	width: 95%;
}

#send-btn {
	color: white;
	background-color: #E07370;
	border: none;
	width: 40px;
	height: 25px;
}

#sendcom-btn {
	color: white;
	background-color: #A0A0A0;
	border: none;
	width: 70px;
	height: 25px;
}

td {
	text-align: center;
}

#check-box {
	width: 50px;
}

#review-tb {
	border-collapse: collapse;
}

tr {
	border-bottom: 0.5px solid #9F9F9F;
	height: 40px;
}

#upload-btn {
	width: 60px;
	height: 24px;
	border: none;
	background: #E07370;
	border-radius: 2px;
	color: white;
	font-size: 15px;
}

#update-btn {
	width: 45px;
	height: 24px;
	border: none;
	background: #E07370;
	border-radius: 2px;
	color: white;
	font-size: 15px;
}

#delete-btn {
	width: 45px;
	height: 24px;
	border: none;
	background: #E07370;
	border-radius: 2px;
	color: white;
	font-size: 15px;
}

#search-btn {
	width: 53px;
	height: 24px;
	background: #C4C4C4;
	color:black;
	border:none;
}
.deleteBtn{
		background: red;
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 50px;
		height: 20px;
		font-size: 14px;
}
.updateBtn{
		background: #EB7673;
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 100px;
		height: 27px;
		font-size: 18px;
		margin-bottom: 50px;
}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div id="wrapper">
		<div id="title-box">
			<p>리뷰 게시글 관리</p>
			<br>
		</div>
		<div id="inner-wrap">
			<div id="inner-box">
					<div
		style="margin-left: auto; margin-right: auto; height: auto;"
		align="center">
		<div style="display: inline;">
			<img src="/semiproject/views/reviews/images/recommend.png" style="width: 200px;">
		</div>
		<input type="text" value="<%= board.getBoardTitle() %>"		
			style="width: 400px; display: inline; font-size: 30px; margin-bottom: auto; margin-top: auto; font-family: Roboto;"></input>
		<div
			style="display: inline; font-size: 13px; margin-bottom: auto; margin-top: auto; font-family: Roboto;">
			<div style="display: inline-block;"><label>작성자 : </label><label><%= board.getMemberId() %></label></div> 
			<div style="margin-right: -50px; display: inline-block;"><label>작성일 : </label><label><%=board.getUploadDate() %></label></div> <a href=""><img
				src="/semiproject/views/reviews/images/good.png"
				style="margin-bottom: 20px; margin-right: 10px;"></a> <br> <br>
			<hr style="width: 80%;">
			<br> <br>
		</div>
	</div>
	<div
		style="margin-left: auto; margin-right: auto; padding-left: 30px;"
		align="center">
		<% for(int i = 0; i < list.size(); i++){
			HashMap<String, Object> hmap = list.get(i);
		
			%>
		
		<div style="width: 80%;">
			<div style="float: left; display: inline; padding-left: 30px;">
				<img src="<%=request.getContextPath()%>/thumbnail_uploadFile/<%=hmap.get("changeName")%>" width="170px" height="auto">
			</div>
			<div style="padding-left: 20px; padding-top: 20px; width: 700px;">
				
				<textarea id="content<%=i%>" cols="50" rows="8" style="resize: none;"></textarea>
					<br> <br> <br> <br> <br> <br> <br>
			</div>
			<a href=""><img src="/semiproject/views/reviews/images/boru.png"
				style="float: right; margin-top: -40px; margin-right: 120px;"></a>
		</div>
			<hr style="width: 80%;">
			<br> <br>
	<%} %>


	</div>

	<div
		style="margin-left: auto; margin-right: auto; padding-left: 30px;"
		align="center">
		<div style="width: 80%;">
			<div align="center"
				style="margin-left: auto; margin-right: auto; padding-left: 10px;">
				<label style="font-size: 30px; float: left; margin-left: 80px;">해쉬태그</label><br><br> 
				<input type="text" value="#규카츠" style="width: 80px;">
				<input type="text" value="#보드게임" style="width: 80px;">
				<input type="text" value="#유키노하나" style="width: 80px;">
				
			</div>
			<br><br>
			<br> <br>
		</div>
			<hr style="width: 80%;">
	</div>
	
	<div
		style="margin-left: auto; margin-right: auto; padding-left: 30px;"
		align="center">
		<div style="width: 80%;">
			<div
				style="margin-left: auto; margin-right: auto; padding-left: 10px; float: left;">
				<label style="font-size: 30px; float:left; padding-left:96px;">댓글(3)</label><br><br><br>
				<table style="padding-left:130px; font-size:14px;">
					<tr>
						<td style="width:90px;"><label>dduddu123</label></td>
						<td style="width:500px;;"><label>다음주 주말에 친구들이랑 가봐야겠어요~ 추천 꾹! 누르고 갑니다~!</label></td>
						<td style="width:70px;">
						<td style="width:190px;"><label>2020-04-33</label><button class="deleteBtn">삭제</button></td>
						<td><br><br></td>
					</tr>
					<tr>
						<td style="width:90px;"><label>dduddu123</label></td>
						<td style="width:500px;;"><label>다음주 주말에 친구들이랑 가봐야겠어요~ 추천 꾹! 누르고 갑니다~!</label></td>
						<td style="width:70px;">
						<td style="width:190px;"><label>2020-04-33</label><button class="deleteBtn">삭제</button></td>
						<td><br><br></td>
					</tr>
					<tr>
						<td style="width:90px;"><label>dduddu123</label></td>
						<td style="width:500px;;"><label>다음주 주말에 친구들이랑 가봐야겠어요~ 추천 꾹! 누르고 갑니다~!</label></td>
						<td style="width:70px;">
						<td style="width:190px;"><label>2020-04-33</label><button class="deleteBtn">삭제</button></td>
						<td><br><br></td>
					</tr>
				</table>
			</div>
		</div>
			<hr style="width: 80%;">
			<br> <br>
	</div>
		<div align="center">
			<button class="updateBtn">수정하기</button>
		</div>
			</div>
		</div>
	</div>
<script>
	$(document).ready(function() {
		var content = "<%=board.getBoardContent()%>";
		console.log(content);
		
		var contentArr = content.split('$$$');
		for(var i = 0; i < contentArr.length; i++){
			 $('[id="content' + i + '"]').val(contentArr[i]);
		}
	});
</script>
</body>
</html>