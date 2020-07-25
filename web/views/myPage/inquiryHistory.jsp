<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.semi.admin.model.vo.*,com.kh.semi.question.model.vo.QuestionVO"%>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	ArrayList<QuestionVO> qlist = (ArrayList<QuestionVO>)request.getAttribute("qlist");
%>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

   </script>
<style>
span{
	word-break: normal;
	margin-bottom: 10px;
}
*{margin:0; padding:0;}
a.button{display:inline-block; padding: 10px 20px; text-decoration:none; color:#fff; background:#000; margin:20px;}
#modal{
  display:none;
  position:fixed; 
  width:100%; height:100%;
  top:0; left:0; 
  background:rgba(0,0,0,0.3);
}
.modal-con{
  display:none;
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 30%;
  min-height: 30%;
  background:#fff;
}
.modal-con .title{
  font-size:20px; 
  padding: 20px; 
  background : #D5706D;
  color: white;
}
.modal-con .con{
  font-size:13px; line-height:1.3;
  padding: 30px;
}
.modal-con .close{
  display:block;
  position:absolute;
  width:30px; height:30px;
  border-radius:50%; 
  border: 3px solid #000;
  text-align:center; line-height: 30px;
  text-decoration:none;
  color:#000; font-size:20px; font-weight: bold;
  right:10px; top:10px;
}
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
	white-space: nowrap;
	overflow: hidden; 
	text-overflow: ellipsis;
	display: inline-block;
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
	<script>
		$.ajax({
			type : "post",
			url : "/semiproject/selectPoint.me",
			data : {
				mNo: "<%=loginUser.getmNo()%>"
			},
			success: function(data){
				$("#currentPoint").html("보유포인트 : " + data + "p");
			},
			error: function(){
			}
		});
	</script>
	<div id="daumWrap" class="userinfo_type1 ">

		<div id="daumHead" role="banner">
			<div class="inner_head" style="padding-right:30px;">
				<h1>
					<a href="/semiproject/views/myPage/myPage.jsp" id="daumServiceLogo"><span class="ir_wa">내정보</span></a>
				</h1>
				<!-- PC 웹 내정보 GNB -->
				<div id="" role="navigation">
					<ul style="padding-top: 10px; padding-left:-30px;">
						<li class="left"><a class="left2" href="/semiproject/views/myPage/myPage.jsp"><span class="navbar">내정보 홈</span></a></li>
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
					<h1 style="color: #DA817F;">문의하기</h1>
					<br>
					<div style="width: 100%; background-color: pink; height: 30px; vertical-align: middle; padding-top:10px;">
						<label style="margin-left: 30px;"class="text">번호</label>
						<label style="margin-left: 80px;"class="text">제목</label>
						<label style="margin-left: 80px;"class="text">문의신청일자</label>
						<label style="margin-left: 80px;"class="text">상태</label>
						<label style="margin-left: 80px;"class="text">문의 완료 일자</label>
					</div>
					<table style="border-bottom: 1px solid pink; border-spacing: 0 10px;" id="listArea">
					<%int count = qlist.size();
					for(int i = 0; i < qlist.size(); i++) {%>
						<tr>
							<td><div class="text2" style="width:30px; margin-left:30px;"><%=count %></div></td>
							<td><a href="javascript:openModal('modal<%=i+1 %>');" class="modal-open"><div class="text2" style="width:160px; margin-left:20px;"><%=qlist.get(i).getQuestionContent() %></div></a></td>
							<td><div class="text2" style="width:130px; margin-left:10px;"><%=qlist.get(i).getQuestionDate() %></div></td>
							<% 
								String status = "";
								String ds = qlist.get(i).getQuestionDisposalStatus();
								if(ds.equals("QDSE1")){
									status = "미확인";
								} else if (ds.equals("QDSC2")){
									status = "처리대기";
								} else {
									status = "처리완료";
								}
								
							%>
							<td><div class="text2" style="width:80px; margin-left:45px;"><%=status %></div></td>
							<%if(ds.equals("QDSC3")){ %>
							<td><div class="text2" style="width:132px; margin-left:40px;"><%=qlist.get(i).getDisposalDate() %></div></td>
						
					<%} else {%>
						<td><div class="text2" style="width:132px; margin-left:40px;"></div></td>
						</tr>
						<%}count--;} %>
					
					</table>
					<form action="selectInquiryList.py" method="post">
					<div align="center">
					<%for(int i = 0; i < pi.getEndPage();i ++){ %>
					
					<input type="submit" value="<%=i+1%>" name="curval">
					<%} %>
					
					</div>
					</form>
				</div>
	<div id="wrap">
</div>

<div id="modal"></div>
<%for(int i = 0; i <qlist.size(); i++){ %>
  <div class="modal-con modal<%=i+1 %>">
    <a href="javascript:;" class="close">X</a>
    <p class="title">문의내용</p>
    <div class="con">
      <table style="border-spacing: 0 10px;">
      <tr>
      	<td style="width:150px;">아이디 : <%=qlist.get(i).getMemberId() %></td>
      	<td>이름 : <%=qlist.get(i).getMemberName() %></td>
      </tr>	
      <tr>
      	<td style="width:150px;">요청일 : <%=qlist.get(i).getQuestionDate() %></td> <%if(qlist.get(i).getQuestionDisposalStatus().equals("QDSC3")) {%><td>답변일 : <%=qlist.get(i).getDisposalDate() %></td>
      	<%} %>
      </tr>
      <tr>
      	<td colspan="2">제목 : <%=qlist.get(i).getQuestionTitle() %></td>
      </tr>
      <tr>
      	<td>내용</td>
      	<td colspan="2"><%=qlist.get(i).getQuestionContent() %></td>
      </tr>
      <tr>
      </tr>
      </table>
    </div>
  </div>
  
  <%} %>
<script>

function openModal(modalname){
	  document.get
	  $("#modal").fadeIn(300);
	  $("."+modalname).fadeIn(300);
	}

	$("#modal, .close").on('click',function(){
	  $("#modal").fadeOut(300);
	  $(".modal-con").fadeOut(300);
	});
</script>

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
								data-tiara-action-name="내_정보"><%=loginUser.getmName()%>님<br>
							</a><a class="link_user" href="/semiproject/views/myPage/myPoint.jsp">
							<label id="currentPoint" >포인트 : </label>	
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



</body>