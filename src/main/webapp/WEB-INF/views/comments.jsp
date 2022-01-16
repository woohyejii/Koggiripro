<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	//로그인된 아이디가 있는지 확인
	int userNo = (Integer) session.getAttribute("userNo");
%>
<body>
<h3>댓글 관리</h3>


<table border="1">
<thead>
	<tr>
		<th>스터디</th>
		<th>글 제목</th>
		<th>댓글</th>
		<th>작성일</th>
		<!-- <th>삭제</th> -->
	</tr>
</thead>
<tbody>
<!-- <div id="showList"> -->
	<c:forEach var="tmp" items="${clist}" varStatus="status">
		<tr>
			<td>${slist[status.index] }</td>
			<td><a href="postDetail?postNo=${tmp.postNo }&cpage=0&studyNo=${tmp.studyNo }&userNo=${ulist[status.index] }">${tlist[status.index] }</a> </td>
			<td>${tmp.content } </td>
			<td>${tmp.time } </td>
			<!-- 
			<td>
			 	<a href="deletecom?commentNo=${tmp.commentNo }&postNo=${tmp.postNo }&studyNo=${tmp.studyNo }&userNo=${userNo }">삭제</a>
			</td>
			 -->

		</tr>
	</c:forEach>
</body>
</html>