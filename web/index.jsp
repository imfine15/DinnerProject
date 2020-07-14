<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>인덱스입니다</title>
<style>
/* REMOVE THIS, USE YOUR OWN  */
/*html,body {
  margin: 0;
  padding: 0;
  font-family: Arial, Helvetica, Sans-serif;
  background-color: #070617;
}
.dummy_page {
  height: 200px;
  width: 100%;
  background-color: #f0f0f0;
  text-align: center;
  box-sizing: border-box;
  padding: 60px 0px;
}*/
/* STYLES SPECIFIC TO FOOTER  */
/*
.footer {
  width: 100%;
  position: relative;
  height: auto;
  background-color: #070617;
}
.footer .col {
  width: 190px;
  height: auto;
  float: left;
  box-sizing: border-box;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  padding: 0px 20px 20px 20px;
}
.footer .col h1 {
  margin: 0;
  padding: 0;
  font-family: inherit;
  font-size: 12px;
  line-height: 17px;
  padding: 20px 0px 5px 0px;
  color: rgba(255,255,255,0.2);
  font-weight: normal;
  text-transform: uppercase;
  letter-spacing: 0.250em;
}
.footer .col ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}
.footer .col ul li {
  color: #999999;
  font-size: 14px;
  font-family: inherit;
  font-weight: bold;
  padding: 5px 0px 5px 0px;
  cursor: pointer;
  transition: .2s;
  -webkit-transition: .2s;
  -moz-transition: .2s;
}
.social ul li {
  display: inline-block;
  padding-right: 5px !important;
}

.footer .col ul li:hover {
  color: #ffffff;
  transition: .1s;
  -webkit-transition: .1s;
  -moz-transition: .1s;
}
.clearfix {
  clear: both;
}
@media only screen and (min-width: 1280px) {
  .contain {
    width: 1200px;
    margin: 0 auto;
  }
}
@media only screen and (max-width: 1139px) {
  .contain .social {
    width: 1000px;
    display: block;
  }
  .social h1 {
    margin: 0px;
  }
}
@media only screen and (max-width: 950px) {
  .footer .col {
    width: 33%;
  }
  .footer .col h1 {
    font-size: 14px;
  }
  .footer .col ul li {
    font-size: 13px;
  }
}
@media only screen and (max-width: 500px) {
    .footer .col {
      width: 50%;
    }
    .footer .col h1 {
      font-size: 14px;
    }
    .footer .col ul li {
      font-size: 13px;
    }
}
@media only screen and (max-width: 340px) {
  .footer .col {
    width: 100%;
  }
}*/
	#outer {
		text-align:center;
	}
	
	ul {
		list-style:none;
		line-height:170%;
	}
	
	#div {
		width:1200px;
		text-align:center;
		margin:0 auto;
	}
	
	#div1, #div2, #div3 {
		width:33%;
		height:100%;
		display:inline-block;
	}
	
	#div1 {
		float:left;
	}
	
	#div3 {
		float:right;
	}
</style>
</head>
<body>
<%@include file="views/main2/main2.jsp" %>
<!-- 
<div id="outer">
	<h1>이동할 jsp페이지 이름을 입력해주세요</h1>
	<br>
	<h3>views 하위 폴더명과 jsp파일명이 같아야만 이동이 가능합니다</h3>
	<br>
	<label>이동하실 jsp 파일명 : </label><input type="text" id="url">
	<br>
	<button onclick="goUser();">사용자메뉴<br>이동하기</button>
	<button onclick="goStore();">업체메뉴<br>이동하기</button>
	<button onclick="goAdmin();">관리자메뉴<br>이동하기</button>
	<br>
	<h3>현재(2020.07.07) 가능한 목록</h3>
	<br>
	<div id="div">
		<div id="div1">
			<h3>목록을 눌러주세요 - 사용자메뉴</h3>
			<ul>
				<li>ad</li>
				<li>main2</li>
				<li>mapSearch</li>
				<li>myPage</li>
				<li>notice</li>
				<li>partner</li>
				<li>restaurantInfo</li>
				<li>searchResult</li>
				<li>signIn</li>
				<li>signUp</li>
			</ul>
		</div>
		<div id="div2">
			<h3>목록을 눌러주세요 - 업체메뉴</h3>
			<ul>
				<li>commentManage</li>
				<li>paymentHistory</li>
				<li>report</li>
				<li>reservationCheck</li>
				<li>reservationDate</li>
				<li>sanctionsDetails</li>
				<li>settlementDetails</li>
				<li>sidebar</li>
				<li>signIn</li>
				<li>signUp</li>
			</ul>
		</div>
		<div id="div3">
			<h3>목록을 눌러주세요 - 관리자메뉴</h3>
			<ul>
				<li>관리자메뉴1</li>
			</ul>
		</div>
	</div>
	<script>
		$(function() {
			$("ul li").click(function() {
				$("#url").val($(this).html());
			})
		});
	
		function goUser() {
			location.href = "/semiproject/views/" + $("#url").val() + "/" + $("#url").val() + ".jsp";
		}
		
		function goStore() {
			location.href = "/semiproject/views/enterprise/" + $("#url").val() + "/" + $("#url").val() + ".jsp";
		}
		
		function goAdmin() {
			location.href = "/semiproject/views/admin/" + $("#url").val() + "/" + $("#url").val() + ".jsp";
		}
	</script>
</div>-->
<!--
	<h1> Hello World!!</h1>
	<header></header>
	<div class="dummy_page">
</div>   -->
<!-- FOOTER START -->
<!--<div class="footer">
  <div class="contain">
  <div class="col">
    <h1>Company</h1>
    <ul>
      <li>About</li>
      <li>Mission</li>
      <li>Services</li>
      <li>Social</li>
      <li>Get in touch</li>
    </ul>
  </div>
  <div class="col">
    <h1>Products</h1>
    <ul>
      <li>About</li>
      <li>Mission</li>
      <li>Services</li>
      <li>Social</li>
      <li>Get in touch</li>
    </ul>
  </div>
  <div class="col">
    <h1>Accounts</h1>
    <ul>
      <li>About</li>
      <li>Mission</li>
      <li>Services</li>
      <li>Social</li>
      <li>Get in touch</li>
    </ul>
  </div>
  <div class="col">
    <h1>Resources</h1>
    <ul>
      <li>Webmail</li>
      <li>Redeem code</li>
      <li>WHOIS lookup</li>
      <li>Site map</li>
      <li>Web templates</li>
      <li>Email templates</li>
    </ul>
  </div>
  <div class="col">
    <h1>Support</h1>
    <ul>
      <li>Contact us</li>
      <li>Web chat</li>
      <li>Open ticket</li>
    </ul>
  </div>
  <div class="col social">
    <h1>Social</h1>
    <ul>
      <li><img src="https://svgshare.com/i/5fq.svg" width="32" style="width: 32px;"></li>
      <li><img src="https://svgshare.com/i/5eA.svg" width="32" style="width: 32px;"></li>
      <li><img src="https://svgshare.com/i/5f_.svg" width="32" style="width: 32px;"></li>
    </ul>
  </div>
<div class="clearfix"></div>
</div>
</div>  -->
<!-- END OF FOOTER -->
</body>
</html>