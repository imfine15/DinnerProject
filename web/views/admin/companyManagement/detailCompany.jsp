<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.enterprise.model.vo.PartnerEnpVO"%>
<% PartnerEnpVO pe = (PartnerEnpVO) request.getAttribute("partnerEnp"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMMET 관리자페이지</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<style>
table {
	border-collapse: collapse;
}

th {
	width: 180px;
	height: 45px;
	border: 1px solid gray;
	font-size: 17px;
	background: rgba(196, 196, 196, 0.29);
	vertical-align: middle;
	text-align: center;
}

td {
	width: 200px;
	height: 45px;
	border: 1px solid gray;
	font-size: 17px;
	background: #FAFAFA;
	vertical-align: middle;
	text-align: middle;
	padding-left: 10px;
}

.btn {
	color: #FFFFFF;
	border: 0;
	width: 120px;
	height: 30px;
	font-size: 18px;
	margin: 20px;
	margin-top: 50px;
}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div style="width:85%; height:600px;margin-left: 230px; padding-top:40px; padding-left:30px;">
		<div style="background: #F9F9F9;width:100%; margin-bottom: 10px; height:50px; padding-left:10px;">
			<h1>제휴업체관리</h1><br>
		</div>
		<div style="padding-left:50px; background: white; width:95%; height:800px; padding-top:50px;">
			<label style="font-size: 20px;">제휴업체상세정보</label><br><br>

			<br><br>
			
			<form>
			<div style="width:850px; margin-left: auto; margin-right: auto;">
				<table style="width: 850px; vertical-align: middle;">
					<tr>
						<th>업체번호</th>
						<td><%=pe.getEnpNo() %></td>
						<th>사업자명</th>
						<td><%=pe.getPartnerName() %></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><%=pe.getPartnerId() %></td>
						<th>휴대폰번호</th>
						<td><%=pe.getEnpPhone() %></td>
					</tr>
					<tr>
						<th>매장명</th>
						<td><%=pe.getEnpName() %></td>
						<th>매장번호</th>
						<td>02-123-4545</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><%=pe.getPartnerEmail() %></td>
						<th>제제횟수</th>
						<td><%=pe.getPenaltyCount() %></td>
					</tr>
					<tr>
						<th>예금주</th>
						<td><%=pe.getAccountHolder() %></td>
						<th>계좌번호</th>
						<td><%=pe.getBankAccount() %></td>
					</tr>
					<tr>
						<th>1인당 예약금 상한선</th>
						<td><%=pe.getDepositLower() %></td>
						<th>1인당 예약금 하한선</th>
						<td><%=pe.getDepositLower() %></td>
					</tr>
					<tr>
						<th>예약건수</th>
						<td><%=pe.getReservationCount() %></td>
						<th>제휴종류</th>
						<td><%=pe.getProductName() %></td>
					</tr>
					<tr>
						<th>제휴일</th>
						<td><%=pe.getContractStartDate() %></td>
						<th>제휴여부</th>
						<td><%=pe.getSignUpApproval() %></td>
					</tr>
					
				</table>
			<div align="center">
			
				<button class="btn" style="background: #EB7673;">정산 내역</button>
				<button class="btn" type="button" onclick="location.href='<%=request.getContextPath()%>/delete.pc?no=<%=pe.getEnpNo()%>'" style="background: #FF0700;">제휴 해지</button>
				<button class="btn" style="background: #5EB8B4;">업체 제재</button>
				</div>
			</div>
			</form>
			
		</div>
	</div>
</body>
</html>