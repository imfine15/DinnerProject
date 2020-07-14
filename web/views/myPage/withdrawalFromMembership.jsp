<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.text{
		color: #313333;
		font-size: 18px;
		font-weight: 550;
	}
	.text2{
		color: #8E8E8E;
		font-size: 14px;
	}
	.text3{
		color: #CC371B;
		font-size: 14px;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<form>
	<div style="width:50%; height:900px; padding-top: 30px; margin-left:auto; margin-right: auto;">
		<div style="width:100%;" align="center"><img src="/semiproject/images/YUMEET LOGO WITH REST.png" ></div>
		<h1 style="font-weight: 550; margin-bottom: 0px;">탈퇴 안내</h1>
		<h3 style="font-weight: 500; color: #8E8E8E; margin-top: 10px;">회원 탈퇴 전 안내사항을 꼭 확인 해주세요!</h3>
		<hr>
		<div style="padding-bottom:5px;">
			<label class="text">사용하고 계신 아이디(</label><label style="color: #DE7270; font-size: 18px;">infine</label><label class="text">)</label>
			<label class="text">은 탈퇴후 30일이 지날 경우 복구가 불가능 합니다.</label>
		</div>
		<label class="text2">30일이 지날 경우</label><label style="color: #D24E34"> 복구</label><label class="text2">가 불가하오니 신중하게 선택하시기 바랍니다.</label>
		<br><br><br><br>
		
		<div style="padding-bottom:5px;">
			<label class="text">탈퇴 후 2년이 지날 경우 회원 정보 및 서비스 이용 기록은 모두 삭제됩니다.</label>
		</div>
		<label class="text2">회원 정보 및 서비스 이용 기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</label>
		<br><br><br><br>
		
		<div style="padding-bottom:5px;">
			<label class="text">탈퇴 후에도 게시물 서비스에 등록한 게시글은 그대로 남아 있습니다.</label>
		</div>
		<label class="text2">코스 리뷰 및 맛집 리뷰 등에 올린 게시글 및 댓글은 탈퇴 후에도 그대로 남아 있습니다.</label><br>
		<label class="text2">삭제가 원하는 게시글이 있을 경우</label><label style="color: #D24E34; font-size: 14px;">반드시 탈퇴 전 삭제</label><label class="text2">하시기 바랍니다.</label><br>
		<label class="text2">탈퇴 후에는 본인 여부를 확인할 수 있는 방법이 없어, </label><label style="color: #D24E34; font-size: 14px;">게시글을 임의로 삭제</label><label class="text2">할 수 없습니다.</label>
		<br><br><br>
		<hr><br>
		<label class="text3">탈퇴 후에는 아이디 </label><label style="color: #60ABA7; font-size: 14px;">infine</label><label class="text3"> 으로 다시 가입할 수 없으며, 30일이 지난 경우 아이디와 데이터는 복구 할 수 없습니다.</label><br>
		<label class="text3">게시물이 남아 있는 경우 탈퇴 후 삭제가 불가능합니다.</label>
		<br><br>
		<input type="checkbox"><label style="font-size: 14px;">안내 사항을 모두 확인 하였으며, 이에 동의 합니다.</label><br><br>
		<div align="center">
		<input type="submit" value="확인" style="width:100px; height:40px; background: white; color: #DE7270; border: 1px solid #989797; font-size: 20px;"> 
		</div>
	</div>
	</form>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>