<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원 정보 수정</h2>

<form action="modify" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" value=${ubean.id } disabled>  (20글자 이내)</td>
			
		</tr>
		<tr>
			<td>현재 비밀번호</td>
			<td><input type="password">  (20글자 이내)</td>
		</tr>
		<tr>
			<td>새 비밀번호</td>
			<td><input type="password"  name="password">  (20글자 이내)</td>
		</tr>
		<tr>
			<td>새 비밀번호 확인</td>
			<td><input type="password"></td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input type="text" name="name" value=${ubean.name }>  (20글자 이내)</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="회원정보수정">
				<input type="button" value="취소" onclick="location.href='index.jsp'">
			</td>
		</tr>
	</table>
</form>

</body>
</html>