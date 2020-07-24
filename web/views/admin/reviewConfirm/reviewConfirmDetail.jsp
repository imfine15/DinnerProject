<%@page import="com.kh.semi.board.model.vo.History"%>
<%@page import="com.kh.semi.board.model.vo.BoardUpVo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   ArrayList<HashMap<String, Object>> list2 = (ArrayList<HashMap<String, Object>>)session.getAttribute("list2");
   BoardUpVo board = (BoardUpVo)session.getAttribute("board");
   History history = (History)request.getAttribute("history");
   ArrayList<BoardUpVo> replyList;
   if(request.getAttribute("replyList")==null){
      replyList=null;
   } else {
      replyList = (ArrayList<BoardUpVo>)request.getAttribute("replyList");
   }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET 관리자페이지</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
   rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.hide {
   background-color: white;
   border: 0px;
   height: 30px;
}

#wrapper {
   width: 85%;
   height: 100%;
   margin-left: 230px;
   padding-top: 40px;
   padding-left: 30px;
}

#title-box {
   background: #F9F9F9;
   width: 100%;
   height: 50px;
   margin-bottom: 10px;
   padding-left: 10px;
   font-family: Noto Sans KR;
   font-size: 30px;
   font-weight: bolder;
}

#inner-box {
   width: 100%;
   height: auto;
}

#inner-wrap {
   padding-left: 50px;
   padding-right: 50px;
   background: white;
   width: 95%;
}

#send-btn {
   color: white;
   background-color: #E07370;
   border: none;
   width: 40px;
   height: 25px;
}

#sendcom-btn {
   color: white;
   background-color: #A0A0A0;
   border: none;
   width: 70px;
   height: 25px;
}

td {
   text-align: center;
}

#check-box {
   width: 50px;
}

#review-tb {
   border-collapse: collapse;
}

tr {
   border-bottom: 0.5px solid #9F9F9F;
   height: 40px;
}

#upload-btn {
   width: 60px;
   height: 24px;
   border: none;
   background: #E07370;
   border-radius: 2px;
   color: white;
   font-size: 15px;
}

#update-btn {
   width: 45px;
   height: 24px;
   border: none;
   background: #E07370;
   border-radius: 2px;
   color: white;
   font-size: 15px;
}

#delete-btn {
   width: 45px;
   height: 24px;
   border: none;
   background: #E07370;
   border-radius: 2px;
   color: white;
   font-size: 15px;
}

#search-btn {
   width: 53px;
   height: 24px;
   background: #C4C4C4;
   color:black;
   border:none;
}
.deleteBtn{
      background: red;
      color: #FFFFFF;
      border: 0;
      outline: 0;
      width: 50px;
      height: 20px;
      font-size: 14px;
}
.updateBtn{
      background: #EB7673;
      color: #FFFFFF;
      border: 0;
      outline: 0;
      width: 100px;
      height: 27px;
      font-size: 18px;
      margin-bottom: 50px;
      margin-left: 10px;
}
    input[type=text]{
      border-radius: 0;
      border: 1px solid gray;
      outline-style: none;
      
   }
   textarea{
      border-radius: 0;
      border: 1px solid gray;
      outline-style: none;
   }
   select{
      border-radius: 0;
      border: 1px solid gray;
      outline-style: none;
      height: 20px;
   }
   .delBtn{
      background: red;
      color: #FFFFFF;
      border: 0;
      outline: 0;
      width: 50px;
      height: 20px;
      font-size: 14px;
   }
   .uploadBtn{
   background: #EB7673;
      color: #FFFFFF;
      border: 0;
      outline: 0;
      width: 120px;
      height: 27px;
      font-size: 18px;
      margin-bottom: 50px;
      margin-right: 10px;
   }
