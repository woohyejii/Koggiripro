<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-striped"
		style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="3"
					style="background-color: #eeeeee; text-align: center;">스터디신청</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>스터디명</td>
				<td colspan="2">${dto.studyName }  </td>
			</tr>
			<tr>
				<td>신청자</td>
				<td colspan="2">${dto.name } </td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="2" style="min-height: 200px; text-align: left;">${dto.content } </td>
			</tr>
		</tbody>
	</table>

	<br>
	<button onclick="myFunction()">승인</button>
	<button onclick="myFunction2()">거절</button>

	<script>
		function myFunction() {
			location.href = "approval?userNo="+${dto.userNo}+"&studyNo="+${dto.studyNo}+"&formNo="+${dto.formNo}+"&manager_userNo="+${dto.manager_userNo}
			alert("가입이 승인되었습니다!");

		}
		function myFunction2() {
			location.href = "refusal?formNo="+${dto.formNo}+"&manager_userNo="+${dto.manager_userNo}
			alert("가입이 거절되었습니다!");
		}
	</script>
</body>
</html>