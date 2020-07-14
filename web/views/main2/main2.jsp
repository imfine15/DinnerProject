<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<!-- Description, Keywords and Author -->
<meta name="description" content="Your description">
<meta name="keywords" content="Your,Keywords">
<meta name="author" content="ResponsiveWebInc">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Styles -->
<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Font awesome CSS -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/style.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- Favicon -->
<link rel="shortcut icon" href="#">

<style type="text/css">
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1440px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
/* .prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
} */

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1231123123123123231.5s;
  animation-name: fade;
  animation-duration: 123123123121.5s;
}

@-webkit-keyframes fade {
  from {opacity: 1} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: 1} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
</style>
</head>

<body style="width: 1440px;">

   <%@include file="../common/header.jsp"%>
   <div class="wrapper">
      <!-- banner -->
      <div class="banner"
         style="padding-top: -1px; margin-top: -300px; height: 500px; position: relative;">
         <div>
            <img src="/semiproject/images/mainBanner6.png"
               style="width: 100%; height: 600px;">
         </div>
         <div class="container"
            style="background: white; height: 60px; width: 600px; padding: 1px; margin-bottom: -100px; position: absolute; top: 120%; left: 38%; border-radius: 10px; font-size: 22px; margin-left: -50px;">
            <button
               style="height: 100%; background: white; float: left; margin-left: 5px; border: 0px white;">
               <img src="../../images/Vector.png">
            </button>
            <input type="search"
               style="height: 100%; width: 70%; float: left; border: 1px solid white; background: white; padding-left: 10px;">
            <button
               style="height: 95%; background: white; border: 0px white; float: right; margin-right: 5px;">
               <img src="../../images/searchicon.png">
            </button>
         </div>
      </div>
      <!-- banner end -->

      <!-- works -->
      <div class="works" id="work" style="margin-top: 300px;">
         <div class="container"
            style="border: 0px white; width: 100%; box-shadow: 0px;">
            <h2 style="color: #D5706D; margin-left: 50px">오늘의 메뉴</h2>
            <div class="row" style="margin-top: 0px;">
               <div class="col-md-3">
                  <!-- work item -->
                  <div class="work-item">
                     <!-- work details image -->
                     <img class="img-responsive" src="img/curry.png" alt=""
                        style="width: 100%; height: 171px;" />
                     <!-- heading -->
                     <h3>
                        <a href="#" style="color: black; font-weight: 600;">카레이서</a>
                     </h3>
                     <!-- brand org -->
                     <span class="org">서울 역삼점</span>
                  </div>
               </div>

               <div class="col-md-3" style="margin-top: 0px;">
                  <!-- work item -->
                  <div class="work-item">
                     <!-- work details image -->
                     <img class="img-responsive" src="img/boode.png" alt=""
                        style="width: 100%; height: 171px;" />
                     <!-- heading -->
                     <h3>
                        <a href="#" style="color: black; font-weight: 600;">송탄부대찌개</a>
                     </h3>
                     <!-- brand org -->
                     <span class="org">경기 평택시</span>
                  </div>
               </div>
               <div class="col-md-3" style="margin-top: 0px;">
                  <!-- work item -->
                  <div class="work-item">
                     <!-- work details image -->
                     <img class="img-responsive" src="img/noodle.png" alt=""
                        style="width: 100%; height: 171px;" />
                     <!-- heading -->
                     <h3>
                        <a href="#" style="color: black; font-weight: 600;">권숙수</a>
                     </h3>
                     <!-- brand org -->
                     <span class="org">대전 둔산동</span>
                  </div>
               </div>
               <div class="col-md-3" style="margin-top: 0px;">
                  <!-- work item -->
                  <div class="work-item">
                     <!-- work details image -->
                     <img class="img-responsive" src="img/pasta.png" alt=""
                        style="width: 100%; height: 171px;" />
                     <!-- heading -->
                     <h3>
                        <a href="#" style="color: black; font-weight: 600;">파스타 학교</a>
                     </h3>
                     <!-- brand org -->
                     <span class="org">대전 유성구</span>
                  </div>
               </div>
               <br>
               <div class="col-md-3" style="margin-top: 0px;">
                  <!-- work item -->
                  <div class="work-item">
                     <!-- work details image -->
                     <img class="img-responsive" src="img/lamb.png" alt=""
                        style="width: 100%; height: 171px;" />
                     <!-- heading -->
                     <h3>
                        <a href="#" style="color: black; font-weight: 600;">이치류</a>
                     </h3>
                     <!-- brand org -->
                     <span class="org">서울 양재동</span>
                  </div>
               </div>
               <div class="col-md-3" style="margin-top: 0px;">
                  <!-- work item -->
                  <div class="work-item">
                     <!-- work details image -->
                     <img class="img-responsive" src="img/jungol.png"
                        style="width: 100%; height: 171px;" />
                     <!-- heading -->
                     <h3>
                        <a href="#" style="color: black; font-weight: 600;">하루전골</a>
                     </h3>
                     <!-- brand org -->
                     <span class="org">경기 포천시</span>
                  </div>
               </div>
               <div class="col-md-3" style="margin-top: 0px;">
                  <!-- work item -->
                  <div class="work-item">
                     <!-- work details image -->
                     <img class="img-responsive" src="img/noodle2.png"
                        style="width: 100%; height: 171px;" />
                     <!-- heading -->
                     <h3>
                        <a href="#" style="color: black; font-weight: 600;">스쿠로</a>
                     </h3>
                     <!-- brand org -->
                     <span class="org">경기 광주시</span>
                  </div>
               </div>
               <div class="col-md-3" style="margin-top: 0px;">
                  <!-- work item -->
                  <div class="work-item">
                     <!-- work details image -->
                     <img class="img-responsive" src="img/pattai.png"
                        style="width: 100%; height: 171px;" />
                     <!-- heading -->
                     <h3>
                        <a href="#" style="color: black; font-weight: 600;">쏭타이</a>
                     </h3>
                     <!-- brand org -->
                     <span class="org">대전 미달성구</span>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <hr
         style="border: 1px solid black; color: gray; width: 50%; align: center;">
      <br>
      <br>
      <br>
      <h2 style="color: #D5706D; margin-left: 50px;">오늘의 메뉴</h2>
      <div class="container"
         style="border: 0px white; width: 1400px; height: 450px">
         

            <div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="img/cos1.png" style="width:45%; margin-right:9.2%;">
  <img src="img/cos1.png" style="width:45%">
  <div class="text">1/3</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="img/cos1.png" style="width:45%;margin-right:9.2%;">
  <img src="img/cos1.png" style="width:45%">
  <div class="text">2/3</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="img/cos1.png" style="width:45%;margin-right:9.2%;">
  <img src="img/cos1.png" style="width:45%">
  <div class="text">3/3</div>
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>

           <!--  <!-- Left and right controls -->
            <!-- <a class="left carousel-control" href="#myCarousel"
               data-slide="prev"> <span
               class="glyphicon glyphicon-chevron-left"></span> <span
               class="sr-only">Previous</span>
            </a> <a class="right carousel-control" href="#myCarousel"
               data-slide="next"> <span
               class="glyphicon glyphicon-chevron-right"></span> <span
               class="sr-only">Next</span> --> -->
            <!-- </a> -->
         </div>
      </div>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>
      
      
      <hr
         style="border: 1px solid black; color: gray; width: 50%; align: center;">
      <br>
      <br>
      <br>
      
      <div class="works" id="work" style="margin-top: -180px;">
         <div class="container"
            style="border: 0px white; width: 100%; box-shadow: 0px;">
            <h2 style="color: #D5706D; margin-left: 50px">YUMEET'S PICK</h2>
            <div class="row" style="margin-top: 0px;">
               <div class="col-md-3">
                  <!-- work item -->
                  <div class="work-item">
                     <!-- work details image -->
                     <img class="img-responsive" src="img/curry.png" alt=""
                        style="width: 100%; height: 171px;" />
                     <!-- heading -->
                     <h3>
                        <a href="#" style="color: black; font-weight: 600;">카레이서</a>
                     </h3>
                     <!-- brand org -->
                     <span class="org">서울 역삼점</span>
                  </div>
               </div>

               <div class="col-md-3" style="margin-top: 0px;">
                  <!-- work item -->
                  <div class="work-item">
                     <!-- work details image -->
                     <img class="img-responsive" src="img/boode.png" alt=""
                        style="width: 100%; height: 171px;" />
                     <!-- heading -->
                     <h3>
                        <a href="#" style="color: black; font-weight: 600;">송탄부대찌개</a>
                     </h3>
                     <!-- brand org -->
                     <span class="org">경기 평택시</span>
                  </div>
               </div>
               <div class="col-md-3" style="margin-top: 0px;">
                  <!-- work item -->
                  <div class="work-item">
                     <!-- work details image -->
                     <img class="img-responsive" src="img/noodle.png" alt=""
                        style="width: 100%; height: 171px;" />
                     <!-- heading -->
                     <h3>
                        <a href="#" style="color: black; font-weight: 600;">권숙수</a>
                     </h3>
                     <!-- brand org -->
                     <span class="org">대전 둔산동</span>
                  </div>
               </div>
               <div class="col-md-3" style="margin-top: 0px;">
                  <!-- work item -->
                  <div class="work-item">
                     <!-- work details image -->
                     <img class="img-responsive" src="img/pasta.png" alt=""
                        style="width: 100%; height: 171px;" />
                     <!-- heading -->
                     <h3>
                        <a href="#" style="color: black; font-weight: 600;">파스타 학교</a>
                     </h3>
                     <!-- brand org -->
                     <span class="org">대전 유성구</span>
                  </div>
               </div>
               <br>
               <div class="col-md-3" style="margin-top: 0px;">
                  <!-- work item -->
                  <div class="work-item">
                     <!-- work details image -->
                     <img class="img-responsive" src="img/lamb.png" alt=""
                        style="width: 100%; height: 171px;" />
                     <!-- heading -->
                     <h3>
                        <a href="#" style="color: black; font-weight: 600;">이치류</a>
                     </h3>
                     <!-- brand org -->
                     <span class="org">서울 양재동</span>
                  </div>
               </div>
               <div class="col-md-3" style="margin-top: 0px;">
                  <!-- work item -->
                  <div class="work-item">
                     <!-- work details image -->
                     <img class="img-responsive" src="img/jungol.png"
                        style="width: 100%; height: 171px;" />
                     <!-- heading -->
                     <h3>
                        <a href="#" style="color: black; font-weight: 600;">하루전골</a>
                     </h3>
                     <!-- brand org -->
                     <span class="org">경기 포천시</span>
                  </div>
               </div>
               <div class="col-md-3" style="margin-top: 0px;">
                  <!-- work item -->
                  <div class="work-item">
                     <!-- work details image -->
                     <img class="img-responsive" src="img/noodle2.png"
                        style="width: 100%; height: 171px;" />
                     <!-- heading -->
                     <h3>
                        <a href="#" style="color: black; font-weight: 600;">스쿠로</a>
                     </h3>
                     <!-- brand org -->
                     <span class="org">경기 광주시</span>
                  </div>
               </div>
               <div class="col-md-3" style="margin-top: 0px;">
                  <!-- work item -->
                  <div class="work-item">
                     <!-- work details image -->
                     <img class="img-responsive" src="img/pattai.png"
                        style="width: 100%; height: 171px;" />
                     <!-- heading -->
                     <h3>
                        <a href="#" style="color: black; font-weight: 600;">쏭타이</a>
                     </h3>
                     <!-- brand org -->
                     <span class="org">대전 달성구</span>
                  </div>
               </div>
            </div>
         </div>
      </div>
   <br><br><br>
   


<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace("active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>
   
   <%@include file="../common/footer.jsp" %>


      <!-- Javascript files -->
      <!-- jQuery -->
      <script src="js/jquery.js"></script>
      <!-- Bootstrap JS -->
      <script src="js/bootstrap.min.js"></script>
      <!-- Respond JS for IE8 -->
      <script src="js/respond.min.js"></script>
      <!-- HTML5 Support for IE -->
      <script src="js/html5shiv.js"></script>
      <!-- Custom JS -->
      <script src="js/custom.js"></script>
</body>
</html>