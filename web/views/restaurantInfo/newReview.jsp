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
	#star {
		width:35px;
		height:35px;
	}
	.starBox{
		vertical-align: bottom;
	}
	input[type=text]{
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		height: 35px;
		width: 35px;
	}
	.starText{
		font-size: 35px;
	}
</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
<% //if(loginUser != null) {%>
	<h1 style="margin-left: 200px; margin-top: 30px;">리뷰 등록</h1>
		<div class="box" align="center">
		<form action="<%=request.getContextPath() %>/insertReview.re"  method="post" enctype="multipart/form-data">
		<span>식당이름</span><span>에 대한 솔직한 리뷰를 써주세요.</span>
		<div class="starBox">
			<img src="/semiproject/images/Star.png" id="star"><input type="text"><span class="starText">/5</span>
		</div>
	
		</form>
		</div>
	<%//} else { %>
<!-- 	<script>
		alert("로그인 후 이용하시길 바랍니다.");
		document.location.href="/semiproject/views/signIn/signIn.jsp";
	</script> -->
	
	<%// } %>
	


<%@ include file="/views/common/footer.jsp" %>
</body>
</html>