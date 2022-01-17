<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
   content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>Insert title here</title>
<!-- sign-in -->
<link rel="canonical"
   href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
<!-- Bootstrap core CSS -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet">

<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/style.css"  rel="stylesheet" />

<!-- css login -->
<link href="resources/css/log_sign.css" rel="stylesheet"/>

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

.div{
	margin: 15px;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
//아이디, 닉네임 중복확인 했는지 확인하는 용도
let id=0;
let name=0;

window.onload=function(){
   
   id=0;
   name=0;
   answer=0;
   
   let btnIns=document.querySelector("#btnIns");
   btnIns.addEventListener("click", checkData);
   
   let btnId=document.querySelector("#btnId");
   btnId.addEventListener("click", checkId);
   
   let btnName=document.querySelector("#btnName");
   btnName.addEventListener("click", checkName);
   
   //id 라는 id를 가진 id input에 keyup이벤트가 발생하면
   $("#id").keyup(function(){
	  	console.log('입력!!');
	   id=0;
   })
   
   //name 이라는 id를 가진 name input에 keyup이벤트가 발생하면
   $("#name").keyup(function(){
	   name=0;
   })
   
   
}

function checkId(){
   let useId=document.querySelector(".valueId").value;
   //alert(useId);
   $.ajax({
      url:"useId",
      type:"post",
      dataType:"json",
      data:{useId:useId},
      success: function(data){
         id=0;
         if(document.querySelector("#id").value.length>document.querySelector("#id").size){
      	   alert("아이디를 20글자 이내로 입력해주세요");
      	      frm.id.focus();
      	      return;
         }
         if(data.result=="y"){
            if(useId==""){
               alert("아이디를 입력해주세요");
               frm.id.focus();
            }else{
               alert("사용할 수 있는 아이디입니다.");
               id=1;
            }
         }else if((data.result=="n")){
            alert("사용할 수 없는 아이디입니다.");
         }
      },
      error:function(){
         alert("에러 발생");
      }
      
   });
   
}

function checkName(){
   let useName=document.querySelector(".valueName").value;
   //alert(useName);
   $.ajax({
      url:"useName",
      type:"post",
      dataType:"json",
      data:{useName:useName},
      success: function(data){
         name=0;
         if(data.result=="y"){
        	 if(document.querySelector("#name").value.length>document.querySelector("#name").size){
            	   alert("닉네임을 20글자 이내로 입력해주세요");
            	      frm.name.focus();
            	      return;
               }
            if(useName==""){
               alert("닉네임을 입력하세요");
               frm.name.focus();
            }else{
               alert("사용할 수 있는 닉네임입니다.");
                 name=1; 
            }
         }else if((data.result=="n")){
            alert("사용할 수 없는 닉네임입니다.");
         }
      },
      error:function(){
         alert("에러 발생");
      }
      
   });
   
}


function checkData(){
   
   if(frm.id.value===""){
      alert("아이디를 입력하세요");
      frm.id.focus();
      return;
   }
   
   
   if(frm.password.value===""){
      alert("비밀번호를 입력하세요");
      frm.password.focus();
      return;
   }
   
   if(document.querySelector("#password").value.length>document.querySelector("#password").size){
  	   alert("비밀번호를 20글자 이내로 입력해주세요");
  	      frm.password.focus();
  	      return;
   }
   
   if(frm.password.value!=document.querySelector("#password2").value){
	      alert("비밀번호가 일치하지 않습니다");
	      frm.password2.focus();
	      return;
	}
   
   if(frm.name.value===""){
      alert("닉네임을 입력하세요");
      frm.name.focus();
      return;
   }
   
   if(frm.answer.value===""){
	   alert("비밀번호 확인 답변 항목은 필수 입력값입니다.");
	   frm.answer.focus();
	   return;
   }
   
   if(document.querySelector("#answer").value.length>20){
  	   alert("비밀번호 확인 답변을 20글자 이내로 입력해주세요");
  	      frm.answer.focus();
  	      return;
   }
  

   if(id===0){
      alert("아이디 중복확인을 해주세요.");
      return;
   }

   if(name===0){
      alert("닉네임 중복확인을 해주세요.");
      return;
   }
   
  
   
   frm.submit();
   
}

</script>
</head>
<body class="text-center">
<main class="form-signin">
<form action="signup" method="post" name="frm">
<img class="mb-4" src="resources/img/logo/파랑코끼리.png" alt=""
            width="100" height="100">
<h1 class="h3 mb-3 fw-normal">회원 가입</h1>     
       <div class="form-floating" style="line-height:60%">
      <input type="text" class="form-control valueId" name="id" id="id">
      <label for="floatingInput">아이디</label>
     <br>
      <button class="w-100 btn btn-lg btn-secondary" type="button"
            value="회원가입" id="btnId">중복확인</button>
   </div>
       <br>
       
       
   <div class="form-floating">
      <input type="password" class="form-control" name="password" id="password">
      <label for="floatingPassword">비밀번호</label>
   </div>
   <br>
   
    <div class="form-floating">  
      <input type="password" class="form-control" id="password2">
        <label for="floatingPassword">비밀번호 확인</label>
    </div>
    <br>
   
   <div class="form-floating" style="line-height:60%"> 
      <input type="text" name="name" class="form-control valueName" id="name">
      <label for="floatingInput">닉네임</label>
      <br>
      <button class="w-100 btn btn-lg btn-secondary" type="button"
            value="회원가입" id="btnName">중복확인</button>
   </div>
   <div>
   		<label>비밀번호 확인 질문</label>
	   	<select name="hint">
	   		<option value="hint_01">자신의 인생 좌우명은?</option>
	   		<option value="hint_02">자신의 보물 제1호는?</option>
	   		<option value="hint_03">가장 기억에 남는 선생님 성함은?</option>
	   		<option value="hint_04">받았던 선물 중 기억에 남는 독특한 선물은?</option>
	   		<option value="hint_05">유년시절 가장 생각나는 친구 이름은?</option>
	   		<option value="hint_06">인상 깊게 읽은 책 이름은?</option>
	   		<option value="hint_07">자신이 두번째로 존경하는 인물은?</option>
	   		<option value="hint_08">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
	   		<option value="hint_09">다시 태어나면 되고 싶은 것은?</option>
	   		<option value="hint_10">내가 좋아하는 캐릭터는?</option>
	   	</select>
	</div>
	<div>
		<label>비밀번호 확인 답변</label>
	   	<input type="text" name="answer" id="answer">
    </div>
   
   
   
   <br>
      <button class="w-100 btn btn-lg btn-primary" type="button"
            value="가입하기" id="btnIns">가입하기</button>
        <a href="login">로그인</a>
      
   

</form>
</main>
</body>
</html>