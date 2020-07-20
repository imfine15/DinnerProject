<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET 관리자페이지</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

table {
	border-collapse: collapse;
}

tr {
	border-bottom: 1px solid lightgray;
}

td {
	height: 30px;
	margin: 5px;
}

.fileBtn {
	color: #000000;
	border: 1px solid black;
	outline: 0;
	width: 100px;
	height: 25px;
	font-size: 14px;
	float: right;
}

.noticeBtn {
	background: #E07370;
	color: #FFFFFF;
	border: 0;
	width: 180px;
	height: 50px;
	font-size: 18px;
	margin-top: 30px;
}

textarea {
	resize: none;
	outline-style: none;
	margin-bottom: 10px;
	margin-top: 10px;
	border-radius: 0;
	border: 1px solid gray;
	outline-style: none;
	width:890px;
}

input {
	border-radius: 0;
	border: 1px solid gray;
	outline-style: none;
	margin-bottom: 10px;
	margin-top: 10px;
}

#uploadFiles {
	width: 770px;
	height: 200px;
	background: #f8f8f9;
	border: 1px solid #d2d2d2;
	text-align: left;
	margin-right: 0px;
	margin-top: 10px;
	margin-bottom: 10px;
	display: inline-block;
	float: left;
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 20px;
	letter-spacing :0.5px;
}

#fileDelete {
	margin-top: 10px;
	margin-left: 10px;
	width: 100px;
	font-size: 15px;
}

#fileWindow {
	border: 1px solid #d2d2d2;
	width: 770px;
	height: 30px;
	float: left;
	padding-left: 20px;
	cursor: pointer;
	margin-top: 10px;
	margin-bottom: 10px;
}

.file_input_textbox {
	float: left;
	width: 770px;
	padding-left: 20px;
	margin-right: 10px;
	height: 30px;
	margin-right: 0px;
	margin-top: 10px;
	margin-bottom: 10px;
}

.file_input_div {
	position: relative;
	width: 100px;
	height: 30px;
	overflow: hidden;
	margin: 0px;
	padding: 0px;
		cursor:pointer;
}

.file_input_button {
	width: 100px;
	background-color: white;
	color: black;
	border-style: solid;
	font-size: 15px;
	margin-top: 10px;
	margin-left: 10px;
	width: 100px;
	font-size: 15px;
	height: 30px;
	cursor:pointer;
}

