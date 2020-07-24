<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>YUMEET 아이디 찾기</title>
<style>
	#outer {
		text-align:center;
		padding-top:20px;
		padding-bottom:70px;
	}

	#logo {
		display:block;
		margin:0 auto 0 576px;
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
	<p>YUMEET 아이디 찾기</p>
	<table align="center" id="requestTable">
		<tr>
			<td><input type="text" id="requestName" name="requestName" placeholder="이름을 입력해주세요"></td>
		</tr>
		<tr>
			<td><input type="email" id="requestEmail" name="requestEmail" placeholder="이메일을 입력해주세요"></td>
		</tr>
	</table>
	<input type="submit" value="아이디 찾기" id="submitBtn" onclick="check();">
	<p id="result"></p>
</div>
<script>
	function check() {
		$.ajax({
			url: "/semiproject/findId.me",
			type: "post",
			data: {requestName: requestName, requestEmail: requestEmail},
			success: function(data) {
				if($("#requestName").val() === "") {
					$("#result").html("이름은 비어있을 수 없습니다.");
				} else if($("#requestEmail").val() === "") {
					$("#result").html("이름은 비어있을 수 없습니다.");
				} else if(data === null) {
					$("#result").html("정보에 맞는 아이디가 없습니다.<br>다시 한 번 확인해주세요.");
				} else if(data !== null) {
					$("#result").html("아이디는" + data + "입니다.");
				}
			}
		});
	}
</script>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>