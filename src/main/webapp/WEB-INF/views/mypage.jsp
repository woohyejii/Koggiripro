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
<h2><a href="javascript:void(0);" onclick="javascript:frm4.submit();">MY PAGE</a></h2>

마이페이지

<!-- 마이페이지 이동 -->
<form action="mypage" method="post" name="frm4">
<input type="hidden" name="userNo" value=${userNo}>
</form>

<hr />
<div>
 
Study
<br> <a href="javascript:void(0);" onclick="javascript:frm.submit();">스터디 조회</a>
<br> 가입중인 스터디와 운영중인 스터디를
<br>확인할 수 있습니다.

<!-- 스터디 조회 페이지 이동 -->
<form action="mystudyinfo" method="post" name="frm">
<input type="hidden" name="userNo" value=${userNo}>
</form>

  
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
<br><a href="javascript:void(0);" onclick="javascript:frm2.submit();">게시물 관리</a>
<br>회원님이 작성하신 게시물을
<br>관리하는 공간입니다.

<!-- 게시물 관리 페이지 이동 -->
<form action="board" method="post" name="frm2">
<input type="hidden" name="userNo" value=${userNo}>
<input type="hidden" name="cpage" value=0>
</form>
  
</div>

<br><br>
<div>
 
Comments
<br><a href="javascript:void(0);" onclick="javascript:frm3.submit();">댓글 관리</a>
<br>회원님이 작성하신 댓글을
<br>관리하는 공간입니다.

<!-- 댓글 관리 페이지 이동 -->
<form action="comments" method="post" name="frm3">
<input type="hidden" name="userNo" value=${userNo}>
<input type="hidden" name="cpage" value=0>
</form>
  
</div>
<br><br>



</body>
</html>