<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
window.onload = function(){
	
	let btnSujung = document.querySelector("#btnSujung");
	btnSujung.addEventListener("click", checkData);
}
function checkData(){
	if(frm.content.value === ""){
		alert("스터디 소개를 적어주세요");
		frm.content.focus();
		return;
	}
	if($('input[name=languageChk]:checked').length==0){
		alert("스터디 언어를 선택해주세요");
		return;
	}
	
	if(frm.maxPeopleNum.value === ""){
		alert("모집인원을 입력하세요");
		frm.maxPeopleNum.focus();
		return;
	}else{
		let str=frm.maxPeopleNum.value;
		let cond=/[^0-9]/g;
		let result=cond.test(str);
		if(result){
			alert("숫자를 입력하세요")
			frm.maxPeopleNum.focus();
			return;
		}
	}
	if(frm.maxPeopleNum.value>20){
		alert("최대 모집인원은 20명 입니다");
		frm.maxPeopleNum.focus();
		return;
	}
	
	if(frm.maxPeopleNum.value < document.querySelector("#nowPeopleNum").value){
		alert("현재인원보다 모집인원이 적습니다.");
		frm.maxPeopleNum.focus();
		return;
	}
	
	
	var str = $('#content').val();
	str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	$('#content').val(str);
	
	frm.submit()
}
</script>
</head>
<body>
**스터디 소개글 수정하는 페이지입니다**
<form action="sujungStudy" method="post" name="frm">
<!-- 수정한 후에 스터디 소개글로 가기 위해서 스터디번호를 가져간다. -->
<input type="hidden" name="studyNo" value=${studyNo }>
	<table>
		<tr>
			<td>스터디명</td>
			<td><input type="text" value="${sdto.studyName }" disabled></td>
		</tr>
		<tr>
			<td>스터디소개</td>
			<td>
				<textarea rows="5" cols="50" name="content" style="height: 100px" id="content">${sdto.content }</textarea>
			</td>
		</tr>
		<tr>
			<td>스터디 언어 선택</td>
			<td>
			<input type="checkbox" name="languageChk" id="languageChk1" value="NODEJS">node.js
			<input type="checkbox" name="languageChk" id="languageChk2" value="PYTHON">파이썬
			<input type="checkbox" name="languageChk" id="languageChk3" value="JAVA">자바
			<input type="checkbox" name="languageChk" id="languageChk4" value="JAVASCRIPT">자바스크립트
			<input type="checkbox" name="languageChk" id="languageChk5" value="SPRING">스프링
			<input type="checkbox" name="languageChk" id="languageChk6" value="KOTLIN">코틀린
			</td>
		</tr>
		<tr>
			<td>현재인원</td>
			<td><input type="text" id="nowPeopleNum" value=${sdto.nowPeopleNum } disabled></td>
		</tr>
		<tr>
			<td>모집인원</td>
			<td><input type="text" name="maxPeopleNum" value=${sdto.maxPeopleNum } ></td>
		</tr>		
		<tr>
			<td colspan="2" style="text-align: center;"><br />
				<input type="button" value="수 정" id="btnSujung">
				<input type="button" value="취 소" onclick="history.back()">
			</td>
		</tr>
	</table>
</form>
 
<script>
let str="${sdto.content }";
str = str.replaceAll("<br/>", "\n");
document.querySelector("#content").value = str;
</script>

</body>
</html>