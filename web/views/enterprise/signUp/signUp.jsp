<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/semiproject/views/enterprise/signUp/css/signUpStyle.css"/>
<title>업체 회원가입</title>
</head>
<body>
	<img alt="여밋 로고" src="/semiproject/images/YUMEET LOGO WITH REST.png" id="logo">
	<p id="welcome"><span id="logo1">YU</span><span id="logo2">MEET</span>에 오신 것을 환영합니다!</p>
	<p class="caution">업체 회원가입 페이지입니다. 일반 사용자시라면 <a href="/semiproject/views/signUp/signUp.jsp">여기</a>를 눌러주세요</p>
	<p class="caution">모든 정보는 필수 입력 사항입니다</p>
	<!-- 이름에 맞는 서블릿을 생성할 것 -->
	<form action="<%= request.getContextPath() %>/signUp.en" method="post" onsubmit="return check();">
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
				<td colspan="3">주민번호<br><span class="notice">주민번호는 13자리 숫자와 '-'만 가능합니다.</span></td>
			</tr>
			<tr>
				<td colspan="3"><input type="text" name="juminNo" id="juminNo"></td>
			</tr>
			<tr>
				<td colspan="3"><label id="juminNoResult"></label></td>
			</tr>
			<tr>
				<td colspan="3">사업자명<br><span class="notice">사업자명은 2 ~ 5글자 한글만 가능합니다.</span></td>
			</tr>
			<tr>
				<td colspan="3"><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td colspan="3"><label id="nameResult"></label></td>
			</tr>
			<tr>
				<td colspan="3">업체명<br><span class="notice">업체 이름은 1 ~ 15글자 영어 대소문자와 한글만 가능합니다.</span></td>
			</tr>
			<tr>
				<td colspan="3"><input type="text" name="enterpriseName" id="enterpriseName"></td>
			</tr>
			<tr>
				<td colspan="3"><label id="enterpriseNameResult"></label></td>
			</tr>
			<tr>
				<td colspan="3">은행명</td>
			</tr>
			<tr>
				<td colspan="3">
					<select name="bank" id="bank">
						<option value="" disabled selected hidden="hidden">은행명</option>
						<option value="woori">우리은행</option>
						<option value="KDB">KDB산업은행</option>
						<option value="IBK">IBK기업은행</option>
						<option value="KB">KB국민은행</option>
						<option value="city">시티은행</option>
						<option value="hana">하나은행</option>
						<option value="sinhan">신한은행</option>
						<option value="NH">농협</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="3"><label id="bankResult"></label></td>
			</tr>
			<tr>
				<td colspan="3">계좌번호<br><span class="notice">계좌번호는 12 ~ 14글자 숫자만 가능합니다.</span></td>
			</tr>
			<tr>
				<td colspan="3"><input type="text" name="bankAccount" id="bankAccount"></td>
			</tr>
			<tr>
				<td colspan="3"><label id="bankAccountResult"></label></td>
			</tr>
			<tr>
				<td colspan="3">사업자등록번호<br><span class="notice">사업자등록번호는 10글자 숫자만 가능합니다.</span></td>
			</tr>
			<tr>
				<td colspan="3"><input type="text" name="enterpriseNumber" id="enterpriseNumber"></td>
			</tr>
			<tr>
				<td colspan="3"><label id="enterpriseNumberResult"></label></td>
			</tr>
			<tr>
				<td colspan="3">매장 주소</td>
			</tr>
			<tr>
				<td colspan="3"><input type="text" name="address" id="address" size="20" readonly></td>
				<td colspan="1"><p id="findAddress">주소찾기</p></td>
			</tr>
			<tr>
				<td colspan="3"><input placeholder="상세 주소를 입력해주세요" type="text" name="addressDetail" id="addressDetail"></td>
			</tr>
			<tr>
				<td colspan="3"><label id="addressResult"></label></td>
			</tr>
			<tr>
				<td colspan="3">업종</td>
			</tr>
			<tr>
				<td colspan="3"><input type="text" name="enterpriseType" id="enterpriseType"></td>
			</tr>
			<tr>
				<td colspan="3"><label id="enterpriseTypeResult"></label></td>
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
				<td colspan="3">매장전화번호<br><span class="notice">매장전화번호는 9 ~ 12글자 숫자만 가능합니다.</span></td>
			</tr>
			<tr>
				<td colspan="3"><input type="text" name="phone" id="phone"></td>
			</tr>
			<tr>
				<td colspan="3"><label id="phoneResult"></label></td>
			</tr>
			<tr>
				<td colspan="3">사업자구분</td>
			</tr>
			<tr>
				<td colspan="3">
					<select name="enterpriseLicensee" id="enterpriseLicensee">
						<option value="" disabled selected hidden="hidden">사업자구분</option>
						<option value="individual">개인사업자</option>
						<option value="corporate">법인사업자</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="3"><label id="enterpriseLicenseeResult"></label></td>
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
	<br>
<%@ include file="/views/common/enterpriseFooter.jsp" %>
</body>
<script type="text/javascript" src="/semiproject/views/enterprise/signUp/js/signUpJs.js"></script>
</html>