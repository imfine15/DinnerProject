<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.enterprise.model.vo.*, java.util.Map.*, java.util.*, com.kh.semi.review.model.vo.*"%>
<!DOCTYPE html>
<%
EnpVO selectedEnp = (EnpVO)session.getAttribute("selectedEnp");
double rating = (double)session.getAttribute("rating");
ArrayList<ReviewVO> visitReviews = (ArrayList<ReviewVO>)session.getAttribute("visitReviews");
ArrayList<ReviewVO> normalReviews = (ArrayList<ReviewVO>)session.getAttribute("normalReviews");
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/semiproject/views/restaurantInfo/css/restaurantInfoStyle.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>YUMEET - <%= selectedEnp.getEnpName() %></title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico"
	type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico"
	type="image/x-icon">
<style>
.dd {
	background: gray;
	color: #FFFFFF;
	border: 0;
	outline: 0;
	width: 80px;
	height: 25px;
	font-size: 15px;
	border-radius: 5px;
}
#map{
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	<div id="infoTop">
		<div id="top1">
			<span id="title"><%= selectedEnp.getEnpName() %></span>
			<div>
			<img alt="별점 이미지" src="/semiproject/images/Star.png" id="star">
			<span id="score"><%= Math.round(selectedEnp.getRating() * 10.0) / 10.0 %></span>
			<br>
			<div style="height: 20px;">
			<img alt="즐겨찾기 이미지" src="/semiproject/images/heart.png" id="heart">
			<p id="likeCount"></p>
			<img alt="리뷰 이미지" src="/semiproject/images/comment.png" id="comment">
			<p id="commentCount"></p>
			</div>
			<script>
				$(function() {
					$.ajax({
						url: "/semiproject/countComment.re",
						type: "post",
						data: {enpNo: "<%= selectedEnp.getEnpNo() %>"},
						success: function(data) {
							$("#commentCount").html(data);
						}
					});
				});
				
				$(function() {
					$.ajax({
						url: "/semiproject/getLikeCount.se",
						type: "post",
						data: {enpNo: "<%= selectedEnp.getEnpNo() %>"},
						success: function(data) {
							$("#likeCount").html(data);
						}
					});
				});
			</script>
		</div>
		<div id="top2">
			<div id="likeDiv">
				<img alt="즐겨찾기 이미지" src="/semiproject/images/like.png" id="likeImg">
				<br>
				<span class="commentAndLike">좋아요</span>
			</div>
			<div id="commentDiv">
				<img alt="리뷰쓰기 이미지" src="/semiproject/images/comment.png" id="commentImg">
				<br>
				<span class="commentAndLike">리뷰쓰기</span>
			</div>
		</div>
		<script>
			<% if(loginUser != null) { %>
			$("#likeImg").click(function() {
				var enpNo = "<%= selectedEnp.getEnpNo() %>";
				var mNo = "<%= loginUser.getmNo() %>";
				$.ajax({
					url: "/semiproject/plusLikeCount.se",
					type: "post",
					data: {enpNo: enpNo, mNo: mNo},
					success: function(data) {
						if(data === 0) {
							window.alert("이미 좋아요를 누른 가게입니다.");
						} else if(data === 1) {
							$("#likeCount").html(<%= selectedEnp.getLikeCount() %> + 1);
							window.alert("<%= selectedEnp.getEnpName() %> 가게에 좋아요를 누르셨습니다.")
						}
					}
				});
			})
			<% } else { %>
			$("#likeImg").click(function() {
				window.alert("로그인을 해야 좋아요를 하실 수 있습니다.");
			});
			<% } %>
		</script>
	</div>
	<hr class="hr">
	<div id="info">
		<div id="infoLeft">
			<table id="infoTable">
				<tr>
					<td class="infoTitle">전화번호</td>
					<td class="infoContent"><%= selectedEnp.getEnpPhone() %></td>
				</tr>
				<tr>
					<td class="infoTitle">가격대</td>
					<td class="infoContent"><%= selectedEnp.getPriceRange() %></td>
				</tr>
				<tr>
					<td class="infoTitle">대표메뉴</td>
					<td class="infoContent" id="menus"><%= selectedEnp.getMenuName() %> - <%= selectedEnp.getMenuPrice() %></td>
				</tr>
				<tr>
					<td class="infoTitle">웹 사이트</td>
					<td class="infoContent"><%= selectedEnp.getWebsite() %></td>
				</tr>
				<tr>
					<td class="infoTitle">영업시간</td>
					<td class="infoContent"><%= selectedEnp.getEnpHour() %></td>
				</tr>
				<tr>
					<td class="infoTitle">휴무일</td>
					<td class="infoContent"><%= selectedEnp.getClosedDay() %></td>
				</tr>
				<tr>
					<td class="infoTitle">주차공간</td>
					<td class="infoContent"><%= selectedEnp.getParkingPossible() %></td>
				</tr>
				<tr>
					<td class="infoTitle">해시태그</td>
					<td class="infoContent"><%= selectedEnp.getHashTags() %></td>
				</tr>
				<tr>
					<td class="infoTitle">주소</td>
					<td class="infoContent">
						<%= selectedEnp.getEnpAddress() %>
						<br>
					</td>
				</tr>
			</table>
		</div>
		<div id="infoRight">
			<img style="max-width: 100%; max-height:100%; overflow: hidden; margin-top: 50px;" alt="매장 대표사진" src="<%=request.getContextPath()%>/thumbnail_uploadFile/<%=selectedEnp.getChangeName() %>" id="">
		</div>
		<script>
			$(function() {
				$.ajax({
					url: "/semiproject/getEnpFile.en",
					type: "post",
					data: {enpNo: "<%= selectedEnp.getEnpNo() %>"},
					success: function(data) {
						$("#dishPic").attr("src", data);
					}
				});
			});
		</script>
	</div>
	<div id="map" style="width:80%;height:350px;"></div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=078a45ca6340bb6d0f44091d9e735d04&libraries=services"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('<%= selectedEnp.getEnpAddress() %>', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=selectedEnp.getEnpName()%></div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } else {
	    	console.log("실패");
	    }
	});
		</script>
	<% if(selectedEnp.getEnpPartnerType().equals("PARTNER")) { %>
	<div id="reservationDiv">
		<button>예약하기</button>
	</div>
	<script>
		var enpNo = "<%= selectedEnp.getEnpNo() %>";
		$("#reservationDiv button").click(function() {
			location.href="<%= request.getContextPath() %>/views/payment/paymentPage.jsp?enpNo=" + enpNo; 
		});
	</script>
	<% } else { %>
		<br><br>
	<% } %>
	<div id="adDiv">
		<div id="adContent">
			<div id="adBtn">
				<div id="adCloseBtn"><img alt="광고 종료 버튼" src="/semiproject/images/adCloseBtn.png"></div>
				<p></p>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$.ajax({
				url: "/semiproject/foundAllAd.ad",
				type: "get",
				success: function(data) {
					$("#adCloseBtn").click(function() {
						$("#adDiv").hide();
					});
					
					$("#adBtn p").html(data.adContent);
				}
			});
		});
	</script>
	<hr class="hr">
	<div class="ReviewDiv">
		<div class="ReviewCount" id="visitReviewCount"></div>
		<script>
			$(function() {
				$.ajax({
					url: "/semiproject/countTypeReview.re",
					type: "post",
					data: {enpNo: "<%= selectedEnp.getEnpNo() %>", type: "방문"},
					success: function(data) {
						$("#visitReviewCount").html("방문자 리뷰(" + data + ")");
					}
				});
			});
		</script>
		<% if(loginUser != null) { %>
		<div onclick="visitReviewWrite();" class="ReviewWrite">작성하기 <img alt="리뷰 작성 버튼" src="/semiproject/images/writeReview.png" class="writeReviewBtn"></div>
			<script>
				function visitReviewWrite() {
					var enpNo = "<%= selectedEnp.getEnpNo() %>";
					$.ajax({
						url: "/semiproject/checkVisit.re",
						type: "post",
						data: {enpNo: enpNo, mNo: "<%= loginUser.getmNo() %>"},
						success: function(data) {
							if(data[0] !== null || data[1] !== null) {
								var rhn = data[0]; // 리뷰내역번호
								var visitDate = data[1]; // 방문일자
								var reviewType = "방문";
								location.href="<%= request.getContextPath() %>/views/restaurantInfo/newReview.jsp?rhn=" + rhn + "&visitDate=" + visitDate + "&reviewType=" + reviewType + "&enpNo=" + enpNo;
							} else {
								window.alert("방문 기록이 없습니다.");
							}
						}
					});
				}
			</script>
		<% } %>
	</div>
	<hr class="hr">
	<!-- visitorReview Div start -->
	<div class="visitorReview">
	<% if(visitReviews.size() != 0) {
	for(int i = 0; i < visitReviews.size(); i++) { %>
		<div class="visitorInfo">
			<table>
				<tr>
					<td><img id="profilePic<%= i %>" alt="사용자 프로필 사진" src=""></td>
				</tr>
				<tr>
					<td id="profileNickName<%= i %>"></td>
				</tr>
				<tr>
					<td>방문일 : <%= visitReviews.get(i).getVisitDate() %></td>
				</tr>
			</table>
		</div>
		<script>
			$(function() {
				var mNo = "<%= visitReviews.get(i).getMemberNo() %>";
				
				$.ajax({
					url: "/semiproject/selectMember.me",
					type: "post",
					data: {mNo: mNo},
					success: function(data) {
						$("#profilePic<%= i %>").attr("src", data.filePath).css({"width" : "110px", "height" : "110px"});
						$("#profileNickName<%= i %>").html(data.mNickname);
					}
				});
			});
		</script>
		<div class="visitorReviewContent">
			<div class="visitorReviewArticle">
				<span class="reviewDate"><%= visitReviews.get(i).getReviewDate() %></span>
				<img alt="리뷰 별점" src="/semiproject/images/Star.png" class="reviewRateStar">
				<span class="reviewRate"><%= visitReviews.get(i).getAverageRating() %></span>
				<p><%= visitReviews.get(i).getReviewContent() %></p>
			</div>
			<div class="visitorReviewPic">
				<img alt="음식 사진" src="<%= visitReviews.get(i).getFilePaths()[0] %>">
				<img alt="음식 사진" src="<%= visitReviews.get(i).getFilePaths()[1] %>">
			</div>
		</div>
		<div class="likeAndReport">
			<div class="reviewReport">
				<button class="reviewReportBtn">신고하기</button>
			</div>
		</div>
	</div>
	<!-- visitorReview Div end -->
	<hr class="hr">
	<% 	} %>
	<% } else { %>
		<div style="margin:20px 0px; text-align:center;">아직 방문자 리뷰가 없습니다.</div>
	<% } %>
	<div id="showMore">
		<button>더보기 ▼</button>
	</div>
	<br>
	<hr class="hr">
	<div class="ReviewDiv">
		<div class="ReviewCount" id="normalReviewCount"></div>
		<script>
			$(function() {
				$.ajax({
					url: "/semiproject/countTypeReview.re",
					type: "post",
					data: {enpNo: "<%= selectedEnp.getEnpNo() %>", type: "일반"},
					success: function(data) {
						$("#normalReviewCount").html("일반 리뷰(" + data + ")");
					}
				});
			});
		</script>
		<% if(loginUser != null) { %>
		<div id="normalReviewWrite" class="ReviewWrite">작성하기 <img alt="리뷰 작성 버튼" src="/semiproject/images/writeReview.png" class="writeReviewBtn"></div>
		<%-- <script>
			$("#normalReviewWrite").click(function() {
				location.href="<%= request.getContextPath() %>/views/restaurantInfo/newReview.jsp?reviewType=일반&enpNo=" + enpNo;
			});
		</script> --%>
		<% } %>
	</div>
	<hr class="hr">
	<% if(normalReviews.size() != 0) { 
		for(int i = 0; i < normalReviews.size(); i++) { %>
	<div class="visitorReview" style="height:150px;">
		<div class="visitorInfo">
			<p id="normalProfileNickName<%= i %>"></p>
		</div>
		<script>
			$(function() {
				var mNo = "<%= normalReviews.get(i).getMemberNo() %>";
				
				$.ajax({
					url: "/semiproject/selectMember.me",
					type: "post",
					data: {mNo: mNo},
					success: function(data) {
						$("#normalProfileNickName<%= i %>").html(data.mNickname);
					}
				});
			});
		</script>
		<div class="visitorReviewContent">
			<div class="visitorReviewArticle">
				<span class="reviewDate"><%= normalReviews.get(i).getReviewDate() %></span>
				<p><%= normalReviews.get(i).getReviewContent() %></p>
			</div>
		</div>
		<div class="likeAndReport">
			<div class="reviewReport">
				<button class="reviewReportBtn">신고하기</button>
			</div>
		</div>
	</div>
	<hr class="hr">
	<% 	} %>
	<% } else { %>
		<div style="margin:20px 0px; text-align:center;">아직 일반 리뷰가 없습니다.</div>
	<% } %>
	<div id="showMore">
		<button>더보기 ▼</button>
	</div>
	<div id="restaurantCloseReport">
	<% if(selectedEnp.getEnpStatus().equals("Y")) { %>
		<input type='button' id='btn1' value='폐업신고' disabled="disabled" style="cursor:default; box-shadow: none;"/>
	<% } else { %> 
		<input class="dd" type='button' id='shutdown' value='폐업신고'/>
	<% } %>
	</div>
	<hr class="hr">
	<div id="yumeetRecommend">
		<img alt="여밋 로고" src="/semiproject/images/YUMEET LOGO WITH REST.png">
		추천 다음 코스
	</div>
	<hr class="hr">
	<div id="recommendDiv">
		<div id="recommendDiv1">
			<img alt="추천 맛집 첫번째" src="">
			<p></p>
		</div>
		<div id="recommendDiv2">.
			<img alt="추천 맛집 두번째" src="">
			<p></p>
		</div>
		<div id="recommendDiv3">
			<img alt="추천 맛집 두번째" src="">
			<p></p>
		</div>
	</div>
	<script>
	$("#shutdown").click(function(){
		location.href="<%=request.getContextPath()%>/views/qna/question.jsp";
	});
		$(function() {
			$.ajax({
				url: "/semiproject/selectTopThree.bo",
				type: "post",
				success: function(data) {
					for(var i = 0; i < 3; i++) {
						$("#recommendDiv" + (i + 1)).children("img").attr("src", data[i].filePaths[0]);
						$("#recommendDiv" + (i + 1)).children("p").html(data[i].boardTitle);
					}
				}
			})
		});
		
		$("#shutdown").click(function() {
			location.href="<%= request.getContextPath() %>/views/qna/question.jsp?enpNo=" + enpNo; 
		});
	</script>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>