<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="include/pagenav.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>

</head>
<body>
<%
	//로그인된 아이디가 있는지 확인
	String name = (String) session.getAttribute("namekey");
	int userNo = (Integer) session.getAttribute("userNo");
%>
<b><%=name %></b> 님 환영합니다.	
<h2><a href="mypage?userNo=${userNo}">MY PAGE</a></h2>
마이페이지


<hr />
<div>
 
Study
<br> <a href="mystudyinfo?userNo=${userNo}">스터디 조회</a>
<br> 가입중인 스터디와 운영중인 스터디를
<br>확인할 수 있습니다.
  
</div>
<br><br>

<div>
 
Profile
<br><a href="check_password.jsp">회원 정보</a>
<br>회원님의 개인정보를
<br>관리하는 공간입니다.
  
</div>
<br><br>

<div>
 
Board
<br><a href="board?userNo=${userNo }">게시물 관리</a>
<br>회원님이 작성하신 게시물을
<br>관리하는 공간입니다.
  
</div>

<br><br>
<div>
 
Comments
<br><a href="comments?userNo=${userNo }">댓글 관리</a>
<br>회원님이 작성하신 댓글을
<br>관리하는 공간입니다.
  
</div>
<br><br>



<!--<button id="managerStudy" onclick = "location.href='mypageNew?userNo=${userNo}&memberOrManager=manager'">가입 중인 스터디</button>-->
<!-- 
<button id="memberStudy">가입 중인 스터디</button>
<button id="managerStudy">운영 중인 스터디</button>
 <font color="blue">버튼을 눌러주세요!</font>

<hr />
<script>

document.querySelector("#memberStudy").addEventListener("click",member)
document.querySelector("#managerStudy").addEventListener("click",manager)

 
function member(){
	 $("#showStudy").empty();
		member1();
	}
	
function member1(){
	let str="";
	$.ajax({
		type:"get",
		url:"mypageNew?userNo="+${userNo }+"&memberOrManager=member",
		dataType:"json",
		
		success:function(Data){
			console.log(Data);
			let count = 0;
			let list = Data.datalist;
			console.log(list);
			$(list).each(function(idx,obj){
				let href = 'studyboard?userNo=${userNo}&studyNo='+obj.studyNo+'&page=1'+"'"+'"';
				str+="<button onclick="+ '"location.href=' +"'"+href+">"+obj.studyName+obj.language+obj.nowPeopleNum+"/"+obj.maxPeopleNum+"</button><br/>";
				console.log(str);
				count++;				
			});
			if(count==0) str="가입 중인 스터디가 없습니다.";
			$("#showStudy").html(str);
		},
		error:function(){
			alert("error")
			$("#showStudy").text("error");
		}
	})
}
 
 function manager(){
		$("#showStudy").empty();
		manager1();
	} 
 
 function manager1(){
	 let str="";
		$.ajax({
			type:"get",
			url:"mypageNew?userNo="+${userNo }+"&memberOrManager=manager",
			dataType:"json",
			
			success:function(Data){
				console.log(Data);
				let count = 0;
				let list = Data.datalist;
				
				console.log(list);
				$(list).each(function(idx,obj){
					let href = 'studyboard?userNo=${userNo}&studyNo='+obj.studyNo+'&page=1'+"'"+'"';	
					str+="<button onclick="+ '"location.href=' +"'"+href+">"+obj.studyName+obj.language+obj.nowPeopleNum+"/"+obj.maxPeopleNum+"</button><br/>";
					console.log(str);
					count++;				
				});
				
				if(count==0) str="운영 중인 스터디가 없습니다.";
				$("#showStudy").html(str);
			},
			error:function(){
				alert("error")
				$("#showStudy").text("error");
			}
		})
 }
</script>
<div id="showStudy">

</div>
 -->
</body>
</html>