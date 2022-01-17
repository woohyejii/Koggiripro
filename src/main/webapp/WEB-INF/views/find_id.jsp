<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.onload=function(){
	let chkName=document.querySelector("#chkName");
	chkName.addEventListener("click", chkName2);
}

function chkName2(){
	   let nameOk=document.querySelector(".name").value;
	   //alert(useId);
	   $.ajax({
	      url:"nameOk",
	      type:"post",
	      dataType:"json",
	      data:{"nameOk":nameOk},
	      success: function(data){
	    	  if(nameOk==null){
	    		  alert("닉네임을 정확하게 입력해주세요");
	    		  frm.name.focus();
	    		  return;
	    	  }
	         if(data.result=="n"){
	           alert("닉네임을 정확하게 입력해주세요");
	           frm.name.focus();
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
<h2>아이디 찾기 폼</h2>
<form action="find_id" method="post" name="frm">
닉네임으로 찾기 <input type="text" name="name" class="name"> ${msg }
<br>

<input type="button" value="확인" id="chkName">
</form>
</body>
</html>