.file_input_hidden {
	width:100%;
	font-size: 45px;
	position: absolute;
	right: 0px;
	top: 0px;
	opacity: 0;
	filter: alpha(opacity = 0);
	-ms-filter: "alpha(opacity=0)";
	-khtml-opacity: 0;
	-moz-opacity: 0;
}
#title {
	width:890px; 
	height:26px;
}
.first {
	font-size:16px;
	width:10%;	
	font-weight:normal;
	text-align:center;
}
#goEntNotice:link,#goEntNotice:visited, #goEntNotice:active, #goEntNotice:hover {
	text-decoration:none; color:black;
	text-decoration:none; color:black;
	text-decoration:none; color:black;
	text-decoration:none; color:black;
}
</style>
</head>
<body style="background: lightgray;">
	<%@ include file="/views/admin/common/sidebar.jsp"%>
	<div style="width:80%; height:600px;margin-left: 230px; padding-top:40px; padding-left:30px;">
		<div style="background: #F9F9F9;width: 100%; margin-bottom: 10px; height:50px; padding-left:10px; padding-right:10px;">
			<h1><a id="goEntNotice" href="<%=request.getContextPath()%>/" target = "_self">업체 공지사항</a></h1><br>
		</div>
		<div align="center" style="padding-left:10px; padding-right:10px; background: white; width:100%; padding-top: 30px; height: 800px;">
				<div style="height:20px;"></div>
			<form class="notice-form" action="<%= request.getContextPath() %>/insertEnter.no" method="post" encType="multipart/form-data">
			<table>
				<tr>
					<td class="first">제목</td>
					<td colspan="2">
					<input type="text" style="width:890px; height:26px;" name="eTitle" id="nTitle">
					</td>
				</tr>
				<tr>
					<td class="first">내용</td>
					<td colspan="2"><textarea rows="23" cols="100" name="eContent" id="nContent"></textarea></td>
				</tr>
			<tr>
					<td rowspan="2">첨부파일</td>
					<td>			<input id="fileName" class="file_input_textbox" placeholder="10MB 이하의 파일만 업로드 가능합니다." readonly/>
							<div class="file_input_div">
							<input type="button" value="파일찾기" class="file_input_button" style="cursor:pointer;"/>
								<input type="file" class="file_input_hidden" style="cursor:pointer;" name="upFile" id="upFile" onchange="dd(this,'name')"> 
							</div></td>
					<td valign="top">
		
					<br><br>
				</td>
				</tr>
				<tr>
					<td>
						<div id="uploadFiles">
								
							</div>
							<input type="button" value="파일삭제" id="fileDelete" onclick="deleteFile(this.form)" style="cursor:pointer;"> 
					</td>
				</tr>
			</table>
				<button class="noticeBtn" type="submit" id="noticeC-submit" onclick="noticeCSubmit">공지등록</button>
			</form>
		</div>
		
	</div>
	
		
		
		<script>
		function noticeCSubmit() {
			$("#noticeC-submit").submit();
		}
			
			document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
		
		/*<button type="button"id="dd" onclick="qq();">추가</button>*/
		$("#dd").change(function(){
			console.log(123);
		})
		function qq(){
			console.log("123123");
			var input = document.createElement('input');
			
			input.setAttribute("type", "file");
			console.log(input);
			$("#uploadFiles").append(input);
		}
		
		function questionSubmit() {
			$("#question-submit").submit();
		}
		
		function questionReset() {
			$("#question-reset").reset();
		}
		</script>
		<script>
	 function getCmaFileInfo(obj,stype) {
	    var fileObj, pathHeader , pathMiddle, pathEnd, allFilename, fileName, extName;
	    if(obj == "[object HTMLInputElement]") {
	        fileObj = obj.value
	    } else {
	        fileObj = document.getElementById(obj).value;
	    }
	    if (fileObj != "") {
	            pathHeader = fileObj.lastIndexOf("\\");
	            pathMiddle = fileObj.lastIndexOf(".");
	            pathEnd = fileObj.length;
	            fileName = fileObj.substring(pathHeader+1, pathMiddle);
	            extName = fileObj.substring(pathMiddle+1, pathEnd);
	            allFilename = fileName+"."+extName;
	 
	            if(stype == "all") {
	                    return allFilename; // 확장자 포함 파일명
	            } else if(stype == "name") {
	                    return fileName; // 순수 파일명만(확장자 제외)
	            } else if(stype == "ext") {
	                    return extName; // 확장자
	            } else {
	                    return fileName; // 순수 파일명만(확장자 제외)
	            }
	    } else {
	            alert("파일을 선택해주세요");
	            return false;
	    }
	    // getCmaFileView(this,'name');
	    // getCmaFileView('upFile','all');
	 }
	 
	function getCmaFileView(obj,stype) {
	    var s = getCmaFileInfo(obj,stype);
	    alert(s);
	}
	function dd(obj, stype){
		var div = document.createElement('div');
		var inputc = document.createElement('input');
		var text = document.createElement('text');
		text.innerHTML = getCmaFileInfo(obj, stype);
		inputc.setAttribute("type","checkbox");
		
		div.append(inputc);
		div.append(text);
		$("#uploadFiles").append(div);
	}

	$("input[type=radio]").each(function(){
	    var chk = $(this).is(":checked");
	    var name = $(this).attr('name');
	    if(chk == true) $("input[name='"+name+"']").data("previous",$(this).val());
	});

	$("input[type=radio]").click(function(){
	    var pre = $(this).data("previous");
	    var chk = $(this).is(":checked");
	    var name = $(this).attr('name');
	    if(chk == true && pre == $(this).val()){

	        $(this).prop('checked',false);

	        $("input[name='"+name+"']").data("previous",'');
	    }else{
	        if(chk == true) $("input[name='"+name+"']").data("previous",$(this).val());
	    }

	});

	$(document).ready(function() {
	    $('#fileDelete input[type=file]').bind('change focus click', SITE.fileInputs);
	    
	    /* here is my problem *************************
	    how can i remove file completely when i click on "Remove" so that the same file name 
	    doesn't come up again when i click on the "choose file" button to upload another file?
	    */ 
	    $('.file_input_button').live('click', function() {
	        $(this).closest('div').remove();
	        return false;
	    });
	});
	</script>
</body>
</html>