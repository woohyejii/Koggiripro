<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- bootstrap css 로딩 --> <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> <!-- bootstrap javascript 로딩 --> <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
window.onload = function() {
	$(document).on("pageload",function(){
		  window.location.reload(true);
	});
	
		if (document.querySelector("#alert")===null){
			console.log("True");
			document.getElementById("body").innerHTML=
				//여기에 이미지 넣어주시고 가운데 정렬해주세요!!!
				`새로운 알림이 없습니다. 
			<br>도착한 알림이 없습니다.<br>
			<button onclick="location.href='index.jsp'">메인페이지로 이동하기</button>`;
		}else{
			console.log("False");
		}
	
}
	
</script>
</head>
<body>
<div id="body">
	<c:forEach var="tmp" items="${dto }">
		<c:set var="click" value="${tmp.click }" scope="session"/> 
		<c:choose>
			<c:when test="${click == 0}">
				<div id="alert" class="alert alert-primary" role="alert" onclick="location.href='alarmform?formNo=${tmp.formNo}';">
					${tmp.name }님께서 ${tmp.studyName }에 가입 요청을 보냈습니다.
				</div>
			</c:when>
			<c:otherwise>
				<div class="alert alert-secondary" role="alert" onclick='alert("이미 처리되었습니다.")'>
					${tmp.name }님께서 ${tmp.studyName }에 가입 요청을 보냈습니다.
				</div>		
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<button onclick="location.href='index.jsp'">메인페이지로 이동하기</button>
</div>

</body>
</html>