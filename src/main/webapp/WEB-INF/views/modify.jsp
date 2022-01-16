<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
//닉네임 변경 했는지 확인하는 용도
let name=1;

window.onload=function(){
	
	
	let btnModify=document.querySelector("#btnModify");
	btnModify.addEventListener("click", checkData);
	
	let btnName=document.querySelector("#btnName");
	btnName.addEventListener("click", checkName);
	
	//name 이라는 id를 가진 name input에 keyup이벤트가 발생하면
	   $("#name").keyup(function(){
		   name=0;
	   })
	
}

function checkData(){
	checknowPwd();
	
}


function checknowPwd(){
	let checkPwd=document.querySelector(".checkpwd").value;
	let userNo=document.querySelector(".userNo").value;
	$.ajax({
		url:"checkPwd5",
		type:"post",
		dataType:"json",
		data:{"checkPwd":checkPwd, "userNo":userNo},
		success: function(data){
			if(data.result=="n"){
				alert("현재 비밀번호를 정확하게 입력해 주세요.")
				return false;
			}else{
				checknewPwd();
			}
		},
		error:function(){
	         alert("에러 발생");
	    }
	});
}

function checknewPwd(){
	
	
	if(frm.password.value===""){
	      alert("새 비밀번호를 입력해 주세요");
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
	      frm.password.focus();
	      return;
	   }
	
	if(name==0){
		alert("닉네임 변경 버튼을 눌러 변경을 완료해주세요");
	    frm.name.focus();
	    return;
	}
	
	
	frm.submit();
	   
}

function checkName(){
	showPopup();
}

	
/*   
[ 팝업 옵션 문자열 ]

yes나 no로 지정하면 됩니다.
toolbar = 상단 도구창 출력 여부 
menubar = 상단 메뉴 출력 여부
location = 메뉴아이콘 출력 여부
directories = 제목 표시줄 출력 여부
status = 하단의 상태바 출력 여부
scrollbars = 스크롤바 사용 여부
resizable = 팝업창의 사이즈 변경 가능 여부

사이즈 정의(픽셀 px)
width = 팝업창의 가로 길이 설정
height = 팝업창의 세로 길이 설정
top = 팝업창이 뜨는 위치(화면 위에서부터의 거리 지정)
left = 팝업창이 뜨는 위치(화면 왼쪽에서부터의 거리 지정)
*/

//팝업 띄우는 함수 
function showPopup(){
	PopupCenter("popup_page.jsp","팝업창",800,600);
}

//팝업을 중앙에 원하는 페이지를 원하는  크기로 띄우는 함수 
function PopupCenter(url, title, w, h) {
   // Fixes dual-screen position                         Most browsers      Firefox
   var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
   var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;
   
   width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
   height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
   
   var left = ((width / 2) - (w / 2)) + dualScreenLeft;
   var top = ((height / 2) - (h / 2)) + dualScreenTop;
   var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
   
   // Puts focus on the newWindow
   if (window.focus) {
       newWindow.focus();
   }

}

function inputName(nName){
	frm.name.value=nName;
	name=1
}


</script>
<body>
<%
	//로그인된 아이디가 있는지 확인
	String name = (String) session.getAttribute("namekey");
	int userNo = (Integer) session.getAttribute("userNo");
%>

<h2>회원 정보 수정</h2>

<form action="modifySuccess" method="post" name="frm">
<input type="hidden" name="userNo" class="userNo" value=<%=userNo %>>
<input type="hidden" name="id" value=${ubean.id }>
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" value=${ubean.id } disabled></td>
			
		</tr>
		<tr>
			<td>현재 비밀번호</td>
			<td><input type="password" class="checkpwd"></td>
		</tr>
		<tr>
			<td>새 비밀번호</td>
			<td><input type="password"  name="password" id="password"></td>
		</tr>
		<tr>
			<td>새 비밀번호 확인</td>
			<td><input type="password" id="password2"></td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input type="text" value=${ubean.name } name="name" class="valueName" id="name"></td>
			<td><input type="button" value="닉네임 변경" id="btnName"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="회원정보수정" id="btnModify">
				<input type="button" value="취소" onclick="location.href='index.jsp'">
			</td>
		</tr>
	</table>
</form>

</body>
</html>