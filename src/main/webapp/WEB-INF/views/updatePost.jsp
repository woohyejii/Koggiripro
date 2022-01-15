<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정하기</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<script>
<%
//로그인된 아이디가 있는지 확인
String name=(String)session.getAttribute("namekey");
%>
</script>
<script type="text/javascript">

window.onload=function(){
	let btnUp = document.querySelector("#btnUp");
	btnUp.addEventListener("click",checkData);
}

function checkData(){
	//alert("Success");
	//입력 자료 오류 검사
	if(frm.title.value===""){
		alert("제목을 입력하세요.");
		frm.title.focus();
		return;
	}
	if(document.querySelector("#title").value.length>40){
      	   alert("제목을 40글자 이내로 입력해주세요");
      	      frm.title.focus();
      	      return;
         }
	
	
	if(frm.content.value===""){
		alert("내용을 입력하세요.");
		frm.content.focus();
		return;
	} 

	frm.submit()
}


</script>
</head>
<body>
<p style="border-left: 10px solid #688FF4; padding: 0.5em; border-bottom: 2px solid #688FF4; ">우리 스터디 게시판</p>

<form action="updatePost" method="post" name="frm">
	<table class="table table-hover">
		<tr>
			<td>작성자 :<%=name %></td>
			<td>작성일 : ${data.postTime}</td>
			<td>조회수 : ${data.views }</td>
		</tr>
		<tr>
			<td colspan="3">제목 : <input type="text" name ="title" id="title" value="${data.title }"/></td>
		</tr>
		<tr>
			<td colspan="3">내용 : <textarea rows="10" name="content" id="content" style="width:99%"> ${data.content }</textarea></td>
		</tr>
		
		<input type=hidden name="postNo" id="postNo" value="${data.postNo }"/>
		<input type=hidden name="userNo" id="userNo" value="${userNo }"/>
		<input type=hidden name="studyNo" id="studyNo" value="${studyNo }"/>
		
	</table>
	&nbsp;&nbsp;&nbsp;<input type="button" id="btnUp" value="수정하기">
</form>
</body>
</html>