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
<link href="resources/css/log_sign.css"  rel="stylesheet" />

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

div{
	margin: 15px;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

</head>
<script>
	window.onload = function() {
		//로그인 화면에 들어오면 아이디 칸에 커서가 있음
		frm.id.focus();
		
		let btnlog = document.querySelector("#btnlog");
		btnlog.addEventListener("click", checkData);

		let btnSign = document.querySelector("#btnSign");
		btnSign.addEventListener("click", moveSign);
	}

	//회원가입 버튼 누르면 회원가입 폼으로 이동
	function moveSign() {
		document.sign.submit();
		return;
	}

	function checkData() {
		if (frm.id.value === "") {
			alert("아이디를 입력해주세요.");
			frm.id.focus();
			return;
		}
		if (frm.password.value === "") {
			alert("비밀번호를 입력해주세요.");
			frm.password.focus();
			return;
		}

		frm.submit()

	}
	
function enterkey() {
	if (window.event.keyCode == 13) {
		checkData();
    }
}
</script>

<body class="text-center">

	<main class="form-signin">
		<form action="login" method="post" name="frm">
			<img class="mb-4" src="resources/img/logo/파랑코끼리.png" alt=""
				width="100" height="100">
			<!-- 
			<h1 class="h3 mb-3 fw-normal">로그인</h1>
			 -->
			 
			<div class="form-floating">
				<input type="text" class="form-control" name="id" value="${bean.id }" onkeyup="enterkey()"> 
				<label for="floatingInput">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control"  name="password" value="${bean.password }" onkeyup="enterkey()">
				<label for="floatingPassword">비밀번호</label>
			</div>
			<br>

			<button class="w-100 btn btn-lg btn-primary" type="button"
				value="로그인" id="btnlog">로그인</button>
				
				
				
				<a href="find_id">아이디찾기</a> | 비밀번호찾기 | <a href="signup">회원가입</a>
				
				
			<p class="mt-5 mb-3 text-muted">&copy; 2022</p>
		</form>
	</main>

	<!-- 회원가입 페이지로 이동하기 위함 -->
	<form action="signup" method="get" name="sign"></form>

</body>
</html>