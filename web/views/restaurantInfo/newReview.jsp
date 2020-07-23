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
	.box{
		height: 600px;
	}
	#star {
		width:35px;
		height:35px;
	}
	.starBox{
		vertical-align: bottom;
		width: 359px;
		display: inline-block;
	}
	input[type=text]{
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		height: 35px;
		width: 45px;
		text-align: center;
		font-size: 30px;
	}
	textarea{
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		resize: none;
	}
	textarea::placeholder{
		font-weight: bold;
		font-size: 15px;
		line-height: 2em;
	}
	.starText{
		font-size: 35px;
	}
	.foodNameBox{
		width: 359px;
		display: inline-block;
	}
	.foodName{
		line-height: 2em;
		color: #D5706D;
		font-size: 25px;
		font-weight: bold;
	}
	.fileBox{
		width: 717px;
		margin-top: 30px;
		margin-bottom: 50px;
	}
	.reviewBtn{
		background: #5BB8B4;
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 130px;
		height: 35px;
		font-size: 24px;
		margin: 10px;
	}
	.cancleBtn{
		background: gray;
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 130px;
		height: 35px;
		font-size: 24px;
		margin: 10px;
	}
</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
<% //if(loginUser != null) {%>
	<h1 style="margin-left: 200px; margin-top: 30px;">리뷰 등록</h1>
		<div class="box" align="center">
		<form action="<%=request.getContextPath() %>/insertReview.re"  method="post" enctype="multipart/form-data">
		<%-- <input type="hidden" name="mamberNo" value="<%=loginUser.getmNo()%>">
		<input type="hidden" name="enpNo" value="<%=%>">
		<input type="hidden" name="reservationHistoryNo" value="<%=%>">
		<input type="hidden" name="visitDate" value="<%=%>"> 
		<input type="hidden" name="reviewType" value=<%=%>"> --%>
		<div align="left" class="foodNameBox">
		<span class="foodName">식당이름</span><span>에 대한 솔직한 리뷰를 써주세요.</span>
		</div>
		<div align="right" class="starBox">
			<table>
				<tr>
					<td><img src="/semiproject/images/Star.png" id="star"></td>
					<td><input type="text" name="averageRating" id="averageRating"></td>
					<td><span class="starText">/5</span></td>
				</tr>
			</table>
		</div>
		<div class="textBox">
			<textarea rows="15" cols="100" name="reviewContent" placeholder=" 이름님 주문하신 메뉴는 무엇인가요? 식당의 분위기와 서비스도 궁금해요!"></textarea>
			<div align="right" style="width: 717px">0/10000</div>
		</div>
		<div align="left" class="fileBox">
			<input type="file" name="foodImg" class="foodImg">
		</div>
		<div>
			<button class="reviewBtn">리뷰 등록</button>
			<button class="cancleBtn">취소</button>
		</div>
		</form>
		</div>
		<script>
			
		</script>
	<%//} else { %>
<!-- 	<script>
		alert("로그인 후 이용하시길 바랍니다.");
		document.location.href="/semiproject/views/signIn/signIn.jsp";
	</script> -->
	
	<%// } %>
	


<%@ include file="/views/common/footer.jsp" %>
</body>
</html>