<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%> 


<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Heroic Features - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet"/>

<title>Insert title here</title>
<style>
@font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body{font-family:'IBMPlexSansKR-Regular' }

.layout{
    max-width: 600px;
    margin: 0 auto;
}

.qna{
    list-style: none;
    margin: 0;
    padding: 0;
}
.qna > li{
  padding: 10px 0;
  box-sizing: border-box;
}
.qna > li:nth-child(n+2){ /* 아이템 구분 점선 */
  border-top: 1px dashed #aaa;
}
.qna input {
  display: none;
}

.qna label { /* 제목 - 클릭 영역 */
  font-weight: bold;
  color: #000;
  margin: 20px 0 0;
  cursor: pointer;
}
.qna label::before { /* 제목 앞 화살표 */
  display: block;
  content: "";
  width: 0;
  height: 0;
  border: 8px solid transparent;
  border-left: 8px solid #a00;
  margin: 2px 0 0 8px;
  float: left;

}
.qna input:checked + label::before { /* 내용 펼침 상태 제목 앞 화살표 */
  border: 8px solid transparent;
  border-top: 8px solid #a00;
  border-bottom: 0;
  margin: 8px 4px 0;
}

.qna div { /* 내용 영역 - 기본 감춤 상태 */
  display: none;
  color: #666;
  font-size: 0.9375em;
  overflow: hidden;
  padding: 10px 0 10px 30px;
  box-sizing: border-box;
  transition: max-height 0.4s;
}
.qna input:checked + label + div { /* 내용 영역 펼침 */
  display: block;
}

h1{text-align:center;}


</style>
</head>


<body>
 <!-- 네비바 -->   
 
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
  &nbsp;&nbsp;&nbsp;
    <a class="navbar-brand" href="index.jsp" ><img src="resources/img/nav/house-fill.svg" weight=30 height=30></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            전체보기
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="home">STUDY</a></li>
            <li><a class="dropdown-item" href="info.jsp">채용정보</a></li>
            <li><a class="dropdown-item" href="faq.jsp">FAQ</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/info.js"></script>
        <script src="resources/js/scripts.js"></script>
        
<h1 id="title">**자주 묻는 질문(FAQ)**</h1>
<ul class="qna">
            <li>
                <input type="checkbox" id="qna-1">
                <label for="qna-1">코끼리는 어떤 서비스인가요?</label>
                <div>
                    <p>코끼리(코딩 초보끼리)는 코딩 스터디 모임을 갖고자 하는 사람들에게 종합적인 커뮤니케이션이 가능하도록 도와주는 서비스입니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-2">
                <label for="qna-2">홈페이지 이용방법이 궁금합니다.</label>
                <div>
                  	<p>코끼리에서는 누구든지 쉽게 익명으로 가입하여 직접 스터디를 만들 수 있고 스터디에 가입하여 활동할 수 있습니다.</p>
                    <p>배우고 싶은 언어를 선택하여 간편하게 스터디를 찾을 수 있습니다.</p>
                    <p>스터디에 가입하면 스터디원들과 게시글을 통해 소통할 수 있습니다.</p>
                    <p>스터디 정보에서 링크공유 버튼을 눌러서 링크를 복사하여 초대가 가능합니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-3">
                <label for="qna-3">스터디 탈퇴는 어떻게 하나요?</label>
                <div>
                    <p>로그인 후 홈페이지 상단 위에 마이페이지 > 스터디정보 > 탈퇴 버튼을 클릭하시면 됩니다.</p>
                    <p><a href="myPage.jsp">▶스터디정보 페이지 바로가기(클릭) </a></p>
                    <p>※탈퇴 시 유의사항</p>
                    <p>1. 스터디장일 경우에 다른 사람에게 스터디를 양도하지 않으면 스터디가 탈퇴됩니다.</p>
                    <p>2. 스터디 탈퇴 시 게시글은 자동으로 삭제됩니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-4">
                <label for="qna-4">아이디, 비밀번호를 잃어버렸습니다.</label>
                <div>
                    <p>아이디와 비밀번호 찾기는 ... 어쩌고저쩌고 (or 불가합니다.)</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-5">
                <label for="qna-5">회원 탈퇴를 하고 싶습니다.</label>
                <div>
                    <p>로그인 후 홈페이지 상단 위에 마이페이지 > 회원 탈퇴 버튼을 클릭하시면 됩니다.</p>
                    <p><a href="mypage">▶마이페이지 바로가기(클릭) </a></p>
                  </div>
            </li>
        </ul>

</body>
</html>