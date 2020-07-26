<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<title>YUMEET 비밀번호 찾기</title>
<style>
	#outer {
		text-align:center;
		padding-top:20px;
		padding-bottom:70px;
	}

	#logo {
		display:block;
		margin:0 auto 0 546px;
		width:287px;
		height:120px;
	}
	
	#requestTable tr td input {
		width:200px;
		height:30px;
	}
	
	#submitBtn {
		background-color:#EB7673;
		color:white;
		border:0;
		width:208px;
		height:30px;
	}
	
	#submitBtn:hover {
		cursor:pointer;
	}
	
	#result {
		width:300px;
		height:50px;
		color:#808080;
		font-size:15px;
		margin:20px auto 10px auto;
	}
</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
<div id="outer">
	<img alt="여밋 로고" src="/semiproject/images/YUMEET LOGO WITH REST.png" id="logo">
	<p>YUMEET 비밀번호 찾기</p>
	<form method="post" action="<%= request.getContextPath() %>/changePwd.se" onsubmit="return check();">
		<table align="center" id="requestTable">
			<tr>
				<td><input type="text" id="requestId" name="requestId" placeholder="아이디를 입력해주세요"></td>
			</tr>
			<tr>
				<td><input type="text" id="requestName" name="requestName" placeholder="이름을 입력해주세요"></td>
			</tr>
			<tr>
				<td><input type="email" id="requestEmail" name="requestEmail" placeholder="이메일을 입력해주세요"></td>
			</tr>
		</table>
		<input type="hidden" name="password" value="" id="requestPassword">
		<input type="hidden" name="alertPassword" value="" id="alertPassword">
		<input type="submit" value="비밀번호 찾기" id="submitBtn">
	</form>
	<p id="result"></p>
</div>
<script>
	var randomPassword = Math.random().toString(36).substr(2,11);
	
	$(function() {
		$("#requestPassword").val(randomPassword);
		$("#alertPassword").val(randomPassword);
	});

	flag = false;
	
	function check() {
		if($("#requestId").val() === "") {
			$("#result").html("아이디는 비어있을 수 없습니다.");
			return false;
		} else if($("#requestName").val() === "") {
			$("#result").html("이름은 비어있을 수 없습니다.");
			return false;
		} else if($("#requestEmail").val() === "") {
			$("#result").html("이메일은 비어있을 수 없습니다.");
			return false;
		}
		
		$.ajax({
			url: "/semiproject/findPwd.se",
			type: "post",
			async: false,
			data: {requestId: $("#requestId").val(), requestName: $("#requestName").val(), requestEmail: $("#requestEmail").val()},
			success: function(data) {
				if(data === 0) {
					$("#result").html("정보에 맞는 회원정보가 없습니다.<br>다시 한 번 확인해주세요.");
					flag = false;
				} else if(data === 1) {
					flag = true;
				}
			}
		});
		
		return flag;
	}
</script>	

<%@ include file="/views/common/footer.jsp" %>
</body>
</html>