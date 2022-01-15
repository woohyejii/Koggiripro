<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 네이버 카페 폐쇄하는 이미지를 참고하였습니다. 
링크 : https://kin-phinf.pstatic.net/20210104_30/1609743685683ij3Q9_JPEG/SE-236728d1-b9e8-4b89-8a6d-1ee636f35568.jpg
-->

<h2>스터디 폐쇄</h2>

<b>스터디를 더이상 운영하기 원치 않으시거나 <br>
스터디 탈퇴를 원하시나요?</b><br><br>
스터디 폐쇄를 하지 않고 스터디장 위임을 통해 스터디를 유지시킬 수 있습니다.<br>
다른 스터디 멤버에게 스터디장 위임을 하시겠습니까?<br>
<br>
<button onclick="javascript:btnChange_event()">스터디장 위임하기</button>

<br><br><br>

<b>스터디를 폐쇄하시겠습니까?</b><br><br>
스터디 폐쇄는 스터디장을 제외한 스터디 멤버가 없는 경우에만 가능합니다.<br>
<font color="blue">현재, 스터디 멤버가 2명 이상(스터디장 포함) 있으므로 폐쇄가 되지 않습니다.</font><br>
스터디를 폐쇄 하시려면 멤버가 모두 탈퇴하여야 가능합니다.<br>


<!-- 스터디장 위임하기 버튼을 누르면 아래 폼을 전송함. -->
	<form id="changeStudyM" method="get" action="changeStudyM">
		<input type="hidden" name="studyNo" value="${studyNo}" />
	</form>
<script>
function btnChange_event(){
	document.getElementById("changeStudyM").submit();
}
</script>

</body>
</html>