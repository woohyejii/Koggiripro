<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
window.onload=function(){
	let chkId=document.querySelector("#chkId");
	chkId.addEventListener("click", chkUser);
}

function chkUser(){
	let id=document.querySelector(".valueId").value;
	let hint=document.querySelector(".hint").value;
	let answer=document.querySelector(".answer").value;
	if(id==""){
        alert("아이디를 입력해주세요");
        frm.id.focus();
        return;
	 }
	 if(answer==""){
        alert("비밀번호 확인 답변을 입력해주세요");
        frm.answer.focus();
        return;
	 }
  	if(document.querySelector("#answer").value.length>20){
	   alert("비밀번호 확인 답변을 20글자 이내로 입력해주세요");
	 	  frm.answer.focus();
	      return;
  	}
  	
	$.ajax({
	      url:"chkAnswer",
	      type:"post",
	      dataType:"json",
	      data:{hint:hint, answer:answer, id:id},
	      success: function(data){
	    	 
	         if(data.result=="n"){
             alert("아이디 혹은 비밀번호 확인 답변이 틀렸습니다.");
             return;
	         }else{
	        	 frm.submit();
	         }
	    },
	    error:function(){
	       alert("에러 발생");
	    }
	 });
	
}

</script>
</head>
<body>
<h2>비밀번호 찾기 폼</h2>
<form action="find_pwd" method="post" name="frm" onsubmit="return false">
<table>
<tr>
	<td>아이디</td> 
 	<td><input type="text" name="id" class="valueId" id="id"></td>
</tr>
<tr>
	<td>비밀번호 확인 질문</td>
	<td>
	<select name="hint" class="hint">
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
	</td>
</tr>
<tr>
	<td>비밀번호 확인 답변</td>
	<td><input type="text" name="answer" id="answer" class="answer"></td>
</tr>	
<tr>
	<td colspan="2">
	<input type="button" value="확인" id="chkId">
	</td>
</tr>
</table>
</form>
</body>
</html>