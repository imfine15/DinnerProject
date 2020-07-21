<%@page import="com.kh.semi.board.model.vo.BoardUpVo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<HashMap<String, Object>> list2 = (ArrayList<HashMap<String, Object>>)session.getAttribute("list2");
	BoardUpVo board = (BoardUpVo)session.getAttribute("board");
	String boardNo = (String)session.getAttribute("boardNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<style>
	#commentBtn{
		background: #EB7673;
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 100px;
		height: 25px;
		font-size: 16px;
	}
</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
	<br><br>
	<div
		style="width: 80%; margin-left: auto; margin-right: auto; height: auto;"
		align="center">
		<div style="display: inline-block; margin-left: auto; margin-right: auto;">
			<img src="/semiproject/views/reviews/images/recommend.png" style="width: 200px;">
		</div>
		<div style="display: inline-block; font-size: 30px; margin-bottom: auto; margin-top: auto; font-family: Roboto; margin-left: auto; margin-right: auto; width: 430px;"><%=board.getBoardTitle() %></div>
		<div style="display: inline-block; font-size: 13px; margin-bottom: auto; margin-top: auto; font-family: Roboto; margin-left: auto; margin-right: auto;">
			<label>작성자 : <%=board.getMemberId() %></label> <label style="margin-right: -50px;">작성일 : <%=board.getUploadDate() %></label> 
			<a href=""><img
				src="/semiproject/views/reviews/images/good.png"
				style="margin-bottom: 20px; margin-right: 10px;"></a> <br> <br>
		</div>
			<hr style="width: 80%;">
			<br> <br>
	</div>
	<div
		style="width: 80%; margin-left: auto; margin-right: auto; padding-left: 30px;"
		align="center">
		<% for(int i = 0; i < list2.size(); i++){
			HashMap<String, Object> hmap = list2.get(i);
		
			%>
		<div style="width: 80%;">
			<div style="float: left; display: inline; padding-left: 30px; margin-bottom: 30px;">
				<img src="<%=request.getContextPath()%>/thumbnail_uploadFile/<%=hmap.get("changeName")%>" width="170px" height="auto">
			</div>
			<div style="padding-left: 20px; padding-top: 20px; width: 450px; text-align: left;">
				<p id="content<%=i%>"></p>
			</div>
			<a href=""><img src="/semiproject/views/reviews/images/boru.png"
				style="float: right;"></a>
		</div>
			<hr style="width: 80%;">
			<br> <br>
	<%} %>
		
			
	</div>

	<div
		style="width: 80%; margin-left: auto; margin-right: auto; padding-left: 30px;"
		align="center">
		<div style="width: 80%;">
			<div
				style="margin-left: auto; margin-right: auto; padding-left: 10px; float: left; margin-bottom: 40px;">
				<label style="font-size: 30px;">해시태그</label><br><br><label
					style="font-size: 14px; padding-left: 100px;"><%=board.getHashTags()%></label>
			</div>
			
		</div>
			<hr style="width: 80%;">
	</div>
	
	<div
		style="width: 80%; margin-left: auto; margin-right: auto; padding-left: 30px;"
		align="center">
		<div style="width: 80%;">
			<div
				style="margin-left: auto; margin-right: auto; padding-left: 10px; float: left;">
				<label style="font-size: 30px; float:left; padding-left:96px;">댓글(3)</label><br><br><br>
				<table id="replySelectTable" style="padding-left:130px; font-size:14px;">
					<tbody></tbody>
				</table>
			</div>
		</div>
			<hr style="width: 80%;">
			<br> <br>
	</div>
	<div style="background: lightgray; width:60%; height:200px; margin-left:auto; margin-right:auto; vertical-align: middle;">
		<div style="padding-top:85px; padding-left:50px;display:inline; float:left ">
			<label style="padding-right:30px; height:20px;">아이디이이</label>
		</div>
		<div style="display:inline; height:200px;">
			<textarea id="commentBox" style="width:60%; height:100px; margin-top:50px; resize: none;"></textarea>
			<button type="button" id="commentBtn">댓글달기</button>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
<%@ include file="/views/common/footer.jsp" %>
<script>
	$(document).ready(function() {
		var content = "<%=board.getBoardContent()%>";
		console.log(content);
		
		var contentArr = content.split('$$$');
		for(var i = 0; i < contentArr.length; i++){
			 $('[id="content' + i + '"]').text(contentArr[i]);
		}
	});
	
	
	/* 댓글달기 */
	$(function() {
		$("#commentBtn").click(function() {
			var boardNo = "<%=board.getBoardNo()%>";
			var memberNo = "<%=board.getMemberNo()%>";
			var content = $("#commentBox").val();
			
			$.ajax({
				url: "/semiproject/insertReply.bo",
				data: {boardNo: boardNo, memberNo: memberNo, content: content},
				type: "post",
				success: function(data) {
					var $replySelectTable = $("#replySelectTable tbody");
					$replySelectTable.html('');
					
					for(var key in data){
						var $tr = $("<tr>");
						var $idTd = $("<td>").text(data[key].memberId).css("width", "90px");
						var $contentTd = $("<td>").text(data[key].replyContent).css("width", "500px");
						var $noTd = $("<td>").css("width", "70px");
						var $dateTd = $("<td>").text(data[key].replyDate).css("width", "190px");
						
						$tr.append($idTd);
						$tr.append($contentTd);
						$tr.append($noTd);
						$tr.append($dateTd);
						
						$replySelectTable.append($tr);
						
						
						
					}
				},
				error: function(data) {
					console.log("실패");
				}
			});
			
			
		});
	});
</script>
</body>
</html>