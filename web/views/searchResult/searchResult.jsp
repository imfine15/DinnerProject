<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.util.Map.*,com.kh.semi.enterprise.model.vo.EnpVO"%>
<%
	ArrayList<EnpVO> enpList = (ArrayList<EnpVO>) session.getAttribute("enpList");
	String search = (String) session.getAttribute("search");
	List<HashMap<String, Integer>> enpMenus = (List<HashMap<String, Integer>>) session.getAttribute("enpMenus");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>YUMEET</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="/semiproject/views/searchResult/css/searchResultStyle.css" />
</head>
<body style="width:1440px;">
	<%@ include file="/views/common/header.jsp" %>
	
	<!-- outer start -->
	<div class="outer" align="center">
		<!-- 상단 글자랑 필터등등 -->
		<nav>
		<div class="toptext">
		<p id="text1"><%= search %> 검색 결과</p>
		</div>
		<div class="topbtn" align="right">
			<label class="btntext">맛집</label>
			<input type="checkbox" id="switch1" onclick="chk_food();">
			<label for="switch1" class="round"></label>
			<label class="btntext">리뷰</label>
			<img src="/semiproject/images/filter.png" id="filterImg">
		
		</div>
		</nav>
		<!-- 맛집일때보일창 -->
		<div id="food">
		<section>
			<article>
				<div class="inner" id="inner">
					<%
					if(enpList.size() != 0) {
						Entry<String, Integer> entry = null;
						for(int i = 0; i < enpList.size(); i++) {
							double rating = Math.round(enpList.get(i).getRating() * 10.0) / 10.0;
							HashMap<String, Integer> temp = enpMenus.get(i);
							Iterator<Map.Entry<String, Integer>> entries = temp.entrySet().iterator();
								if(entries.hasNext()){
									entry = (Entry<String, Integer>) entries.next();
								}
					%>
						<div id="foodArea<%= i + 1 %>" class="foodArea">
							<img src="/semiproject/images/죠떡.jpg" class="foodImg"><br>
							<label class="maintext"><%= enpList.get(i).getEnpName() %></label>
							<% if(rating != 0.0) { %>
							<label class="rating"><%= rating %></label>
							<% } %>
							<br>
							<p class="small"><%= enpList.get(i).getEnpAddress() %></p>
							<p class="small"><%= entry.getKey() %></p>
						</div>
					<% }
					} else { %>
					<div style="text-align:center;">
						<p id="noResultNotice">검색 결과가 없습니다.</p>
						<button id="addEnpBtn">맛집 정보 등록</button>
					</div>
					<% } %>
				</div>
			</article>
		</section>
		<!-- 사이드 -->
		<aside>
			<div id="side">
				<p id="keyword">카테고리</p><br><br><br>
				<div id="keywordArea">
					<button class="keybtn">한식</button>
					<button class="keybtn">일식</button>
					<button class="keybtn">중식</button>
					<button class="keybtn">양식</button>
					<button class="keybtn">분식</button>
					<button class="keybtn">패스트푸드</button>
				</div>
				<script>
					$("#keywordArea button").click(function() {
						var searchWord = "<%= search %>";
						var keyword = $(this).html();
						$.ajax({
							url: "/semiproject/searchKeyWord.se",
							type: "get",
							data: {searchWord: searchWord, keyword: keyword},
							success: function(data) {
								$div = $("#inner").html("");
							},
							error: function(data) {
								console.log("실패");
							}
						});
					});
				</script>
				<!-- 배너광고 -->
				<div id="ad">
					<a href="www.naver.com" target="_blank"><img src="/semiproject/images/groupmoa.PNG" id="adImg"></a>
				</div>
				<!-- 코스추천 -->
				<div>
				<div class="reviewArea">
					<p id="review">코스 리뷰</p>
				</div>
				 <div class="img">
			        <div class="content">
			           <p style="margin: 3px">장어구이핵꿀맛</p>
			           <p id="reviewsmall">장어구이맛집추천!</p>
			        </div>
			        <div class="img-cover"></div>
			    </div><br>
			    <hr width="250px">

				</div>
			</div>
		</aside>
		</div>
		
		<!-- 맛집끝 ...-->
	<!-- 일정검색창시작 -->
	<div id="schedule" align="center" style="display: none;">
		<p id="text2" align="left">베스트 코스리뷰</p><br>
		<div class="best" align="left">
			<img src="/semiproject/images/장어구이.jpg" style="width: 450px; height: 200px;">
			<p class="bestBig">"튀김과 함께 밤하늘의 나는 오열한다."</p>
			<p class="bestSmall">당일치기 튀김 완벽 정복</p>
		</div>
		<div class="best" align="left">
			<img src="/semiproject/images/연어.jpg" style="width: 450px; height: 200px;">
			<p class="bestBig">"아침의 Breakfast"</p>
			<p class="bestSmall">베이컨에 쌈을 싸서 드셔보세요!</p>
		</div>
		<!-- 리뷰게시판시작 -->
		<div class="inner2" align="center">
			<div align="left">
				<label id="text3">일정 리뷰</label>
			</div>
			<div align="right" id="btnArea">
				<button class="check">조회순</button>
				<button class="check">추천순</button>
				<button class="check">최신순</button>
				<button id="write">글쓰기</button>
			</div>
			<hr>
			<div class="textArea">
			
			<table style="border-bottom: 1px solid black;">
				<tr>
					<td rowspan="3" width="100px">0001</td>
					<td rowspan="3"><img src="/semiproject/images/닭갈비.jpg" width="200px" height="150px"></td>
					<td align="left" valign="bottom"><label class="textreview">울부짖어라, '닭갈비'</label></td>
					<td rowspan="3" valign="top" width="40px"><img class="heart" src="/semiproject/images/heartblack.png"></td>
					<td align="right" valign="bottom">2020.07.06</td>
					<td rowspan="2" width="180px" align="center"><div class="profileBox" align="center">
						<img class="profile" src="/semiproject/images/imfine.png">
					</div></td>
				</tr>
				<tr>
					<td width="400px" align="left" valign="top" rowspan="2"><lable>오늘 배가 너무 고픈데 덥기까지 해...</label></td>
					<td align="right" valign="top" width="100px">조회수 : 10</td>
				</tr>
				<tr>
					<td align="right"><button class="report">신고</button></td>
					<td align="center">임피네</td>
				</tr>
				</table>
				<table style="border-bottom: 1px solid black;">
				<tr>
					<td rowspan="3" width="100px">0001</td>
					<td rowspan="3"><img src="/semiproject/images/죠떡.jpg" width="200px" height="150px"></td>
					<td align="left" valign="bottom"><label class="textreview">떡볶이냠냠</label></td>
					<td rowspan="3" valign="top" width="40px"><img class="heart" src="/semiproject/images/heartblack.png"></td>
					<td align="right" valign="bottom">2020.07.06</td>
					<td rowspan="2" width="180px" align="center"><div class="profileBox" align="center">
						<img class="profile" src="/semiproject/images/imfine.png">
					</div></td>
				</tr>
				<tr>
					<td width="400px" align="left" valign="top" rowspan="2"><lable>오늘 배가 너무 고픈데 덥기까지 해...</label></td>
					<td align="right" valign="top" width="100px">조회수 : 10</td>
				</tr>
				<tr>
					<td align="right"><button class="report">신고</button></td>
					<td align="center">임피네</td>
				</tr>
				</table>
				<table style="border-bottom: 1px solid black;">
				<tr>
					<td rowspan="3" width="100px">0002</td>
					<td rowspan="3"><img src="/semiproject/images/장어구이.jpg" width="200px" height="150px"></td>
					<td align="left" valign="bottom"><label class="textreview">장어야야ㅏ아앙</label></td>
					<td rowspan="3" valign="top" width="40px"><img class="heart" src="/semiproject/images/heartblack.png"></td>
					<td align="right" valign="bottom">2020.07.05</td>
					<td rowspan="2" width="180px" align="center"><div class="profileBox" align="center">
						<img class="profile" src="/semiproject/images/ddu.png">
					</div></td>
				</tr>
				<tr>
					<td width="400px" align="left" valign="top" rowspan="2"><lable>빨리집에가고싶다그칭</label></td>
					<td align="right" valign="top" width="100px">조회수 : 100</td>
				</tr>
				<tr>
					<td align="right"><button class="report">신고</button></td>
					<td align="center">뚜뚜링</td>
				</tr>
			</table>
			</div>

		</div>
		<!-- 리뷰게시판끝 -->
		<!-- 페이징처리해야하는부분 -->
		<!-- 맛집리뷰시작 -->
		<div class="inner2" align="center">
			<div align="left">
				<label id="text3">맛집 리뷰</label>
			</div>
			<div align="right" id="btnArea">
				<button class="check">조회순</button>
				<button class="check">추천순</button>
				<button class="check">최신순</button>
				<button id="write">글쓰기</button>
			</div>
			<hr>
			<div class="textArea">
			
			<table style="border-bottom: 1px solid black;">
				<tr>
					<td rowspan="3" width="100px">0001</td>
					<td rowspan="3"><img src="/semiproject/images/닭갈비.jpg" width="200px" height="150px"></td>
					<td align="left" valign="bottom"><label class="textreview">울부짖어라, '닭갈비'</label></td>
					<td rowspan="3" valign="top" width="40px"><img class="heart" src="/semiproject/images/heartblack.png"></td>
					<td align="right" valign="bottom">2020.07.06</td>
					<td rowspan="2" width="180px" align="center"><div class="profileBox" align="center">
						<img class="profile" src="/semiproject/images/imfine.png">
					</div></td>
				</tr>
				<tr>
					<td width="400px" align="left" valign="top" rowspan="2"><lable>오늘 배가 너무 고픈데 덥기까지 해...</label></td>
					<td align="right" valign="top" width="100px">조회수 : 10</td>
				</tr>
				<tr>
					<td align="right"><button class="report">신고</button></td>
					<td align="center">임피네</td>
				</tr>
				</table>
				<table style="border-bottom: 1px solid black;">
				<tr>
					<td rowspan="3" width="100px">0002</td>
					<td rowspan="3"><img src="/semiproject/images/장어구이.jpg" width="200px" height="150px"></td>
					<td align="left" valign="bottom"><label class="textreview">장어야야ㅏ아앙</label></td>
					<td rowspan="3" valign="top" width="40px"><img class="heart" src="/semiproject/images/heartblack.png"></td>
					<td align="right" valign="bottom">2020.07.05</td>
					<td rowspan="2" width="180px" align="center"><div class="profileBox" align="center">
						<img class="profile" src="/semiproject/images/ddu.png">
					</div></td>
				</tr>
				<tr>
					<td width="400px" align="left" valign="top" rowspan="2"><lable>빨리 한번 더 가고싶어요</label></td>
					<td align="right" valign="top" width="100px">조회수 : 100</td>
				</tr>
				<tr>
					<td align="right"><button class="report">신고</button></td>
					<td align="center">뚜뚜링</td>
				</tr>
			</table>
			<table style="border-bottom: 1px solid black;">
				<tr>
					<td rowspan="3" width="100px">0001</td>
					<td rowspan="3"><img src="/semiproject/images/죠떡.jpg" width="200px" height="150px"></td>
					<td align="left" valign="bottom"><label class="textreview">떡볶이냠냠</label></td>
					<td rowspan="3" valign="top" width="40px"><img class="heart" src="/semiproject/images/heartblack.png"></td>
					<td align="right" valign="bottom">2020.07.06</td>
					<td rowspan="2" width="180px" align="center"><div class="profileBox" align="center">
						<img class="profile" src="/semiproject/images/imfine.png">
					</div></td>
				</tr>
				<tr>
					<td width="400px" align="left" valign="top" rowspan="2"><lable>오늘 배가 너무 고픈데 덥기까지 해...</label></td>
					<td align="right" valign="top" width="100px">조회수 : 10</td>
				</tr>
				<tr>
					<td align="right"><button class="report">신고</button></td>
					<td align="center">임피네</td>
				</tr>
				</table>
			</div>
		</div>
		<!-- 페이징처리해야할부분 -->
	</div><!-- 일정끝 -->
		
	</div>
	<%@include file="/views/common/footer.jsp" %>
		<script>
			function chk_food() {
				var food = document.getElementById("food");
				var btn = document.getElementById("switch1");
				var schedule = document.getElementById("schedule");
				
				if(btn.checked == false){
					food.style.display = "block";
					schedule.style.display = "none";
				} else {
					food.style.display = "none";
					schedule.style.display = "block";
				}
			}
		</script>
</body>
</html>