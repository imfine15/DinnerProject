<%@page import="com.sun.org.glassfish.external.statistics.annotations.Reset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.payment.model.vo.*, java.util.*"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
	ArrayList<ReservationVO> list = (ArrayList<ReservationVO>)session.getAttribute("list"); 
	ArrayList<String> enpList = (ArrayList<String>) session.getAttribute("enpList");
	ArrayList<String> statusList = (ArrayList<String>) session.getAttribute("statusList");
	String eNo = request.getParameter("eNo");
	String rNo = request.getParameter("rNo");
	ReservationVO reser = null;
	for(int i = 0; i < list.size(); i++){
		if(rNo.equals(list.get(i).getrNo())){
			reser = list.get(i);
		}
	}
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String rDate = format.format(reser.getrDate());
	long reserDate = reser.getrDate().getTime();
	long sysDate = new Date().getTime();
	double time = (double)(reserDate - sysDate)/1000/60/60/24;
	System.out.println("reserDate : " + reserDate);
	System.out.println("sysDate : " + sysDate);
	System.out.println("time : " + time);
	
	int realdeposit = 0;
	if(time > 4.0){
		realdeposit = reser.getDeposit();
	} else if (time > 1.0){
		realdeposit = reser.getDeposit() / 2;
	} else {
		realdeposit = 0;
	}
	
	long testdeposit = (long)2000;
	if(time > 4.0){
		testdeposit = (long)2000;
	} else if (time > 1.0){
		testdeposit = (long)testdeposit / 2;
	} else {
		testdeposit = (long)0;
	}
	
	System.out.println("reser.getDeposit() : " + reser.getDeposit());
	System.out.println("realdeposit : " + realdeposit);
	System.out.println("testDeposit : " + testdeposit);
	String mNo = reser.getmNo();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
$.ajax({
	type: "post",
	url: "/semiproject/selectEnp.na",
	data:{
		eNo: "<%=eNo%>"
	},
	success: function(data){
		$("#eName").html(data);
	},
	error: function(){
	}
});
$.ajax({
	type: "post",
	url: "/semiproject/selectPay.na",
	data: {
		rNo: "<%=rNo%>",
	},
	success: function(data){
		$("#pNo").val(data.pNo);
		$("#pNo2").val(data.pNo);
	},
	error: function(){
		console.log("error");
	}
});
</script>
<style>
	.outer{
		width:100%; 
		height:850px;
	}
	.header{
	width:50%;  
	display:inline-block;
	margin-left: auto;
		margin-right: auto;
	}
	h3{
		font-size: 24px;
	}
	.inner{
		width: 70%;
		margin-left: auto;
		margin-right: auto;
	}
	th{
		background: #EB7673;
		color: white;
	}
	td{
		background: #FAFAFA;
		width: 230px;
		height: 200px;
		text-align: center;
	}
	.btn{
		
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 90px;
		height: 35px;
		font-size: 20px;
		margin: 50px;
	}
</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>

<div class="outer" align="center">
		<input id="pNo" type="hidden" value="">
		<div class="header" align="left">
			<h3>예약취소</h3>
		</div>
		<div class="inner">
			<table border="1">
				<tr>
					<th>예약 업체명</th>
					<th>예약 일자</th>
					<th colspan="2">예약 금액</th>
				</tr>
				<tr>
					<td id="eName"></td>
					<td><%=rDate %></td>
					<td>카드결제 금액 <br> <%=reser.getDeposit() %><br><br> 환불금액 <br><%=realdeposit %></td>
					<td>포인트 <br> <%=reser.getpAmount() %></td>
				</tr>
			</table>
		<div align="left">
			<pre>
* 이용 약관에 따라 현재 날짜로부터 예약 일자까지 남은 일 수에 대하여 환불 금액이 정해집니다.

* 예약 취소 환불 규정
             예약 당일로부터 4일 전 - 전액 환불 가능
             예약 당일로부터 3일 전 ~ 1일 전 - 50%환불 가능
             예약 당일로부터 24시간 전 - <label style="color: red;">환불 불가</label> 

* 기타 문의사항은 고객센터(010-3410-6215)로 연락하여 주시기 바립니다.</pre>
		</div>
		<div align="left">
		<br><input type="checkbox" id="sub1" ><label>상기 내용을 확인하고 동의합니다.</label>
		</div>
		<div>
			<button class="btn" style="background: #757575;">취소</button>
			<button onclick="sub();" type="button" class="btn" style="background: #EB7673;" >확인</button>
		</div>
		
		
	</div>

		</div>
<form name="deletereser" method="post" action="<%=request.getContextPath()%>/deleteReser.me">
	<input type="hidden" name="rNo" value="<%=rNo%>">
	<input type="hidden" name="mNo" value="<%=mNo%>">
	<input id="pNo2" type="hidden" name="pNo2" value="">
	<input type="hidden" value="<%=reser.getDeposit()%>" name="deposit">
	<input type="hidden" value="<%=realdeposit%>" name="realDeposit">
	<input type="hidden" value="<%=reser.getpAmount()%>" name="point">
</form>
<%@ include file="/views/common/footer.jsp" %>
<script>
	var IMP = window.IMP;
	IMP.init("imp12858574");
	
	function sub(){
		if($("#sub1").is(":checked") != true){
			alert("동의란 체크가 필요합니다.");
			return false;
		} else {
			if(confirm("정말 취소하시겠습니까?")==true){
				<%if(testdeposit != 0){%>
				      jQuery.ajax({
				          url: "/semiproject/cancel.na",
				          type: "POST",
				          data: {
				        	merchant_uid: $("#pNo").val(), // 주문번호
				            cancel_request_amount: <%=testdeposit%>, // 환불금액
				            reason: "테스트 결제 환불" // 환불사유
				        }
				      });
				      <%}%>
				document.deletereser.submit();
				console.log(123);
			}else {
				return false;
			}
		}
	}

</script>
</body>
</html>