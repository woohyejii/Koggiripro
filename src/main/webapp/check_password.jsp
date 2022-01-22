<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ include file="WEB-INF/views/include/pagenav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
window.onload=function(){
	let btnPwd=document.querySelector("#btnPwd");
	btnPwd.addEventListener("click", checkData);
	
	
	
	
	
}

function checkData(){
	let checkPwd=document.querySelector(".password").value;
	let userNo=document.querySelector(".userNo").value;
	$.ajax({
		url:"checkPwd5",
		type:"post",
		dataType:"json",
		data:{"checkPwd":checkPwd, "userNo":userNo},
		success: function(data){
			if(data.result=="n"){
				alert("비밀번호를 정확하게 입력해 주세요.")
				return false;
				
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

<h2><a href="javascript:void(0);" onclick="javascript:frm4.submit();">MY PAGE</a></h2>

마이페이지

<!-- 마이페이지 이동 -->
<form action="mypage" method="post" name="frm4">
<input type="hidden" name="userNo" value=${userNo}>
</form>


<hr />

<%
	//로그인된 아이디가 있는지 확인
	String name = (String) session.getAttribute("namekey");
	int userNo = (Integer) session.getAttribute("userNo");
%>
<h3>회원 정보 수정</h3>
<br><br><br>
<h5>비밀번호 확인</h5>
<br>
<b><font color="green"><%=name %></font></b>님의 회원정보를 안전하게 보호하기 위해 <br>
비밀번호를 한번 더 확인해 주세요.
<br>
<br>
<form action="modify" method="get" name="frm" onsubmit="return false">
<input type="hidden" name="userNo" class="userNo" value=<%=userNo %>>
비밀번호 <input type="password" class="password">
<input type="button" value="확인" id="btnPwd">
</form>
</body>
</html>