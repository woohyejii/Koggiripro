<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//닉네임 확인 했는지 확인하는 용도
let name=0;
let pwd1=0;

window.onload=function(){
	console.log(pwd);
	name=0;
	pwd1=0;
	
	let btnName=document.querySelector("#btnName");
	btnName.addEventListener("click", checkName);
	
	let btnPwd=document.querySelector("#btnPwd");
	btnPwd.addEventListener("click", checkPwd);
	
	let btnChange=document.querySelector("#btnChange");
	btnChange.addEventListener("click", changeName);
	
	//name 이라는 id를 가진 name input에 keyup이벤트가 발생하면
	$("#name").keyup(function(){
		 name=0;
	})
	//pwd 이라는 id를 가진 pwd input에 keyup이벤트가 발생하면
	$("#pwd").keyup(function(){
		pwd1=0;
		console.log(pwd);
	})
	
}

function checkName(){
	
	   let useName=document.querySelector(".valueName").value;
	   if(useName==""){
           alert("닉네임을 입력하세요");
           frm.name.focus();
           return;
           }
		   //alert(useName);
		   $.ajax({
		      url:"useChangeName",
		      type:"post",
		      dataType:"json",
		      data:{"useName":useName, "studyNo":${studyNo}},
		      success: function(data){
		         name=0;
		         
	        	 if(data.result=="y"){
	        		 alert("유저가 존재합니다.\n위임을 계속하시려면 비밀번호 확인을 해주세요.");
	 	         	name=1;   
	 	         }else if(data.result=="n"){
	 	            alert("유저가 존재하지 않습니다.");
	 	            frm.name.focus();
	 	         }
	         },
	      error:function(){
	         alert("에러 발생");
	      }
	   });
	}
	
	
function checkPwd(){
	   let pwd=document.querySelector(".valuePwd").value;
	   if(pwd==""){
           alert("비밀번호를 입력하세요");
           frm.pwd.focus();
           return;
     	}
	   $.ajax({
	      url:"checkPwd",
	      type:"post",
	      dataType:"json",
	      data:{"pwd":pwd, "studyNo":${studyNo}},
	      success: function(data){
	         pwd=0;
	        	 if(data.result=="y"){
	        		 alert("비밀번호가 일치합니다.\n위임을 계속하시려면 스터디장 위임하기 버튼을 눌러주세요.");
	 	         	 pwd1=1;
	 	         	 console.log("성공!");
	 	         }else if(data.result=="n"){
	 	            alert("비밀번호가 틀렸습니다.");
	 	           	frm.pwd.focus();
	 	         }
	         },
	      error:function(){
	         alert("에러 발생");
	      }
	   });
	}
	
	
	
function changeName(){
	let useName=document.querySelector(".valueName").value;
	
	if(useName==""){
        alert("닉네임을 입력하세요");
        frm.name.focus();
        return;
  	}else{
  		if(name===0){
  	      alert("확인버튼을 눌러 존재하는 유저인지 확인해주세요.");
  	      return;
  	    }
  		if(pwd1===0){
    	      alert("비밀번호 확인을 해주세요.");
    	      return;
    	 }
  		if(confirm(useName+"님께 스터디장 권한을 위임하시겠습니까?")==true){
  			//스터디장 위임하기 버튼을 누르면 confirm이 뜨고 확인 버튼을 누르면 폼이 전송됨
  			frm.submit();
  		}else{
			console.log("취소");
			return false;
		}
  		
  	}
	
}



</script>
<body>




<h2>스터디장 위임</h2>
<hr>
스터디장 위임을 하시면 바로 위임이 완료되며, 위임을 받게 되면 다시 스터디장이 될 수 있습니다.
<br><br>

스터디장으로 위임할 멤버 닉네임 입력<br>
※정확하게 적어주세요.※<br>
<form action="changeStudyM" method="post" name="frm">
<input type="hidden" name="studyNo" value="${studyNo}" />

<input type="text" id="name" name="name" class="valueName">
<input type="button" id="btnName" value="확인">

<br><br>
비밀번호 확인
<br>
<input type="text" id="pwd" name="pwd" class="valuePwd">
<input type="button" id="btnPwd" value="확인">
<br><br>

<input type="button" id="btnChange" value="스터디장 위임하기">
</form>

</body>
</html>