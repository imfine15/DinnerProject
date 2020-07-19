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
					<td>카드결제 금액 <br> <%=reser.getDeposit() %></td>
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
		<br><input type="checkbox" id="sub" ><label>상기 내용을 확인하고 동의합니다.</label>
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
</form>
<%@ include file="/views/common/footer.jsp" %>
<script>
	var IMP = window.IMP;
	IMP.init("imp12858574");
	
	function sub(){
		if($("#sub").is(":checked") != true){
			alert("동의란 체크가 필요합니다.");
			return false;
		} else {
			if(confirm("정말 취소하시겠습니까?")==true){
				      jQuery.ajax({
				        url: "http://www.myservice.com/payments/cancel",
				        type: "POST",
				        contentType: "application/json",
				        data: JSON.stringify({
				        	"merchant_uid": "mid_" + new Date().getTime(), // 주문번호
				            "cancel_request_amount": 1000, // 환불금액
				            "reason": "테스트 결제 환불" // 환불사유
				        }),
				        "dataType": "json"
				      });
				      
					  $.ajax('http://www.myservice.com/payments/cancel', async (req, res, next) => {
						    try {
						      /* 액세스 토큰(access token) 발급 */
						       const getToken = await axios({
       								 url: "https://api.iamport.kr/users/getToken",
       								 method: "post", // POST method
       								 headers: { 
        								  "Content-Type": "application/json" 
        								},
       								 data: {
        								  imp_key: "6231776324951366", // [아임포트 관리자] REST API키
        								  imp_secret: "TpIS8mJJE3SlLyHYZDz5WcM6pADhbqL4PtWYQGIuKBQv9xu8a3e6f1cFCQWNgIR6bO52vNwfpmLyUfH4" // [아임포트 관리자] REST API Secret
        								}
     								 });
						      
						      
						      /* ... 중략 ... */
						      /* 결제정보 조회 */
						      const { body } = req;
						      const { merchant_uid } = body; // 클라이언트로부터 전달받은 주문번호
						      $.ajax({ merchant_uid }, async function(err, payment) { 
						        if (err) {
						          return res.json(err);
						        }
						        
						        const { imp_uid } = $("#rNo").val();
						        const getCancelData = await axios({
						            url: "https://api.iamport.kr/payments/cancel",
						            method: "post",
						            headers: {
						              "Content-Type": "application/json",
						              "Authorization": access_token // 아임포트 서버로부터 발급받은 엑세스 토큰
						            },
						            data: {
						              reason, // 가맹점 클라이언트로부터 받은 환불사유
						              imp_uid, // imp_uid를 환불 고유번호로 입력
						              amount: cancel_request_amount
						            }
						          });
						          const { response } = getCancelData.data; // 환불 결과
						      
						      });
						    } catch (error) {
						      res.status(400).send(error);
						    }
						  });

			}else {
				return false;
			}
		}
	}
	var no = "<%=eNo%>";

</script>
</body>
</html>