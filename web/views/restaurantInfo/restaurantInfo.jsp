<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/semiproject/views/restaurantInfo/css/restaurantInfoStyle.css"/>
<meta charset="UTF-8">
<%-- 나중에 음식점 이름 알아와서 타이틀에 넣는것도 좋을 것 같아요 --%>
<title>돼지되지 음식점 정보</title>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	<div id="infoTop">
		<div id="top1">
			<span id="title">돼지되지</span>
			<img alt="별점 이미지" src="/semiproject/images/Star.png" id="star">
			<span id="score">4.6</span>
			<br>
			<img alt="즐겨찾기 이미지" src="/semiproject/images/heart.png" id="heart">
			<p id="likeCount">250</p>
			<img alt="리뷰 이미지" src="/semiproject/images/comment.png" id="comment">
			<p id="commentCount">112</p>
		</div>
		<div id="top2">
			<div id="likeDiv">
				<img alt="즐겨찾기 이미지" src="/semiproject/images/like.png" id="likeImg">
				<br>
				<span class="commentAndLike">좋아요</span>
			</div>
			<div id="commentDiv">
				<img alt="즐겨찾기 이미지" src="/semiproject/images/comment.png" id="commentImg">
				<br>
				<span class="commentAndLike">리뷰쓰기</span>
			</div>
		</div>
	</div>
	<hr class="hr">
	<div id="info">
		<div id="infoLeft">
			<table id="infoTable">
				<tr>
					<td class="infoTitle">전화번호</td>
					<td class="infoContent">02-555-6666</td>
				</tr>
				<tr>
					<td class="infoTitle">가격대</td>
					<td class="infoContent">만원 ~ 2만원</td>
				</tr>
				<tr>
					<td class="infoTitle">메뉴</td>
					<td class="infoContent">규카츠정식 14900원<br>카츠동 9900원<br>규동 9900원</td>
				</tr>
				<tr>
					<td class="infoTitle">웹 사이트</td>
					<td class="infoContent">http://www.gyukatsuhouse.com/</td>
				</tr>
				<tr>
					<td class="infoTitle">영업시간</td>
					<td class="infoContent">10 : 00 ~ 21 : 00</td>
				</tr>
				<tr>
					<td class="infoTitle">휴무일</td>
					<td class="infoContent">매주 화요일 휴무</td>
				</tr>
				<tr>
					<td class="infoTitle">주차공간</td>
					<td class="infoContent">주차공간 없음</td>
				</tr>
				<tr>
					<td class="infoTitle">해시태그</td>
					<td class="infoContent">#규카츠 #일식 #카츠동 #규동 #양재동</td>
				</tr>
				<tr>
					<td class="infoTitle">주소</td>
					<td class="infoContent">
						서울특별시 강남구 역삼동 파덕로 80길 파덕상가
						<br>
						<br>
						<span id="oldAddress">지번</span>
						서울시 강남구 역삼동 59 파덕상가
					</td>
				</tr>
			</table>
		</div>
		<div id="infoRight">
			<img alt="매장 대표사진" src="/semiproject/images/dishPic.png" id="dishPic">
		</div>
	</div>
	<div id="reservationDiv">
		<button>예약하기</button>
	</div>
	<div id="adDiv">
		<div id="adContent">
			<div id="adBtn">
				<div id="adCloseBtn"><img alt="광고 종료 버튼" src="/semiproject/images/adCloseBtn.png"></div>
				<div id="adInfoBtn"><img alt="광고 정보 버튼" src="/semiproject/images/adInfoBtn.png"></div>
			</div>
			<span>세상에서 가장 간편한 스낵</span>
		</div>
		<div id="adPic">
			<img alt="배너광고" src="/semiproject/images/snackKing.png" id="ad">
		</div>
	</div>
	<hr class="hr">
	<div class="ReviewDiv">
		<div class="ReviewCount">방문자 리뷰 (32)</div>
		<div class="ReviewWrite">작성하기 <img alt="리뷰 작성 버튼" src="/semiproject/images/writeReview.png" class="writeReviewBtn"></div>
	</div>
	<hr class="hr">
	<!-- visitorReview Div start -->
	<div class="visitorReview">
		<div class="visitorInfo">
			<table>
				<tr>
					<td><img alt="사용자 프로필 사진" src="/semiproject/images/userPic1.png"></td>
				</tr>
				<tr>
					<td>파덕이사생팬</td>
				</tr>
				<tr>
					<td>방문일 : 2020-06-17</td>
				</tr>
			</table>
		</div>
		<div class="visitorReviewContent">
			<div class="visitorReviewArticle">
				<span class="reviewDate">2020-06-18</span>
				<img alt="리뷰 별점" src="/semiproject/images/Star.png" class="reviewRateStar">
				<span class="reviewRate">4.5</span>
				<p>서비스가 맛있고 돈까스가 친절해요. 다섯이 가서 넷이 죽어도 모를 맛입니다. 최고입니다.</p>
			</div>
			<div class="visitorReviewPic">
				<img alt="음식 사진" src="/semiproject/images/규카츠.jpg">
				<img alt="음식 사진" src="/semiproject/images/dishPic.png">
			</div>
		</div>
		<div class="likeAndReport">
			<div class="reviewLike">
				<table>
					<tr>
						<td><img alt="리뷰 추천 버튼" src="/semiproject/images/reviewLike.png" class="reviewLikeBtn"></td>
					</tr>
					<tr>
						<td>추천하기</td>
					</tr>
				</table>
			</div>
			<div class="reviewReport">
				<button class="reviewReportBtn">신고하기</button>
			</div>
		</div>
	</div>
	<!-- visitorReview Div end -->
	<hr class="hr">
	<!-- visitorReview Div start -->
	<div class="visitorReview">
		<div class="visitorInfo">
			<table>
				<tr>
					<td><img alt="사용자 프로필 사진" src="/semiproject/images/userPic2.png"></td>
				</tr>
				<tr>
					<td>효근짱123</td>
				</tr>
				<tr>
					<td>방문일 : 2020-06-07</td>
				</tr>
			</table>
		</div>
		<div class="visitorReviewContent">
			<div class="visitorReviewArticle">
				<span class="reviewDate">2020-06-09</span>
				<img alt="리뷰 별점" src="/semiproject/images/Star.png" class="reviewRateStar">
				<span class="reviewRate">4.0</span>
				<p>스물셋 제 생에 최고의 규카츠였습니다....오래오래 장사해주세요 뚜뚜사장님^^</p>
			</div>
			<div class="visitorReviewPic">
				<img alt="음식 사진" src="/semiproject/images/규카츠.jpg">
				<img alt="음식 사진" src="/semiproject/images/dishPic.png">
			</div>
		</div>
		<div class="likeAndReport">
			<div class="reviewLike">
				<table>
					<tr>
						<td><img alt="리뷰 추천 버튼" src="/semiproject/images/reviewLike.png" class="reviewLikeBtn"></td>
					</tr>
					<tr>
						<td>추천하기</td>
					</tr>
				</table>
			</div>
			<div class="reviewReport">
				<button class="reviewReportBtn">신고하기</button>
			</div>
		</div>
	</div>
	<!-- visitorReview Div end -->
	<div id="showMore">
		<button>더보기 ▼</button>
	</div>
	<br>
	<hr class="hr">
	<div class="ReviewDiv">
		<div class="ReviewCount">일반 리뷰 (51)</div>
		<div class="ReviewWrite">작성하기 <img alt="리뷰 작성 버튼" src="/semiproject/images/writeReview.png" class="writeReviewBtn"></div>
	</div>
	<hr class="hr">
	<div class="visitorReview">
		<div class="visitorInfo">
			<p>IMFINE</p>
		</div>
		<div class="visitorReviewContent">
			<div class="visitorReviewArticle">
				<span class="reviewDate">2019-09-15</span>
				<p>규카츠가 장관이네요..절경이고요..신이 주신 선물이네요.</p>
			</div>
		</div>
		<div class="likeAndReport">
			<div class="reviewLike">
				<table>
					<tr>
						<td><img alt="리뷰 추천 버튼" src="/semiproject/images/reviewLike.png" class="reviewLikeBtn"></td>
					</tr>
					<tr>
						<td>추천하기</td>
					</tr>
				</table>
			</div>
			<div class="reviewReport">
				<button class="reviewReportBtn">신고하기</button>
			</div>
		</div>
	</div>
	<div id="showMore">
		<button>더보기 ▼</button>
	</div>
	<hr class="hr">
	<div id="restaurantCloseReport">
		<button>폐업신고</button>
	</div>
	<hr class="hr">
	<div id="yumeetRecommend">
		<img alt="여밋 로고" src="/semiproject/images/YUMEET LOGO WITH REST.png">
		추천 다음 코스
	</div>
	<hr class="hr">
	<div id="recommendDiv">
		<div id="recommendDiv1">
			<img alt="추천 맛집 첫번째" src="/semiproject/images/연어.jpg">
			<p>내 뱃살보다 두툼한 연어</p>			
			<span></span>
		</div>
		<div id="recommendDiv2">
			<img alt="추천 맛집 두번째" src="/semiproject/images/장어구이.jpg">
			<p>하나먹다 셋이죽는 장어 맛집</p>
		</div>
		<div id="recommendDiv3">
			<img alt="추천 맛집 두번째" src="/semiproject/images/죠떡.jpg">
			<p>죠스떡볶이는 전설이다...</p>
		</div>
	</div>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>