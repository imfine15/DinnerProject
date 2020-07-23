<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.search.model.vo.PageInfo, java.util.*, java.util.Map.*, com.kh.semi.enterprise.model.vo.*, com.kh.semi.board.model.vo.*" %>
<%
	ArrayList<EnpVO> enpList = (ArrayList<EnpVO>) request.getAttribute("enpList");
	String search = (String) request.getAttribute("search");
	List<HashMap<String, Integer>> enpMenus = (List<HashMap<String, Integer>>) request.getAttribute("enpMenus");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
<body id="mainWidth" style="width:1440px;">
	<%@ include file="/views/common/header.jsp" %>
	
	<!-- outer start -->
	<div class="outer" align="center">
		<!-- 상단 글자랑 필터등등 -->
		<nav>
		<div class="container" style="background: white; height: 60px; width: 600px; padding: 1px; border-radius: 10px; font-size: 22px; border: 1px solid #D5706D;">
            <button onclick="searchEnp();" style="height: 95%; background: white; border: 0px white; float: right; margin-right: 3px; margin-left:25px;">
                <img src="/semiproject/images/searchicon.png">
            </button>
            <button style="height: 100%; background: white; float: right; margin-left: 5px; border: 0px white;">
            	<img src="/semiproject/images/Vector.png">
            </button>
            <input onkeyup="if(event.keyCode === 13) { searchEnp(); }" id="search" name="search" type="search" style="height: 100%; width: 70%; border:0; background: white; font-size: 22px; margin-left: 10px; float:left;">
            <script>
	            var windowWidth = $( window ).width();
				$("#mainWidth").width(windowWidth);
				
				var windowHeight = $( window ).height();
				$( window ).resize(function() {
					windowWidth = $( window ).width();
					if(windowWidth > 1420) {
						$("#mainWidth").width(windowWidth);
					} else {
						$("#mainWidth").width(1420);
					}
				});
				
            	function searchEnp() {
            		var search = $("#search").val();
            		
            		location.href="<%= request.getContextPath() %>/searchEnp.se?search=" + search + "&currentPage=1";
            	}
            </script>
         </div>
		<div class="toptext">
		<% if(!search.equals("")) { %>
		<p id="text1"><%= search %> 검색 결과 - <%= currentPage %>페이지</p>
		<% } else { %>
		<p id="text1">모든 검색 결과 - <%= currentPage %>페이지</p>
		<% } %>
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
							<img id="foodImg<%= i %>" src="" class="foodImg"><br>
							<% if(enpList.get(i).getEnpStatus().equals("N")) { %>
							<label class="maintext"><%= enpList.get(i).getEnpName() %></label>
							<% } else {%>
							<label class="maintext" style="color:gray;"><%= enpList.get(i).getEnpName() + " (폐업)"%></label>
							<% } %>
							<% if(rating != 0.0) { %>
							<label class="rating"><%= rating %></label>
							<% } %>
							<br>
							<p class="small"><%= enpList.get(i).getEnpAddress() %></p>
							<p class="small"><%= entry.getKey() %></p>
						</div>
						<script>
							$("#foodArea<%= i + 1 %>").click(function() {
								var enpNo = "<%= enpList.get(i).getEnpNo() %>";
								
								location.href="<%= request.getContextPath() %>/selectEnp.en?enpNo=" + enpNo + "&rating=" + <%= rating %>;
								<% session.setAttribute("enpMenus", entries); %>
							});
							
							$(function() {
								$.ajax({
									url: "/semiproject/getEnpFile.en",
									type: "post",
									data: {enpNo: "<%= enpList.get(i).getEnpNo() %>"},
									success: function(data) {
										$("#foodImg<%= i %>").attr("src", data);
									}
								});
							});
						</script>
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
						location.href="<%= request.getContextPath() %>/searchKeyWord.se?search=" + searchWord + "&keyword=" + keyword + "&currentPage=1";
					});
				</script>
				<!-- 배너광고 -->
				<div id="ad">
				</div>
				<script>
					$(function() {
						$.ajax({
							url: "/semiproject/foundAllAd.ad",
							type: "get",
							success: function(data) {
								$adDiv = $("#ad");
								
								$adDiv.html(
										'<a href="http://' + data.adWebsite + '" target="_blank">'
										+ '<img src="'
										+ data.filePath + '" '
										+ 'title="' + data.adContent + '" id="adImg"></a>'
										+ '<p class="rating" style="float:none; font-weight:bold;">' + data.adEnpName + '</p>'
								);
							}
						});
					});
				</script>
				<!-- 코스추천 -->
				<div>
				<div class="reviewArea">
					<p id="review">코스 리뷰</p>
				</div>
				<!-- 코스추천내용 시작 -->
				<div id="img">
			    </div>
			    <!-- 코스추천내용 끝 -->
			    <script>
			    	$(function() {
			    		$.ajax({
			    			url: "/semiproject/foundAllBoard.bo",
			    			success: function(data) {
			    				$img = $("#img");
			    				
			    				var random1 = Math.floor(Math.random() * data.length);
			    				var rBoard = data[random1];
			    				
			    				var random2 = Math.floor(Math.random() * rBoard.filePaths.length);
			    				var rFile = rBoard.filePaths[random2];
			    				
			    				$img.html(
			    						'<div class="img" style="background-image: url('
			    						+ rFile
			    						+ ');"><div class="content"><p style="width:224px; margin: 3px">'
			    						+ rBoard.boardTitle
			    						+ '</p><br><p id="reviewsmall">'
			    						+ rBoard.hashTags
			    						+ '</p></div><div class="img-cover"></div></div>'
			    						);
			    			}
			    		});
			    	});
			    </script>
			    <br>
			    <hr width="250px">
				</div>
			</div>
			<!-- 페이징처리버튼 -->
			<div class="pagingArea" align="center">
				<button onclick="location.href='<%= request.getContextPath() %>/searchEnp.se?search=<%= search %>&currentPage=1'"><<</button>
				<% if(currentPage <= 1) { %>
					<button disabled><</button>
				<% } else { %>
					<button onclick="location.href='<%= request.getContextPath() %>/searchEnp.se?search=<%= search %>&currentPage=<%= currentPage - 1%>'"><</button>
				<% } %>
				
				<% for(int p = startPage; p <= endPage; p++) { 
						if(p == currentPage) {
				%>
							<button disabled><%= p %></button>
				<% 		} else { %>
							<button onclick="location.href='<%= request.getContextPath() %>/searchEnp.se?search=<%= search %>&currentPage=<%= p %>'"><%= p %></button>
				<%
						}
					}
				%>
				
				<% if(currentPage >= maxPage) { %>
					<button disabled>></button>
				<% } else { %>
					<button onclick="location.href='<%= request.getContextPath() %>/searchEnp.se?search=<%= search %>&currentPage=<%= currentPage + 1 %>'">></button>
				<% } %>
				<button onclick="location.href='<%= request.getContextPath() %>/searchEnp.se?search=<%= search %>&currentPage=<%= maxPage %>'">>></button>
			</div>
			<!-- 페이징 처리버튼 끝 -->
		</aside>
		</div>
		<!-- 맛집끝 -->
	<!-- 일정검색창시작 -->
	<div id="schedule" align="center" style="display: none;">
		<p id="text2" align="left">베스트 코스리뷰</p><br>
		<% for(int i = 0; i < 2; i++) { %>
		<div class="best" align="left">
			<img src="" style="width: 450px; height: 200px;" id="bestImg<%= i %>">
			<p class="bestBig" id="bestBig<%= i %>"></p>
			<p class="bestSmall" id="bestSmall<%= i %>"></p>
		</div>
		<script>
			/* $(function() {
				url: "/semiproject/getBestCourseReview.se",
				type: "post",
				success: function(data) {
					
				}
			}); */
		</script>
		<% } %>
		<!-- 리뷰게시판시작 -->
		<div class="inner2" align="center">
			<div align="left">
				<label id="text3">일정 리뷰</label>
			</div>
			<div align="right" id="btnArea1">
				<button class="check">조회순</button>
				<button class="check">추천순</button>
				<button class="check">최신순</button>
				<button id="write">글쓰기</button>
			</div>
			<script>
				$(function() {
					$("#btnArea1 button").click(function() {
						var sort = $(this).html();
						
						switch(sort) {
							case '조회순' : break;
							case '추천순' : break;
							case '최신순' : break;
						}
					});
				});
			</script>
			<hr>
			<%-- <div class="textArea">
			<table style="border-bottom: 1px solid black;">
				<tr>
					<td rowspan="3" width="100px"><%= courseBoardList.get(i).getBoardNo() %></td>
					<td rowspan="3"><img src="<%= courseBoardList.get(i).getFilePaths()[0] %>" width="200px" height="150px"></td>
					<td align="left" valign="bottom"><label class="textreview"><%= courseBoardList.get(i).getBoardTitle() %></label></td>
					<td rowspan="3" valign="top" width="40px"><img class="heart" src="/semiproject/images/heartblack.png"></td>
					<td align="right" valign="bottom"><%= courseBoardList.get(i).getUploadDate() %></td>
					<td rowspan="2" width="180px" align="center">
						<div class="profileBox" align="center">
							<img id="cprofilePic<%= i %>" class="profile" src="">
						</div>
					</td>
				</tr>
				<tr>
					<td width="400px" align="left" valign="top" rowspan="2"><label><%= courseBoardList.get(i).getHashTags() %></label></td>
					<td align="right" valign="top" width="100px">조회수 : <%= courseBoardList.get(i).getViewCount() %></td>
				</tr>
				<tr>
					<td align="right"><button class="report">신고</button></td>
					<td id="cprofileNickName<%= i %>" align="center"></td>
				</tr>
			</table>
			<script>
				$(function() {
					var mNo = "<%= courseBoardList.get(i).getMemberNo() %>";
					
					$.ajax({
						url: "/semiproject/selectMember.me",
						type: "post",
						data: {mNo: mNo},
						success: function(data) {
							$("#cprofilePic<%= i %>").attr("src", data.filePath);
							$("#cprofileNickName<%= i %>").html(data.mNickname);
						}
					});
				});
			</script>
			</div>
		</div>
		<!-- 리뷰게시판끝 -->
		<!-- 페이징처리해야하는부분 -->
		<!-- 맛집리뷰시작 -->
		<div class="inner2" align="center">
			<div align="left">
				<label id="text3">맛집 리뷰</label>
			</div>
			<div align="right" id="btnArea2">
				<button class="check">조회순</button>
				<button class="check">추천순</button>
				<button class="check">최신순</button>
				<button id="write">글쓰기</button>
			</div>
			<script>
				$(function() {
					$("#btnArea2 button").click(function() {
						var sort = $(this).html();
						
						<% ArrayList<BoardVO> enpBoardList = viewSortBoardEnpList; %>
						switch(sort) {
							case '조회순' : <% enpBoardList = viewSortBoardEnpList; enpReview(); %> break;
							case '추천순' : <% enpBoardList = likeSortBoardEnpList; enpReview(); %> break;
							case '최신순' : <% enpBoardList = dateSortBoardEnpList; enpReview(); %> break;
						}
					});
				});
			</script>
			<hr>
			<div class="textArea">
			<%! public void enpReview() { %>
			<% for(int i = 0; i < enpBoardList.size(); i++) { %>
			<table style="border-bottom: 1px solid black;">
				<tr>
					<td rowspan="3" width="100px"><%= enpBoardList.get(i).getBoardNo() %></td>
					<td rowspan="3"><img src="<%= enpBoardList.get(i).getFilePaths()[0] %>" width="200px" height="150px"></td>
					<td align="left" valign="bottom"><label class="textreview"><%= enpBoardList.get(i).getBoardTitle() %></label></td>
					<td rowspan="3" valign="top" width="40px"><img class="heart" src="/semiproject/images/heartblack.png"></td>
					<td align="right" valign="bottom"><%= enpBoardList.get(i).getUploadDate() %></td>
					<td rowspan="2" width="180px" align="center">
						<div class="profileBox" align="center">
							<img id="eprofilePic<%= i %>" class="profile" src="">
						</div>
					</td>
				</tr>
				<tr>
					<td width="400px" align="left" valign="top" rowspan="2"><label><%= enpBoardList.get(i).getHashTags() %></label></td>
					<td align="right" valign="top" width="100px">조회수 : <%= enpBoardList.get(i).getViewCount() %></td>
				</tr>
				<tr>
					<td align="right"><button class="report">신고</button></td>
					<td id="eprofileNickName<%= i %>" align="center"></td>
				</tr>
			</table>
			<script>
				$(function() {
					var mNo = "<%= enpBoardList.get(i).getMemberNo() %>";
					
					$.ajax({
						url: "/semiproject/selectMember.me",
						type: "post",
						data: {mNo: mNo},
						success: function(data) {
							$("#eprofilePic<%= i %>").attr("src", data.filePath);
							$("#eprofileNickName<%= i %>").html(data.mNickname);
						}
					});
				});
			</script>
			<% } %>
			<%! } %>
			</div>
		</div> --%>
		<!-- 페이징처리해야할부분 -->
	</div>
	<!-- 일정끝 -->
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