<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/semiproject/views/signUp/css/signUpStyle.css"/>
<title>회원가입</title>
</head>
<body>
	<img alt="여밋 로고" src="/semiproject/images/YUMEET LOGO WITH REST.png" id="logo">
	<p id="welcome"><span id="logo1">YU</span><span id="logo2">MEET</span>에 오신 것을 환영합니다!</p>
	<p id="caution">모든 정보는 필수 입력 사항입니다</p>
	<form action="<%= request.getContextPath() %>/signUp.me" method="post" onsubmit="return check();">
		<table>
			<tr>
				<td colspan="3">아이디<br><span class="notice">아이디는 특수문자 없이 4 ~ 20글자 영어 대소문자와 숫자만 가능합니다.</span></td>
			</tr>
			<tr>
				<td colspan="3"><input type="text" name="id" id="id" size="20"></td>
				<td colspan="1"><p id="idCheck">아이디<br>중복확인</p></td>
			</tr>
			<tr>
				<td colspan="3"><label id="idResult"></label></td>
			</tr>
			<tr>
				<td colspan="4">비밀번호<br><span class="notice">비밀번호는 8 ~ 16글자 영어 대소문자와 숫자만 가능합니다.</span></td>
			</tr>
			<tr>
				<td colspan="4"><input type="password" name="password" id="pwd1" size="16"></td>
			</tr>
			<tr>
				<td colspan="3">비밀번호 확인</td>
			</tr>
			<tr>
				<td colspan="3"><input type="password" name="password2" id="pwd2"></td>
			</tr>
			<tr>
				<td colspan="3"><label id="pwdResult"></label></td>
			</tr>
			<tr>
				<td colspan="3">별명<br><span class="notice">별명은 1 ~ 10글자 한글만 가능합니다.</span></td>
			</tr>
			<tr>
				<td colspan="3"><input type="text" name="nickName" id="nickName"></td>
			</tr>
			<tr>
				<td colspan="3"><label id="nickNameResult"></label></td>
			</tr>
			<tr>
				<td colspan="3">이름<br><span class="notice">이름은 2 ~ 5글자 한글만 가능합니다.</span></td>
			</tr>
			<tr>
				<td colspan="3"><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td colspan="3"><label id="nameResult"></label></td>
			</tr>
			<tr>
				<td colspan="3">성별</td>
			</tr>
			<tr>
				<td colspan="3">
					<select name="gender" id="gender">
						<option value="" disabled selected hidden="hidden">성별</option>
						<option value="M">남성</option>
						<option value="F">여성</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="3"><label id="genderResult"></label></td>
			</tr>
			<tr>
				<td colspan="3">이메일</td>
			</tr>
			<tr>
				<td colspan="3"><input type="email" name="email" id="email"></td>
			</tr>
			<tr>
				<td colspan="3"><label id="emailResult"></label></td>
			</tr>
			<tr>
				<td colspan="3">휴대전화번호<br><span class="notice">휴대전화번호는 10 ~ 12글자 숫자만 가능합니다.</span></td>
			</tr>
			<tr>
				<td colspan="3"><input type="text" name="phone" id="phone"></td>
			</tr>
			<tr>
				<td colspan="3"><label id="phoneResult"></label></td>
			</tr>
			<tr>
				<td colspan="3">
					<div>
						<input type="checkbox" name="admit" id="admit">
						<label for="admit"><span id="admit1">이용약관 및 개인정보처리방침 </span><span id="admit2">에 동의합니다.</span></label>
						<br>
						<a target="_blank" id="terms" href="https://www.mangoplate.com/en/terms/contract">이용약관 및 개인정보처리방침 보러가기 (새 탭으로 이동)</a>
						<label id="admitResult"></label>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value="가입하기" id="submit">
				</td>
			</tr>
		</table>
	</form>
	<br>
<%@ include file="/views/common/footer.jsp" %>
</body>
<script type="text/javascript" src="/semiproject/views/signUp/js/signUpJs.js"></script>
</html>