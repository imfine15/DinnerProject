<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<style>
.hide {
	background-color: white;
	border: 0px;
	height: 30px;
}

#wrapper {
	width: 85%;
	height: 100%;
	margin-left: 230px;
	padding-top: 40px;
	padding-left: 30px;
}

#title-box {
	background: #F9F9F9;
	width: 100%;
	height: 50px;
	margin-bottom: 10px;
	padding-left: 10px;
	font-family: Noto Sans KR;
	font-size: 30px;
	font-weight: bolder;
}

#inner-box {
	width: 100%;
	height: 700px;
}

#inner-wrap {
	padding-left: 50px;
	padding-right: 50px;
	background: white;
	width: 95%;
}

#send-btn {
	color: white;
	background-color: #E07370;
	border: none;
	width: 40px;
	height: 25px;
}

#sendcom-btn {
	color: white;
	background-color: #A0A0A0;
	border: none;
	width: 70px;
	height: 25px;
}

td {
	text-align: center;
}

#check-box {
	width: 50px;
}

#review-tb {
	border-collapse: collapse;
}

tr {
	border-bottom: 0.5px solid #9F9F9F;
	height: 40px;
}

#upload-btn {
	width: 60px;
	height: 24px;
	border: none;
	background: #E07370;
	border-radius: 2px;
	color: white;
	font-size: 15px;
}

#update-btn {
	width: 45px;
	height: 24px;
	border: none;
	background: #E07370;
	border-radius: 2px;
	color: white;
	font-size: 15px;
}

#delete-btn {
	width: 45px;
	height: 24px;
	border: none;
	background: #E07370;
	border-radius: 2px;
	color: white;
	font-size: 15px;
}

#search-btn {
	width: 53px;
	height: 24px;
	background: #C4C4C4;
	color:black;
	border:none;
}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="../common/sidebar.jsp"%>
	<div id="wrapper">
		<div id="title-box">
			<p>리뷰 게시글 관리</p>
			<br>
		</div>
		<div id="inner-wrap">
			<div id="inner-box">
				<div style="height: 30px;"></div>
				<form>
					<table id="review-tb" style="width: 100%;">
						<tr>
							<th id="check-box"></th>
							<th>제목</th>
							<th>회원 ID</th>
							<th>등록 날짜</th>
							<th>포인트 지급</th>
							<th>관리</th>
						</tr>
						<tr>
							<td id="check-box"><input type="checkbox"></td>
							<td>울부짖어라, ‘닭갈비'</td>
							<td>imfine_123</td>
							<td>20/06/19 17:33</td>
							<td>
								<button id="send-btn">지급</button>
							</td>
							<td>
								<button id="upload-btn">업로드</button>
								<button id="update-btn">수정</button>
								<button id="delete-btn">삭제</button>
							</td>
						</tr>
						<tr>
							<td id="check-box"><input type="checkbox"></td>
							<td>울부짖어라, ‘닭갈비'</td>
							<td>imfine_123</td>
							<td>20/06/19 17:33</td>
							<td>
								<button id="send-btn">지급</button>
							</td>
							<td>
								<button id="upload-btn">업로드</button>
								<button id="update-btn">수정</button>
								<button id="delete-btn">삭제</button>
							</td>
						</tr>
						<tr>
							<td id="check-box"><input type="checkbox"></td>
							<td>울부짖어라, ‘닭갈비'</td>
							<td>imfine_123</td>
							<td>20/06/19 17:33</td>
							<td>
								<button id="send-btn">지급</button>
							</td>
							<td>
								<button id="upload-btn">업로드</button>
								<button id="update-btn">수정</button>
								<button id="delete-btn">삭제</button>
							</td>
						</tr>
						<tr>
							<td id="check-box"><input type="checkbox"></td>
							<td>울부짖어라, ‘닭갈비'</td>
							<td>imfine_123</td>
							<td>20/06/19 17:33</td>
							<td>
								<button id="sendcom-btn">지급완료</button>
							</td>
							<td>
								<button id="upload-btn">업로드</button>
								<button id="update-btn">수정</button>
								<button id="delete-btn">삭제</button>
							</td>
						</tr>
					</table>
				</form>
				<div style="height: 30px;"></div>
				<div id="search-box" align="center">
					<form>
						<table>
							<tr>
								<td><select style="height:25px; font-size:14px;">
										<option>제목</option>
										<option>회원 ID</option>
										<option>등록 날짜</option>
								</select>&nbsp;&nbsp;&nbsp;</td>
								<td><input style="height:25px;" type="search" size="25"></td>
								<td>
									&nbsp;&nbsp;&nbsp;<button id="search-btn">검색</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>