</style>
</head>
<body style="background: lightgray;">
   <%@ include file="/views/admin/common/sidebar.jsp"%>
   <div id="wrapper">
      <div id="title-box">
         <p>리뷰 게시글 관리</p>
         <br>
      </div>
      <form action="<%=request.getContextPath()%>/updateBoard.bo" method="post" enctype="multipart/form-data">
      <input type="hidden" name="boardNo" value="<%=board.getBoardNo()%>">
      <div id="inner-wrap">
         <div id="inner-box">
               <div
      style="margin-left: auto; margin-right: auto; height: auto;"
      align="center">
      <div style="display: inline;">
         <img src="/semiproject/views/reviews/images/recommend.png" style="width: 200px;">
      </div>
      <input type="text" value="<%= board.getBoardTitle() %>"    name="boardTitle"   
         style="width: 400px; display: inline; font-size: 30px; margin-bottom: auto; margin-top: auto; font-family: Roboto;"></input>
      <div
         style="display: inline; font-size: 13px; margin-bottom: auto; margin-top: auto; font-family: Roboto;">
         <div style="display: inline-block;"><label>작성자 : </label><label><%= board.getMemberId() %></label></div> 
         <div style="margin-right: -50px; display: inline-block;"><label>작성일 : </label><label><%=board.getUploadDate() %></label></div> <a href=""><img
            src="/semiproject/views/reviews/images/good.png"
            style="margin-bottom: 20px; margin-right: 10px;"></a> <br> <br>
         <hr style="width: 80%;">
         <br> <br>
      </div>
   </div>
   <div
      style="margin-left: auto; margin-right: auto; padding-left: 30px;"
      align="center">
      <% for(int i = 0; i < list2.size(); i++){
         HashMap<String, Object> hmap = list2.get(i);
      
         %>
      <input type="hidden" name="count" value="<%=list2.size()%>">
      <input type="hidden" name="originName" value="<%=hmap.get("originName")%>">
      <input type="hidden" name="changeName" value="<%=hmap.get("changeName")%>">
      <input type="hidden" name="filePath" value="<%=hmap.get("filePath")%>">
      <div style="width: 80%;">
         <div style="float: left; display: inline; padding-left: 30px;">
            <img name="boardImg<%=i%>" src="<%=request.getContextPath()%>/thumbnail_uploadFile/<%=hmap.get("changeName")%>" width="170px" height="auto">
         </div>
         <div style="padding-left: 20px; padding-top: 20px; width: 700px;">
            
            
            <textarea name="content" id="content<%=i%>" cols="50" rows="8" style="resize: none;"></textarea>
               <br> <br> <br> <br> <br> <br> <br>
         </div>
         <a href=""><img src="/semiproject/views/reviews/images/boru.png"
            style="float: right; margin-top: -40px; margin-right: 120px;"></a>
      </div>
         <hr style="width: 80%;">
         <br> <br>
   <%} %>


   </div>

   <div
      style="margin-left: auto; margin-right: auto; padding-left: 30px;"
      align="center">
      <div style="width: 80%;">
         <div align="center"
            style="margin-left: auto; margin-right: auto; padding-left: 10px;">
            <label style="font-size: 30px; float: left; margin-left: 80px;">해쉬태그</label><br><br> 
            <input name="hashtags" type="text" value="<%=board.getHashTags() %>" style="width: 600px;">
            
            
         </div>
         <br><br>
         <br> <br>
      </div>
         <hr style="width: 80%;">
   </div>
   
   <div 
      style="margin-left: auto; margin-right: auto; padding-left: 30px;"
      align="center">
      <div style="width: 80%;">
         <div
            style="margin-left: auto; margin-right: auto; padding-left: 10px; float: left;">
            <label style="font-size: 30px; float:left; padding-left:96px;">댓글</label><br><br><br>
            <table id="replySelectTable"
               style="padding-left: 130px; font-size: 14px;">
               <tbody>
                  <%
                  if(replyList != null){
                     for (int i = 0; i < replyList.size(); i++) {
                  %>
                  <tr>
                     <td style="width: 90px;"><%=replyList.get(i).getMemberId()%></td>
                     <td style="width: 500px;"><%=replyList.get(i).getReplyContent()%></td>
                     <td style="width: 190px;"><%=replyList.get(i).getReplyDate()%></td>
                     <td style="width: 70px;"><button type="button" class="delBtn" onclick="location.href='<%=request.getContextPath()%>/deleteReply.bo?replyNo=<%=replyList.get(i).getReplyNo()%>&boardNo=<%=replyList.get(i).getBoardNo()%>'">삭제</button></td>
                  </tr>
                  <%
                     }
                  }
                  %>
               </tbody>
            </table>
            
         </div>
      </div>
         <hr style="width: 80%;">
         <br> <br>
   </div>
      <div align="center">
      <% if(history.getStatusCode().equals("USC3")) {%>
         <button type="button" class="uploadBtn" style="background: gray;" disabled="disabled">업로드하기</button>
      <%} else { %>
         <button type="button" class="uploadBtn" onclick="location.href='<%=request.getContextPath()%>/uploadBoard.bo?no=<%=board.getBoardNo()%>'">업로드하기</button>
      <%} %>
         <button type="submit" class="updateBtn">수정하기</button>
      </div>
         </div>
      </div>
      </form>
   </div>
<script>
   $(document).ready(function() {
      
      var content = "<%=board.getBoardContent()%>";
      console.log(content);
      var contentArr = content.split('$$$');
      for(var i = 0; i < contentArr.length; i++){
          $('[id="content' + i + '"]').val(contentArr[i]);
      }
   });
   
   $(document).ready(function() {
      console.log("<%=history.getStatusCode()%>");
   });
   
</script>
</body>
</html>