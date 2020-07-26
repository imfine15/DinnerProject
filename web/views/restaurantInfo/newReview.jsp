<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<% if(loginUser != null) {%>
	<h1 style="margin-left: 200px; margin-top: 30px;">리뷰 등록</h1>
		<div class="box" align="center">
		<form action="<%=request.getContextPath() %>/insertReview.re"  method="post" enctype="multipart/form-data">
		<input type="hidden" name="memberNo" id="memberNo">
		<input type="hidden" name="enpNo" id="enpNo">
		<input type="hidden" name="reservationHistoryNo" id="reservationHistoryNo">
		<input type="hidden" name="visitDate" id="visitDate"> 
		<input type="hidden" name="reviewType" id="reviewType">
		<div align="left" class="foodNameBox">
		<span>방문한 식당에 대한 솔직한 리뷰를 써주세요.</span>
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
			<textarea rows="15" cols="100" id="reviewContent" name="reviewContent" placeholder=" <%=loginUser.getmName() %>님 주문하신 메뉴는 무엇인가요? 식당의 분위기와 서비스도 궁금해요!"></textarea>
			<div align="right" style="width: 717px" id="counter">(0/10000)</div>
		</div>
		<div align="left" class="fileBox">
			<input type="file" name="foodImg" class="foodImg">
		</div>
		<div>
			<button class="reviewBtn">리뷰 등록</button>
			<button type="button" class="cancleBtn" onclick="">취소</button>
		</div>
		</form>
		</div>
		<script>
			$(document).ready(function() {
				var para = location.href.split("?");
				var pa = para[1].split("&");
				var rhn = pa[0].split("=");
				var visitDate = pa[1].split("=");
				var reviewType = pa[2].split("=");
				var enpNo = pa[3].split("=");
				var visit = visitDate[1].split("%");
				var deCodeType = decodeURI(reviewType[1]);
				console.log(deCodeType);
				$("#enpNo").val(enpNo[1]);
				$("#reservationHistoryNo").val(rhn[1]);
				$("#visitDate").val(visit[0]);
				$("#reviewType").val(deCodeType);
				$("#memberNo").val("<%=loginUser.getmNo()%>");
				console.log(pa);
				console.log(rhn + ", " + visitDate + ", " + reviewType + ", " + enpNo);
				console.log("<%=loginUser.getmNo()%>");
			});
			
			$('#reviewContent').keyup(function (e){
			    var content = $(this).val();
			    $('#counter').html("("+content.length+"/10000)");    //글자수 실시간 카운팅

			    if (content.length > 10000){
			        alert("최대 10000자까지 입력 가능합니다.");
			        $(this).val(content.substring(0, 10000));
			        $('#counter').html("(10000/10000)");
			    }
			});


		
		</script>
	<%} else { %>
<!-- 	<script>
		alert("로그인 후 이용하시길 바랍니다.");
		document.location.href="/semiproject/views/signIn/signIn.jsp";
	</script> -->
	
	<% } %>
	


<%@ include file="/views/common/footer.jsp" %>
</body>
</html>