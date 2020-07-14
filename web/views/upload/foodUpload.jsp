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
	.area{
		resize: none;
	}
	.food{
		display: inline-block;
		
	}
	input[type=submit]{
		background: #5BB8B4;
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 130px;
		height: 35px;
		font-size: 24px;
		margin: 10px;
		
		
	}
	input[type=reset]{
		background: #666666;
		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 130px;
		height: 35px;
		font-size: 24px;
		margin: 10px;
		
		
	}
	label, input, select, textarea{
		margin-bottom: 10px;
		margin-top: 10px;
	}
	table{
		margin-right: 10px;
		margin-left: 50px;
	}
	#box2{
		margin-bottom: 132px;
	}
	.star{
		color: red;
	}
	
	input[type=text]{
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		height: 20px;
	}
	textarea{
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
	}
	select{
		border-radius: 0;
		border: 1px solid gray;
		outline-style: none;
		height: 20px;
	}

</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
	<h1 style="margin-left: 200px; margin-top: 30px;">식당 등록</h1>
		<div class="box" align="center">
		<form action="" method="post">
		
	<div class="food" align="center">
		<table>
			<tr>
				<td><label>식당명</label><label class="star">* </label></td>
				<td><input type="text" name="" value=""></td>
				
			</tr>
			<tr>
				<td><label>주소</label><label class="star">* </label></td>
				<td><input type="text" name="" value=""></td>
				
			</tr>
			<tr>
				<td><label>전화번호</label><label class="star">* </label></td>
				<td><input type="text" name="" value=""></td>
				
			</tr>
			<tr>
				<td><label>메뉴</label><label class="star">* </label></td>
				<td><textarea rows="5px" cols="22px" class="area"></textarea></td>
			
			</tr>
			<tr>
				<td><label>가격대</label><label class="star">* </label></td>
				<td>
					<select name="money">
						<option value="10000">~1만원대</option>
						<option value="20000">1만원 ~ 2만원</option>
						<option value="30000">2만원 ~ 3만원</option>
						<option value="50000">3만원 ~ 5만원</option>
						<option value="60000">5만원 ~ 7만원</option>
						<option value="70000">7만원대~</option>
					</select>
					</td>
				
			</tr>
			<tr>
				<td><label>영업시간</label></td>
				<td><input type="text" name="" value=""></td>
			</tr>
			<tr>
			<td><label>휴무일</label></td>
			<td><input type="text" name="" value=""></td>
			</tr>
			<tr>
			<td><label>웹사이트</label></td>
			<td><input type="text" name="" value=""></td>
			</tr>
			
		</table>
		
		</div>
		<div class="food" align="center">
		<hr width="1px" size="420" style="background-color: gray; border: gray; margin-left: 70px;">
		</div>
		<div class="food" id="box2" align="center">
		
		<table>
		<tr>
				
				<td><label>해시태그</label><label class="star">* </label></td>
				<td><input type="text" name="" value="" placeholder="#을 이용하여 태그를 사용해보세요."></td>
			</tr>
			<tr>
				
				<td><label>소개문구</label></td>
				<td><textarea rows="5px" cols="22px" class="area" placeholder="가게에 대한 간단한 소개글을 작성해주세요."></textarea></td>
			</tr>
			<tr>
				
				<td><label>주차공간</label></td>
				<td><input type="text" name="" value=""></td>
			</tr>
			<tr>
				
				<td><label>카테고리</label><label class="star">* </label></td>
				<td><select name="category">
					<option value="korea">한식</option>
					<option value="chinese">중식</option>
					<option value="japan">일식</option>
					<option value="fast">패스트푸드</option>
					<option value="western">양식</option>
					<option value="cafe">카페</option>
					<option value="school">분식</option>
					<option value="asia">아시아</option>
				</select></td>
			</tr>
			<tr>
				
				<td><label>이미지</label><label class="star">* </label></td>
				<td><input type="file"></td>
				
			</tr>
			 
		</table>
	</div>
	<div align="center" style="margin-bottom: 80px;">
		<br><br><br>
		  <input type="submit" value="추 가">
          <input type="reset" value="취 소">
	</div>
		</form>
		</div>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>