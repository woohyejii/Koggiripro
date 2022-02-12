<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<style>
	h2,btn{ text-align: center; }
#wrapper{ margin: 50px;}
</style>

<meta charset="UTF-8">
<title>스터디생성</title>
<script>

//스터디 중복 확인하기 위함
let name=0;

window.onload = function(){
	
	name=0;
	
	let btnIns = document.querySelector("#btnIns");
	btnIns.addEventListener("click", checkData);
	
	//스터디 중복확인하기
	let btnName = document.querySelector("#btnName");
	btnName.addEventListener("click", checkName);
		
	//목록으로 가기
	let moveHome=document.querySelector("#moveHome");
	moveHome.addEventListener("click", moveHome1);
	
	//name 이라는 id를 가진 name input에 keyup이벤트가 발생하면
	$("#studyName").keyup(function(){
	   name=0;
	})
		
}
	
function checkName(){
	   let studyName=document.querySelector("#studyName").value;
	   //alert(useName);
	   $.ajax({
	      url:"usestudyName",
	      type:"post",
	      dataType:"json",
	      data:{studyName:studyName},
	      success: function(data){
	         name=0;
	         if(data.result=="y"){
	        	 if(document.querySelector("#studyName").value.length>document.querySelector("#studyName").size){
	            	   alert("스터디명을 30글자 이내로 입력해주세요");
	            	      frm.name.focus();
	            	      return;
	               }
	        	 
	        	 
	            if(studyName==""){
	               alert("스터디명을 입력하세요");
	               frm.name.focus();
	            }else{
	               alert("사용할 수 있는 스터디명 입니다.\n스터디명은 변경이 불가합니다.");
	                 name=1; 
	            }
	         }else if(data.result=="n"){
	            alert("사용할 수 없는 스터디명 입니다.");
	         }
	      },
	      error:function(){
	         alert("에러 발생");
	      }
	      
	   });
	   
	}
	
	function moveHome1(){
		document.home.submit();
		return;
	}
	
	function checkData(){
		if($('input[name=languageChk]:checked').length==0){
			alert("스터디 언어를 선택해주세요");
			return;
		}
		if(frm.studyName.value === ""){
			alert("스터디명을 입력하세요");
			frm.studyName.focus();
			return;
		}
		
		if(name===0){
		      alert("스터디명 중복확인을 해주세요.");
		      return;
		}
		
		if(frm.content.value === ""){
			alert("스터디 소개를 적어주세요");
			frm.content.focus();
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
		
		var str = $('#textarea').val();
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$('#textarea').val(str);
		
		frm.submit()
	}
	
</script>

<!-- Styles -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700&amp;display=swap&amp;subset=latin-ext"
    rel="stylesheet">
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/fontawesome-all.css" rel="stylesheet">
<link href="resources/css/swiper.css" rel="stylesheet">
<link href="resources/css/magnific-popup.css" rel="stylesheet">
<link href="resources/css/styles.css" rel="stylesheet">

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet"/>

</head>
<body>

 <!-- Navigation -->
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top" style="background-color:#185ADB; height:74px;">
        <div class="container">

            <!-- Text Logo - Use this if you don't have a graphic logo -->
            <!-- <a class="navbar-brand logo-text page-scroll" href="index.html">Tivo</a> -->

            <!-- Image Logo -->
            <a class="navbar-brand logo-image" href="index.jsp"><img src="resources/images/logo-001.svg" alt="alternative"></a>

            <!-- Mobile Menu Toggle Button -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault"
                aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-awesome fas fa-bars"></span>
                <span class="navbar-toggler-awesome fas fa-times"></span>
            </button>
            <!-- end of mobile menu toggle button -->

            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="index.jsp">HOME <span
                                class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll active" href="home">스터디</a>
                    </li>

                    <!-- Dropdown Menu -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle page-scroll" href="#" id="navbarDropdown" role="button"
                            aria-haspopup="true" aria-expanded="false">채용</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="https://www.wanted.co.kr/"><span class="item-text">원티드</span></a>
                            <div class="dropdown-items-divide-hr"></div>
                            <a class="dropdown-item" href="https://www.jobkorea.co.kr/"><span class="item-text">잡코리아</span></a>
                            <div class="dropdown-items-divide-hr"></div>
                            <a class="dropdown-item" href="https://www.saramin.co.kr"><span class="item-text">사람인</span></a>
                        </div>
                    </li>
                    <!-- end of dropdown menu -->

                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="studyCafeMap.jsp">지도</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="faq.jsp">FAQ</a>
                    </li>
                </ul>
                
                    <%
                  //로그인된 아이디가 있는지 확인
                  String name=(String)session.getAttribute("namekey");
                  int userNo=(Integer)session.getAttribute("userNo");
                %>
                <%if(name==null){ %>
                <span class="nav-item">
                    <a class="btn-outline-sm" href="login">로그인</a>
                </span>
                <span class="nav-item">
                    <a class="btn-outline-sm" href="signup">회원가입</a>
                </span>
                <%}else{ %>
                <span class="nav-item">
                    <a class="btn-outline-sm" href="alarmList?userNo=${userNo }">알림</a>
                </span>
                <span class="nav-item">
                    <a class="btn-outline-sm" href="javascript:void(0);" onclick="javascript:frm.submit();">마이페이지</a>
                </span>
                <span class="nav-item">
                    <a class="btn-outline-sm" href="logout">로그아웃</a>
                </span>
                <%} %>
            </div>
        </div> <!-- end of container -->
    </nav> <!-- end of navbar -->
    <!-- end of navigation -->
    
       	<!-- 마이페이지 이동 -->
	<form action="mypage" method="post" name="frm">
	<input type="hidden" name="userNo" value=${userNo}>
	</form>
   


<!-- Header -->
    <header id="header" class="ex-header" style="padding-bottom:100px; padding-top:130px; margin-bottom:20px;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>스터디 생성</h1>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->
    
<div id="wrapper" style="width:60%; margin:0 auto;height: 1000px;">
<input type="button" value="목 록" id="moveHome" class="w-10 btn btn-lg btn-secondary">
<br /><br />

<form action="newStudyForm" method="post" name="frm">
	<input type="hidden" id="manager_userNo" name="manager_userNo" value="${manager_userNo }"/>
	<div class="form-floating">
		<input type="text" name="studyName" class="form-control" id="studyName" >
		<label for="studyName">스터디명</label>
		<input type="button" id="btnName" value="중복확인">
	</div>
	<br />
	<div class="form-floating">
		<textarea class="form-control" name="content" placeholder="스터디 설명을 적어주세요." id="textarea" style="height: 287px"></textarea>
		<label for="textarea">스터디소개</label>
	</div>
	<br />
	스터디 언어 선택
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk1" value="NODEJS">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">node.js</label>
	</div>
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk2" value="PYTHON">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">파이썬</label>
	</div>
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk3" value="JAVA">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">자바</label>
	</div>
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk4" value="JAVASCRIPT">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">자바스크립트</label>
	</div>
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk5" value="SPRING">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">스프링</label>
	</div>
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk6" value="KOTLIN">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">코틀린</label>
	</div>
	<br />
	<div class="form-floating mb-3">
		<input type="text" name="maxPeopleNum"  class="form-control" id="maxPeopleNum">
		<label for="maxPeopleNum">모집인원</label>
	</div>
	<br />
	<input type="button" value="등 록" id="btnIns" class="w-25 btn btn-lg btn-secondary" style="display: block; margin: auto;">
	</form>
</div>
	<!-- 로그인 안되어있을때 로그인 페이지로 이동하기 위함 -->
	<form action="home" method="get" name="home">
	</form>
	
</body>
</html>