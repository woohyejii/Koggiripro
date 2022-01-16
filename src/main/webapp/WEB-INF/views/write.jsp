<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<%
	//로그인된 아이디가 있는지 확인
	String name = (String) session.getAttribute("namekey");
	int userNo = (Integer) session.getAttribute("userNo");
%>
<script type="text/javascript">
window.onpageshow = function(event) {
	   if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
	   // Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
	   location.href="studyboard?userNo=<%=userNo%>&studyNo=${studyNo }&page=1"
	   
	   
	   }
	}
	
</script>
<script type="text/javascript">

	window.onload=function(){
		let btnIns = document.querySelector("#btnIns");
		btnIns.addEventListener("click",checkData);
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
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<style>
	i{font-size:30px;}
	input[type=button]{
  background-color: #0f7ee0;
  border: none;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
  margin:0 auto;
  text-align:center;
}




</style>

</head>
<body>
<p style="border-left: 10px solid #688FF4; padding: 0.5em; border-bottom: 2px solid #688FF4; ">글쓰기</p>

<br>
<form action="write" method="post" name="frm">
	<input type="hidden" id="studyNo" name ="studyNo" value=${studyNo }>
	<input type="hidden" id="userNo" name ="userNo" value=${userNo }>
	
	<table>
			<tr>
				<td><i class="bi bi-person-fill"></i></td>
				<td>${name }</td>
			</tr>
	</table> <br>
	
	<div class="mb-3">


		<label for="title">제목</label>

		<input type="text" class="form-control title" name="title" placeholder="제목을 입력해 주세요" id="title">

	</div>

	<div class="mb-3">

		<label for="content">글 내용</label>

		<textarea class="form-control content" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>

	</div>

	<br><br>

	<input type="button" value="등 록" id="btnIns" />&nbsp;&nbsp;
	<input type="button" value="목 록" id="btn" onclick ="location.href='studyboard?userNo=${userNo}&studyNo=${studyNo }&page=1'"/>
	
	</form>
<script>
</script>
</body>
</html>