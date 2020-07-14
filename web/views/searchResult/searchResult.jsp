<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>YUMEET</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<style>
	#switch1 {
		display: none;
	}
	.round {
		display: inline-block;
		width: 50px;
		height: 17px;
		cursor: pointer;
		position: relative;
		background-color: #D5706D;
		border-radius: 17px;
	}
	.round::before{
		content: '';
		display: block;
		width: 13px;
		height: 13px;
		left: 2px;
		bottom: 2px;
		position: absolute;
		background-color: white;
		transition : all .4s ease;
		border-radius: 50%;
	}
	#switch1:checked + .round {
		background-color: #58ABA6;
	}
	#switch1:checked + .round:before {
		-webkit-transform: translateX(32px);
		-ms-transform: translateX(32px);
		transform: translateX(32px);
	}
	
	/* 여기까지가 스위치버튼css */
	.outer{
		width: 1200px;
		height: 2000px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 50px;
	}
	.inner{
		width: 900px;
	}
	#text1{
		font-family: 나눔손글씨체;
		font-size: 24px;
		text-align: left;
		
	}
	.topbtn{
		
		margin-left: 100px;
		display: inline-block;
	}
	.toptext{
		display: inline-block;
		margin-right: 300px;
		
	}
	.btntext{
		font-size: 18px;
	}
	#filterImg{
		width: 40px;
		height: auto;
		position: relative;
        top: 12px;
	}
	#side{
		width:350px;
		height: 1800px;
		background-color: #EFEFEF;
		border-radius: 30px 0 0 0;
		display: inline-block;
		float: right;
	}
	section{
		width:650px;
		display: inline-block;
		text-align: left;
		position: relative;
		float: left;
	}
	aside{
		display: inline-block;
		float: right;
		
		
	}
	.maintext{
		padding-left: 5px;
		font-size: 18px;
		float: left;
	}
	.rating{
		float: right;
		font-size: 18px;
		color: #E15756;
		padding-right: 5px;
		
	}
	.small{
		padding-left: 5px;
		font-size: 12px;
		color: #6F6F6F;
	}
	.foodImg{
		width: 350px;
		height: 170px;
		border-radius: 30px;
	}
	.foodArea{
		display: inline-block;
		margin: 30px;
	}
	footer{
		clear: both;
	}
	#keyword{
		font-size: 24px;
		color: #E15756;
		float: left;
		margin-left: 30px;
		margin-bottom: 0px;
		font-weight: bold;
	}
	#keywordArea{
		width: 280px;
		height: 150px;
		background: #EAD9D5;
		margin-top: 10px;
		border-radius: 30px;
		text-align: left;
		padding-top: 15px;
		padding-left: 8px;
	}
	.keybtn{
		background: #F7F6F6;
 		color: #DD6664;
		border: 0;
		outline: 0;
		width: 85px;
		height: 23px;
		border: 1px solid #DD6664;
		border-radius: 5px;
		margin: 2px;
		margin-top: 5px;
		vertical-align: middle;
	}
	
	#ad {
		margin-top: 30px;
	}
	#adImg{
		 width: 270px;
		 height: auto;
		 border: 1px solid black;
	}
	#review{
		font-size: 24px;
		color: #E15756;
		float: left;
		margin-left: 20px;
		margin-bottom: 0px;
		font-weight: bold;
	}
	

	 .img{
        position: relative;
        background-image: url(/semiproject/images/장어구이.jpg);                                                               
        width: 290px;
		height: 150px;
		margin: 10px;
		margin-top:50px;
        background-size: cover;
    }

    .img-cover{
       position: absolute;
       height: 100%;
       width: 100%;
       background-color: rgba(0, 0, 0, 0.5);                                                                 
       z-index:1;
    }

    .img .content{
         position: absolute;
         top:50%;
         left:50%;
         transform: translate(-50%, -50%);                                                                   
         color: white;
         font-size: 18px;
         z-index: 2;
         text-align: center;
         
    }
    .reviewArea{
    	width: 300px;
    	height: 50px;
    	margin: 10px;
    }
	#reviewsmall{
		font-size: 12px;
		margin: 0;
	}
	#schedule {
		width: 1200px;
		height: auto;
		margin-left: auto;
		margin-right: auto;
		margin-top: 50px;
	}
	#text2{
		font-size: 24px;
		color: #58AAA4;
		float: left;
		display: inline-block;
		width: 1100px;
		margin-left: 80px;
		
	}
	.best{
		margin-left: 100px;
		position: static;
		display: inline-block;
		
	}
	.bestBig{
		font-size: 24px;
		margin: 5px;
		margin-top: 10px;
	}
	.bestSmall{
		font-size: 18px;
		margin: 5px;
	}
	.check{
		background: white;
 		color: #7D7D7D;
		border: 0;
		outline: 0;
		width: 60px;
		height: 30px;
		font-size: 14px;
		margin-left: 5px;
	}
	.check:hover {
		color: #D5706D;
	}
	#text3{
		font-size: 24px;
		color: #535353;
		float: left;
		display: inline-block;
		font-weight: bold;
	}
	#write{
		background: #59AAA4;
 		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 100px;
		height: 30px;
		font-size: 14px;
		margin-left: 40px;
	}
	.inner2{
		margin-top: 50px;
		width: 1000px;
		text-align: center;
	}
	.btnArea{
		display: inline-block;
		width: 1200px;
	}
	.report{
		background: #FFFFFF;
 		color: red;
		border: 0;
		outline: 0;
		width: 40px;
		height: 30px;
		font-size: 14px;
		
	}
	.profileArea{
    	padding-top : 10px;
    	padding-bottom:10px;
		display: inline-block; 
		width: 110px; 
		height: 130px;
	}
	
	.profileBox{
		width: 100px;
   		height: 100px; 
    	border-radius: 70%;
    	overflow: hidden;
    	display: inline-block;
    	background: gray;
	}
	.profile{
		width: 100px;
		height: 100px;
		border-radius: 70%;
		object-fit: cover;
		z-index: 1;
	}
	.textArea{
		text-align: center;
		
	}
	.heart{
		 width : 25px;
		 vertical-align: top;
		 margin-top: 45px;
	}
	.dayArea{
	 	display: inline-block;
	 	
	}
	.textreview{
		font-size: 24px;
		font-weight: bold;
	}
	
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	
	<!-- outer start -->
	<div class="outer" align="center">
		<!-- 상단 글자랑 필터등등 -->
		<nav>
		<div class="toptext">
		<p id="text1">검색 결과</p>
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
				<div class="inner">
						<div id="foodArea1" class="foodArea">
							<img src="/semiproject/images/죠떡.jpg" class="foodImg"><br>
							<label class="maintext">떡볶이</label><label class="rating">4.2</label><br>
							<p class="small">역삼/선릉</p>
							<p class="small">떡볶이</p>
						</div>
						<div id="foodArea2"  class="foodArea">
							<img src="/semiproject/images/규카츠.jpg" class="foodImg"><br>
							<label class="maintext">규카츠냠</label><label class="rating">4.5</label><br>
							<p class="small">강남역</p>
							<p class="small">규카츠</p>
						</div>
						<div id="foodArea3"  class="foodArea">
							<img src="/semiproject/images/연어.jpg" class="foodImg"><br>
							<label class="maintext">이거시연어</label><label class="rating">4.0</label><br>
							<p class="small">강남역</p>
							<p class="small">연어/초밥</p>
						</div>
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
					<button class="keybtn">비건</button>
					<button class="keybtn">패스트푸드</button>
				</div>
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
					<td width="400px" align="left" valign="top" rowspan="2"><lable>빨리집에가고싶다그칭</label></td>
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
	<%@include file="../common/footer.jsp" %>
	<script>
		var toggle = false;
		
		
		btn.addEventListener('click', function() {
			toggle = !toggle;
			
			if(toggle == true){
				selector.classList.add('on');
				
			} else {
				selector.classList.remove('on');
				
			}
		}, false);
		</script>
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