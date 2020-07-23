<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.semi.payment.model.vo.*"%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="/semiproject/views/myPage/css/myPage.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
   $(function(){
	  	$("#listArea td").mouseenter(function(){
	  		$(this).parent().css({"background":"darkgray","cursor":"pointer"});
	  	}).mouseout(function(){
	  		$(this).parent().css({"background":"white"});
	  	}).click(function(){
	  		var num = $(this).parent().children().eq(0).text();
	  		
	  		console.log(num);
	  		location.href="<%=request.getContextPath()%>/selectOne.no?num=" + num;
	  	})
   });
   </script>
<style>
.info {
	font-family: Roboto;
	font-style: normal;
	font-weight: 500;
	font-size: 15px;
	line-height: 18px;
}

.text {
	font-family: Roboto;
	font-style: normal;
	font-weight: 600;
	font-size: 16px;
	line-height: 18px;
	color: #343434;
}
.text2 {
	font-family: Roboto;
	font-style: normal;
	font-weight: 500;
	font-size: 14px;
	line-height: 18px;
	color: #343434;
}
.text3 {
	font-family: Roboto;
	font-style: normal;
	font-weight: 550;
	font-size: 16px;
	line-height: 16px;
	text-align: center;
	border-radius: 5px;
	width: 50px;
	height: 30px;
}
.text4 {
	font-family: Roboto;
	font-style: normal;
	font-weight: 550;
	font-size: 16px;
	line-height: 16px;
	text-align: center;
	border-radius: 5px;
	width: 80px;
	height: 30px;
}
.text5 {
	font-family: Roboto;
	font-style: normal;
	font-weight: 550;
	font-size: 16px;
	line-height: 16px;
	text-align: center;
	border-radius: 5px;
	width: 70px;
	height: 30px;
	background: #E4E4E4;
	margin-left:5px;
}
.navbar{
	color: #666666;
	font-size: 20px;
}
.left{
	list-style-type:none;
	float:left;
	margin-left: 20px;
}
.left2:hover{
	text-decoration: none;
	border-bottom: 3px #E1A9A9 solid;
}
ul li a span:hover{
	color: pink;
}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	<div id="daumWrap" class="userinfo_type1 ">

		<div id="daumHead" role="banner">
			<div class="inner_head" style="padding-right:30px;">
				<h1>
					<a href="/semiproject/views/myPage/myPage.jsp" id="daumServiceLogo"><span class="ir_wa">내정보</span></a>
				</h1>
				<!-- PC 웹 내정보 GNB -->
				<div id="" role="navigation">
					<ul style="padding-top: 10px; padding-left:-30px;">
						<li class="left"><a class="left2" href="/semiproject/views/myPage/myPage.jsp"><span class="navbar" style="color: #E1A9A9;">내정보 홈</span></a></li>
						<li class="left"><a class="left2"  href="/semiproject/views/myPage/checkingPassword.jsp"><span class="navbar">내정보 관리</span></a></li>
						<li class="left"><a class="left2"  href="/semiproject/views/myPage/checkingPassword.jsp"><span class="navbar">비밀번호 변경</span></a></li>
						<li class="left"><a class="left2"  href=""><span class="navbar">고객센터</span></a></li>
						<li class="left"><a class="left2"  href="/semiproject/views/myPage/checkingPassword.jsp"><span class="navbar">회원탈퇴</span></a></li>
					</ul>
				</div>
			</div>
		</div>

		<hr class="hide" />


		<div id="daumContent" role="main">
			<div id="cMain">
				<div id="mArticle">
					<h2 id="daumBody" class="screen_out">내정보 홈 본문</h2>
					<br>
					<h1 style="color: #DA817F;">포인트 지급 및 사용</h1>
					<div style="width:400px; display: inline-block;!important">
					<button class="text3">1개월</button><button class="text3">2개월</button><button class="text4">3개월이상</button>
					</div>
					<div style="width:294px; display: inline-block;!important;" align="right">
					<button class="text5">전체</button><button class="text5">지급</button><button class="text5" style="margin-right:5px;">사용</button>
					</div>
					<br><br>
					
					<div style="width: 100%; background-color: pink; height: 30px; margin-top:-10px; padding-top:10px;">
						<label style="margin-left: 30px;"class="text">번호</label>
						<label style="margin-left: 80px;"class="text">포인트</label>
						<label style="margin-left: 80px;"class="text">일자</label>
						<label style="margin-left: 80px;"class="text">용도</label>
						<label style="margin-left: 100px;"class="text">내용</label>
					</div>
					
					<table style="border-bottom: 1px solid pink; border-spacing: 0 10px;" id="listArea">
						<tbody>
						
						</tbody>
					</table><div align="center">
						<button id="left1" class="pclick" type="button" value="1"><</button>
							<div id="bus" style="display: inline;">
				
							</div>
						<button id="right1" class="pclick" type="button" value="3">></button>
						</div>
				</div>

				<!--// mArticle -->
				<div id="mAside">
					<div class="wing_userinfo">
						<div class="section_myinfo">
							<a id="profileImageContainer" href="/semiproject/views/myPage/checkingPassword.jsp" class="link_profile"
								data-tiara-action-name="프로필_이미지_관리"> <img id=""
								alt="프로필 사진" class="img_profile"
								src="https://img1.daumcdn.net/thumb/R158x158/?fname=http%3A%2F%2Ftwg.tset.daumcdn.net%2Fprofile%2F-IMNvhQBTjI0&t=1593580361035">
								<span class="frame_img">프로필 이미지 관리</span> <span
								class="">프로필 이미지 업로드</span>
							</a> <a href="/semiproject/views/myPage/checkingPassword.jsp" class="link_user"
								data-tiara-action-name="내_정보">dydxkr님<br>
							</a><a class="link_user" href="/semiproject/views/myPage/myPoint.jsp">
							<label class="" >포인트 : 300</label>	
							</a>
							
							<div id="profileImageAgreeDialog" class="layer_manage"
								style="display: none">
							</div>
							
							<div id="profileImageChangeDialog" class="layer_manage"
								style="display: none">
							</div>
						</div>
						<div id="profileImageEditor"
							style="display: none; position: absolute; left: 50%; margin-left: -400px; top: 100px; z-index: 998; width: 800px; height: 600px"></div>
						<div class="section_info section_activity">
							<h4 class="txt_comm txt_activity">내 활동 내역</h4>
							<ul class="list_activity">
								
							</ul>
						</div>
						
					</div>
				</div>
				<!--// mAside -->
			</div>
			<!-- // cMain -->

		</div>
		<!-- // daumContent -->
	<%@ include file="/views/common/footer.jsp" %>
		<!-- // daumFoot -->

		<div id="wrapMinidaum"></div>
	</div>
	<script src="moment.js"></script>
	<script>
	function getFormatDate(date){
	    var year = date.getFullYear();              //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	}
	
		$.ajax({
			url: "/semiproject/selectPointList.py",
			type: "post",
			data: {
				mNo: "<%=loginUser.getmNo()%>",
				curval: 1
			},
			success: function(data){
				
				var listArea = $("#listArea");
				
				
				for(var key = 1; key <= data[0].length; key ++){
				var tr = $("<tr>");
				var div = $("<div>").css({"width":"72px", "margin-left":"40px"});
				var ctd = $("<td>").attr({
							"class":"text2"
						});
				var label = $("<label>").text(key);
				
				div.append(label);
				ctd.append(div);
				
				var div2 = $("<div>").css({"width":"72px", "margin-left":"40px"});
				var ctd2 = $("<td>").attr({
							"class":"text2"
						});
				var label2 = $("<label>").text(Math.abs(data[0][key-1].pAmount));
				
				div2.append(label2);
				ctd2.append(div2);
				
				var div3 = $("<div>").css({"width":"80px", "margin-left":"40px"});
				var ctd3 = $("<td>").attr({
							"class":"text2"
						});
				var d = new Date(data[0][key - 1].pointDate);
				var label3 = $("<label>").text(getFormatDate(d));
				
				div3.append(label3);
				ctd3.append(div3);
				
				var div4 = $("<div>").css({"width":"72px", "margin-left":"40px"});
				var ctd4 = $("<td>").attr({
							"class":"text2"
						});
				var label4 = $("<label>").text(data[0][key-1].saveStatue);
				
				div4.append(label4);
				ctd4.append(div4);
				
				var div5 = $("<div>").css({"width":"190px", "margin-left":"40px"});
				var ctd5 = $("<td>").attr({
							"class":"text2"
						});
				var label5 = "3";
				if(data[0][key-1].saveStatue == '사용'){
					label5 = $("<label>").text("예약 서비스에 대한 "+data[0][key-1].saveStatue);
				} else {
					if(data[0][key-1].saveCode == 'ST1'){
						label5 = $("<label>").text("리뷰 서비스에 대한 적립"); //리뷰
					} else if(data[0][key-1].saveCode == 'ST2'){
						label5 = $("<label>").text("예약 서비스에 대한 적립"); //예약
					} else {
						label5 = $("<label>").text("게시글서비스에 대한 적립"); //게시글
					}
				}
				
				div5.append(label5);
				ctd5.append(div5);
				
				var br = $("<br>");
				tr.append(ctd);
				tr.append(ctd2);
				tr.append(ctd3);
				tr.append(ctd4);
				tr.append(ctd5);
				listArea.append(tr);
				listArea.append(br);
				}
				for(var key = 0; key < data[1].endPage; key ++){
					var $replydiv = $("#bus");
	                
	                var $numBtn = $("<button>").text(key + 1).attr({
	                                                       class:"pclick",
	                                                       type: "button",
	                                                       value: key + 1
	                                                       });
	                $replydiv.append($numBtn);
				}
			}
			
		});
		var current = 1;
		
		$(document).on("click", ".pclick", function(){
			
			$.ajax({
				url: "/semiproject/selectPointList.py",
				type: "post",
				data: {
					mNo: "<%=loginUser.getmNo()%>",
					curval: this.value*1
				},
				success: function(data){
					
					console.log(data[0][0].saveStatus);
					console.log(data[0][0].pointDate);
					console.log(data);
					console.log(data[0]);
					console.log(data[1]);
					console.log(Math.abs(data[0][0].pAmount));
					var listArea = $("#listArea tbody");
					listArea.html('');
					
					for(var key = 1; key <= data[0].length; key ++){
					var tr = $("<tr>");
					var div = $("<div>").css({"width":"72px", "margin-left":"40px"});
					var ctd = $("<td>").attr({
								"class":"text2"
							});
					var label = $("<label>").text(key);
					
					div.append(label);
					ctd.append(div);
					
					var div2 = $("<div>").css({"width":"72px", "margin-left":"40px"});
					var ctd2 = $("<td>").attr({
								"class":"text2"
							});
					var label2 = $("<label>").text(Math.abs(data[0][key-1].pAmount));
					
					div2.append(label2);
					ctd2.append(div2);
					
					var div3 = $("<div>").css({"width":"80px", "margin-left":"40px"});
					var ctd3 = $("<td>").attr({
								"class":"text2"
							});
					var d = new Date(data[0][key - 1].pointDate);
					var label3 = $("<label>").text(getFormatDate(d));
					
					div3.append(label3);
					ctd3.append(div3);
					
					var div4 = $("<div>").css({"width":"72px", "margin-left":"40px"});
					var ctd4 = $("<td>").attr({
								"class":"text2"
							});
					var label4 = $("<label>").text(data[0][key-1].saveStatue);
					
					div4.append(label4);
					ctd4.append(div4);
					
					var div5 = $("<div>").css({"width":"190px", "margin-left":"40px"});
					var ctd5 = $("<td>").attr({
								"class":"text2"
							});
					var label5 = "3";
					if(data[0][key-1].saveStatue == '사용'){
						label5 = $("<label>").text("예약 서비스에 대한 "+data[0][key-1].saveStatue);
					} else {
						if(data[0][key-1].saveCode == 'ST1'){
							label5 = $("<label>").text("리뷰 서비스에 대한 적립"); //리뷰
						} else if(data[0][key-1].saveCode == 'ST2'){
							label5 = $("<label>").text("예약 서비스에 대한 적립"); //예약
						} else {
							label5 = $("<label>").text("게시글서비스에 대한 적립"); //게시글
						}
					}
					
					div5.append(label5);
					ctd5.append(div5);
					
					var br = $("<br>");
					tr.append(ctd);
					tr.append(ctd2);
					tr.append(ctd3);
					tr.append(ctd4);
					tr.append(ctd5);
					listArea.append(tr);
					}
					$("#bus button").remove();
					var $replydiv = $("#bus");
	                
				for(var key = data[1].startPage; key <= data[1].endPage; key ++){
					var $numBtn = $("<button>")
	                  $numBtn.text(key)
	                  $numBtn.attr({type: "button",
	                           value: key
	                           });
	                  $numBtn.addClass("pclick");
	                $replydiv.append($numBtn);
				}
				$("#left1").val(current - 1);
				if($("#left1").val() < 1) $("#left1").val(1);
				
				$("#right1").val(current + 1);
				if($("#right1").val() > data[1].maxPage) $("#right1").val(data[1].maxPage);
				}
				
			});
			
		})
	</script>
</body>