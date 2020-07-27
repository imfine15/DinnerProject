<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.search.model.vo.PageInfo, java.util.*, java.util.Map.*, com.kh.semi.enterprise.model.vo.*, com.kh.semi.board.model.vo.*" %>
<%
	ArrayList<EnpVO> enpList = (ArrayList<EnpVO>) request.getAttribute("enpList");
	String search = (String) request.getAttribute("search");
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
            <button id="recommendBtn" style="height: 100%; background: white; float: left; margin-left: 5px; border: 0px white;">
            	<img src="/semiproject/images/Vector.png">
            </button>
            <input onkeyup="if(event.keyCode === 13) { searchEnp(); }" id="search" name="search" type="search" style="height: 100%; width: 70%; border:0; background: white; font-size: 22px; margin-left: 10px; float:left;">
            <script>
				$("#recommendBtn").click(function() {
					var s = $("#search").val();
					
					if(s === "양재") {
						var flag = window.confirm("양재동은 어떠세요?");
						
						if(flag) {
							$("#search").val("양재동");
							searchEnp();
						}
					}
					
					if(s === "강남") {
						var flag = window.confirm("강남구는 어떠세요?");
						
						if(flag) {
							$("#search").val("강남구");
							searchEnp();
						}
					}
					
					if(s === "삼겹") {
						var flag = window.confirm("삼겹살은 어떠세요?");
						
						if(flag) {
							$("#search").val("삼겹살");
							searchEnp();
						}
					}
				});          
            
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
					%>
						<div id="foodArea<%= i + 1 %>" class="foodArea">
							<img id="" src="<%=request.getContextPath()%>/thumbnail_uploadFile/<%=enpList.get(i).getChangeName() %>" class="foodImg"><br>
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
							<p class="small"><%= enpList.get(i).getMenuName() %></p>
						</div>
						<script>
							$("#foodArea<%= i + 1 %>").click(function() {
								var enpNo = "<%= enpList.get(i).getEnpNo() %>";
								
								location.href="<%= request.getContextPath() %>/selectEnp.en?enpNo=" + enpNo;
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
					<button class="keybtn">카페</button>
					<button class="keybtn">아시아</button>
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
										'<p class="rating">' + data.adContent + '</p>'
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
			$(function() {
				$.ajax({
					url: "/semiproject/getBestCourseReview.se",
					type: "post",
					success: function(data) {
						$("#bestImg<%= i %>").attr("src", data[<%= i %>].filePaths[0]);
						$("#bestBig<%= i %>").html(data[<%= i %>].boardTitle);
						$("#bestSmall<%= i %>").html(data[<%= i %>].hashTags);
					}
				});
			});
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
				<button id="write1">글쓰기</button>
			</div>
			<script>
				sort = "조회순";
				currentPage = 1;
				
				$(function() {
					ajaxSort();
				});
				
				$("#btnArea1 button[class=check]").click(function() {
					sort = $(this).html();
					currentPage = 1;
					
					$.ajax({
						url: "/semiproject/getCourse.bo",
						type: "post",
						data: {sort: sort, currentPage: currentPage},
						success: function(data) {
							ajaxSort();
						}
					});
				});
				
				function ajaxSort() {
					$.ajax({
						url: "/semiproject/getCourse.bo",
						type: "post",
						data: {sort: sort, currentPage: currentPage},
						success: function(data) {
								if(currentPage > data[1].maxPage) {
									currentPage = 1;
									$("#pagingNo").val(currentPage);
								} else {
									$("#courseTableDiv").html("");
									
									for(var i = 0; i < data[0].length; i++) {
										$("#courseTableDiv").append(
												'<table style="border-bottom: 1px solid black;"><tr><td rowspan="3" width="100px">' + data[0][i].boardNo + '</td><td rowspan="3">'
												+ '<img src="' + data[0][i].filePaths[0] + '" width="200px" height="150px"></td>'
												+ '<td align="left" valign="bottom"><label class="textreview">' + data[0][i].boardTitle + '</label></td>'
												+ '<td rowspan="3" valign="top" width="40px"><img class="heart" src="/semiproject/images/heartblack.png"></td><td align="right" valign="bottom">' + data[0][i].uploadDate + '</td>'
												+ '<td rowspan="2" width="180px" align="center"><div class="profileBox" align="center"><img id="cprofilePic' + i + '" class="profile" src="">'
												+ '</div></td></tr><tr><td width="400px" align="left" valign="top" rowspan="2"><label>' + data[0][i].hashTags + '</label></td>'
												+ '<td align="right" valign="top" width="100px">조회수 : ' + data[0][i].viewCount + '</td></tr>'
												+ '<tr><td align="right"><button class="report">신고</button></td><td id="cprofileNickName' + i + '" align="center">'
												+ '</td></tr></table>'
												+ '<input id="mNo' + i + '" type="hidden" value="' + data[0][i].memberNo + '">'
										);
										
										$("#maxPage").html("  마지막 페이지 : " + data[1].maxPage);
										
										getUserInfo();
									}
								}
						}
					});
				}
				
				function getUserInfo() {
					var mNo = $("#mNo" + 0).val();
						
					$.ajax({
						url: "/semiproject/selectMember.me",
						type: "post",
						data: {mNo: mNo},
						success: function(data) {
							$("#cprofilePic" + 0).attr("src", data.filePath);
							$("#cprofileNickName" + 0).html(data.mNickname);
						}
					});
					
					var mNo = $("#mNo" + 1).val();
					
					$.ajax({
						url: "/semiproject/selectMember.me",
						type: "post",
						data: {mNo: mNo},
						success: function(data) {
							$("#cprofilePic" + 1).attr("src", data.filePath);
							$("#cprofileNickName" + 1).html(data.mNickname);
						}
					});
					
					var mNo = $("#mNo" + 2).val();
					
					$.ajax({
						url: "/semiproject/selectMember.me",
						type: "post",
						data: {mNo: mNo},
						success: function(data) {
							$("#cprofilePic" + 2).attr("src", data.filePath);
							$("#cprofileNickName" + 2).html(data.mNickname);
						}
					});
				};
			</script>
			<hr>
			<div class="textArea" id="courseTableDiv"></div>
			<input type="number" id="pagingNo" style="width:45px;" min="1">
			<button id="pagingGo" onclick="pagingGo();">페이지로 이동</button>
			<span id="maxPage"></span>
			<script>
				function pagingGo() {
					var requestNo = $("#pagingNo").val();
					currentPage = requestNo;
					ajaxSort();
				}
			</script>
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
				<button id="write2">글쓰기</button>
			</div>
			<script>
				sortEnp = "조회순";
				currentPageEnp = 1;
				
				$(function() {
					ajaxSortEnp();
				});
				
				$("#btnArea2 button[class=check]").click(function() {
					sortEnp = $(this).html();
					currentPageEnp = 1;
					
					$.ajax({
						url: "/semiproject/getEnpBoard.bo",
						type: "post",
						data: {sort: sortEnp, currentPage: currentPageEnp},
						success: function(data) {
							ajaxSortEnp();
						}
					});
				});
				
				function ajaxSortEnp() {
					$.ajax({
						url: "/semiproject/getEnpBoard.bo",
						type: "post",
						data: {sort: sortEnp, currentPage: currentPageEnp},
						success: function(data) {
								if(currentPageEnp > data[1].maxPage) {
									currentPageEnp = 1;
									$("#pagingNoEnp").val(currentPageEnp);
								} else {
									$("#enpTableDiv").html("");
									
									for(var i = 0; i < data[0].length; i++) {
										
										$("#enpTableDiv").append(
												'<table style="border-bottom: 1px solid black;"><tr><td rowspan="3" width="100px">' + data[0][i].boardNo + '</td><td rowspan="3">'
												+ '<img src="' + data[0][i].filePaths[0] + '" width="200px" height="150px"></td>'
												+ '<td align="left" valign="bottom"><label class="textreview">' + data[0][i].boardTitle + '</label></td>'
												+ '<td rowspan="3" valign="top" width="40px"><img class="heart" src="/semiproject/images/heartblack.png"></td><td align="right" valign="bottom">' + data[0][i].uploadDate + '</td>'
												+ '<td rowspan="2" width="180px" align="center"><div class="profileBox" align="center"><img id="eprofilePic' + i + '" class="profile" src="">'
												+ '</div></td></tr><tr><td width="400px" align="left" valign="top" rowspan="2"><label>' + data[0][i].hashTags + '</label></td>'
												+ '<td align="right" valign="top" width="100px">조회수 : ' + data[0][i].viewCount + '</td></tr>'
												+ '<tr><td align="right"><button class="report">신고</button></td><td id="eprofileNickName' + i + '" align="center">'
												+ '</td></tr></table>'
												+ '<input id="mNoEnp' + i + '" type="hidden" value="' + data[0][i].memberNo + '">'
										);
										$("#maxPageEnp").html("  마지막 페이지 : " + data[1].maxPage);
										
										getUserInfoEnp();
									}
								}
						}
					});
				}
				
				function getUserInfoEnp() {
					var mNoEnp = $("#mNoEnp" + 0).val();
						
					$.ajax({
						url: "/semiproject/selectMember.me",
						type: "post",
						data: {mNo: mNoEnp},
						success: function(data) {
							$("#eprofilePic" + 0).attr("src", data.filePath);
							$("#eprofileNickName" + 0).html(data.mNickname);
						}
					});
					
					var mNoEnp = $("#mNoEnp" + 1).val();
					
					$.ajax({
						url: "/semiproject/selectMember.me",
						type: "post",
						data: {mNo: mNoEnp},
						success: function(data) {
							$("#eprofilePic" + 1).attr("src", data.filePath);
							$("#eprofileNickName" + 1).html(data.mNickname);
						}
					});
					
					var mNoEnp = $("#mNoEnp" + 2).val();
					
					$.ajax({
						url: "/semiproject/selectMember.me",
						type: "post",
						data: {mNo: mNoEnp},
						success: function(data) {
							$("#eprofilePic" + 2).attr("src", data.filePath);
							$("#eprofileNickName" + 2).html(data.mNickname);
						}
					});
				};
			</script>
			<hr>
			<div class="textArea" id="enpTableDiv"></div>
			<input type="number" id="pagingNoEnp" style="width:45px;" min="1">
			<button id="pagingGoEnp" onclick="pagingGoEnp();">페이지로 이동</button>
			<span id="maxPageEnp"></span>
			<script>
				function pagingGoEnp() {
					var requestNoEnp = $("#pagingNoEnp").val();
					currentPageEnp = requestNoEnp;
					ajaxSortEnp();
				}
			</script>
		</div>
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
			
			$("#addEnpBtn").click(function(){
				location.href="/semiproject/views/upload/foodUpload.jsp";
			});
			
			$("#write1").click(function(){
				location.href="/semiproject/views/upload/scheduleUpload.jsp";
			});
			
			$("#write2").click(function(){
				location.href="/semiproject/views/upload/scheduleUpload.jsp";
			});
		</script>
</body>
</html>