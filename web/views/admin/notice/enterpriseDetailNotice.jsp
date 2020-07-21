<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semi.notice.model.vo.*"%>
<% EntNoticeVO notice = (EntNoticeVO) request.getAttribute("eNotice"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET 관리자페이지</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<style>
table {
	border-collapse: collapse;
}

tr {
	border-bottom: 1px solid #CBCDD1;
	height:50px;
}

.btn {
	color: #FFFFFF;
	border: 0;
	outline: 0;
	width: 60px;
	height: 25px;
	font-size: 14px;
	margin-top: 20px;
	float: right;
	margin-left: 10px;
}
#btnArea {
	margin-top:30px;
	margin-right:250px;
}
#goEntNotice:link,#goEntNotice:visited, #goEntNotice:active, #goEntNotice:hover {
	text-decoration:none; color:black;
	text-decoration:none; color:black;
	text-decoration:none; color:black;
	text-decoration:none; color:black;
}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
<div style="width:80%; height:600px;margin-left: 230px; padding-top:40px; padding-left:30px;">
		<div style="background: #F9F9F9;width: 100%; margin-bottom: 10px; height:50px; padding-left:10px; padding-right:10px;">
			<h1><a id="goEntNotice" href="<%=request.getContextPath()%>/selectElist.no" target = "_self">업체 공지사항</a></h1><br>
		</div>
		<div align="center" style="padding-left:10px; padding-right:10px; background: white; width:100%; padding-top: 30px; height: 80%;">
			<form>
			<table>
				<tr>
					<td style=" font-weight:bolder;"width="850px"><label style="margin-left:30px;"><%=notice.getNoticeTitle() %></label></td>
					<td style="font-size:14px; color:#757575;"width="200px" align="center"><label style="float:right;margin-right:20px; vertical-align:middle;" ><%=notice.getNoticeDate() %></label></td>
				</tr>
				<tr>
					<td colspan="2" style="padding-top:20px; padding-bottom:20px;">
					<label style="margin-left:30px;"><%=notice.getNoticeContent() %></label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					
					</td>
				</tr>
			</table>
			</form>
			<div id="btnArea">
			<button class="btn" style="background: #5BB0AC;" onclick="update();">수정</button>
			<button class="btn" style="background: #C4C4C4;" onclick="deleteNotice();">삭제</button>
			<button class="btn" style="background: #E07370;" onclick="location.href='<%=request.getContextPath()%>/views/admin/notice/enterpriseUploadNotice.jsp'">글쓰기</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		function update() {
			
		}
		
		function deleteNotice() {
			if(confirm("정말 삭제하시겠습니까?") == true) {
				
			} else {
				return;
			}
			
		}
		
	</script>
</body>
</html>