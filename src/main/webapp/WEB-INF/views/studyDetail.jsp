<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>스터디 상세보기</title>

<!-- bootstrap 세팅 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script>
window.onload=function(){
	let insertBtn=document.querySelector("#insertBtn");
	insertBtn.addEventListener("click", moveSign);


}
function copyToClipboard(val) {
    var t = document.createElement("textarea");
    document.body.appendChild(t);
    t.value = val;
    t.select();
    document.execCommand('copy');
    document.body.removeChild(t);
    alert('주소를 복사하였습니다');
 }
function moveSign(){
	
	
	if(sign.namekey.value==''){
		let result=confirm("로그인이 필요한 서비스입니다. \n로그인 하시겠습니까?");
		if(result){
			//로그인 페이지 이동
			document.log.submit();
			return;
		}else{
			//현재 페이지 머물기
			return;
		}
	  }else{
		//만약에 이미 가입이 되어있으면 가입된 스터디라고 알림창 띄우고 마이페이지로 이동
			if(${result==""}){
				alert("이미 가입된 스터디 입니다.");
				location.href=`home`;
				
				return;
			}
			if(${result2==""}){
				alert("이미 가입 신청을 했습니다.");
				return;
			} 
	  }
	if(${result3==""}){
		alert("가입 불가합니다.\n인원이 다 모집된 스터디입니다.")
		return;
	}
	
	document.sign.submit();
}
</script>    
</head>
<body>

 
 
<div class="container">

<br>
<div class="card border-primary col-mb-3" style="max-width: 40rem; float: none; margin:0 auto;">
  
  
  <h5><div class="card-header">스터디 소개</div></h5>
  <div class="card-body">
    <h4 class="card-title"><b>${dto.studyName }</b></h4>
    <h5 class="card-title">${dto.content }</h5>
    <p class="card-text">
    	사용언어 : 
    	<span class="badge rounded-pill bg-warning text-dark">
    	${dto.language }
    	
    	</span>
    	
    	<br>
    	스터디장 : ${dto.name }
    	<br>
    	모집인원 : ${dto.nowPeopleNum }/${dto.maxPeopleNum }
    	<br>
    	개설일 : <b>${time }</b>
    	<br><b>
    	
    	<!-- <font color="orange">${result }</font></b> -->
    </p>
  </div>

	<!-- 스터디 회원가입 페이지로 이동하기 위함 -->
	<form action="studysignup" method="get" name="sign">
		<input type="hidden" name="studyNo" value=${studyNo }>
		<input type="hidden" name="namekey" value="${namekey }">
	</form>
	<!-- 로그인 안되어있을때 로그인 페이지로 이동하기 위함 -->
	<form action="login" method="get" name="log">
	</form>


	
</div>
</div>
<br>
<div class="btn-group float-middle text-center gap-2 d-md-block" role="group" aria-label="Basic example" style="float: none; margin:0 auto; ">
  <button type="button" class="badge rounded-pill bg-primary" id="backBtn" onclick="location.href='home'">목록보기</button>
  <button type="button" class="badge rounded-pill bg-light text-dark" id="copybtn" onclick="copyToClipboard('http://localhost/koggiri/studyDetail?studyNo=' + ${dto.studyNo });">복사하기</button>
  <button type="button" class="badge rounded-pill bg-primary" id="insertBtn">가입하기</button>
</div>
</body>
</html>