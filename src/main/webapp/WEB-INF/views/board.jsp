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
	String name = (String) session.getAttribute("namekey");
	int userNo = (Integer) session.getAttribute("userNo");
%>
<body>
<h3>게시물 관리</h3> 

<table border="1">
<thead>
	<tr>
		<th>스터디</th>
		<th>글 번호</th>
		<th>글 제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
</thead>
<tbody>
<!-- <div id="showList"> -->
	<c:forEach var="tmp" items="${plist}" varStatus="status">
		<tr>
			<td><a href="studyboard?studyNo=${tmp.sNo }&page=1">${slist[status.index] }</a></td>
			<td>${tmp.postNo }</td>
			<td><a href="postDetail?postNo=${tmp.postNo }&cpage=0&studyNo=${tmp.sNo }&userNo=${tmp.uNo }">${tmp.title }</a></td>
			<td>${name }</td>
			<td>${tmp.postTime }</td>
			<td>${tmp.views }</td>
			<td><c:set var="u" value="${tmp.uNo }" /> <c:set var="s"
					value="${userNo }" /> <c:choose>
					<c:when test="${u eq s}">
						<a href ="updatePost?postNo=${tmp.postNo }&studyNo=${tmp.sNo }">수정</a>
					</c:when>
				</c:choose></td>

			<td>
			 	<a href ="deletePost2?postNo=${tmp.postNo }&userNo=${userNo }&studyNo=${tmp.sNo }" onclick="return confirm('삭제된 게시글은 복구가 불가합니다.\n정말로 삭제하시겠습니까?');">삭제</a>
			</td>

		</tr>
	</c:forEach>
	

		<tr style="text-align: center;">
			<td colspan="8"><c:forEach var="cpsu" begin="1"
					end="${cpageSu }">
					<c:if test="${cpsu == cpage }">
						<b><u>${cpsu }</u></b>
					</c:if>
					<c:if test="${cpsu != cpage }">
						<a href="javascript:void(0);" onclick="javascript:frm.submit();">${cpsu}</a>
						<!-- 게시물 관리 페이지 이동 -->
						<form action="board" method="post" name="frm" style="display:none">
						<input type="hidden" name="userNo" value="${userNo}">
						<input type="hidden" name="cpage" value="${cpsu}">
						</form>
					</c:if>
				</c:forEach></td>
		</tr>
	</table>
	
	
</body>
</html>