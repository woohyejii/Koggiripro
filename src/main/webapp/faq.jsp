<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%> 
<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
       <!-- SEO Meta Tags -->
    <meta name="description"
        content="Tivo is a HTML landing page template built with Bootstrap to help you crate engaging presentations for SaaS apps and convert visitors into users.">
    <meta name="author" content="Inovatik">
   <link rel="stylesheet" href="./resources/assets/css/main.css" />
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700&amp;display=swap&amp;subset=latin-ext"
        rel="stylesheet">
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <link href="resources/css/fontawesome-all.css" rel="stylesheet">
    <link href="resources/css/swiper.css" rel="stylesheet">
    <link href="resources/css/magnific-popup.css" rel="stylesheet">
    <link href="resources/css/styles.css" rel="stylesheet">
    <title>스터디</title>
</head>
<body data-spy="scroll" data-target=".fixed-top">
     <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
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
                        <a class="nav-link page-scroll active" href="index.jsp">HOME <span
                                class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="home">스터디</a>
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
    
    
    <!-- Header -->
    <header id="header" class="ex-header">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>ㅇㅋㅇㅋ</h1>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->
    
    
    <!-- Breadcrumbs (홈-현재페이지)-->
    <div class="ex-basic-1">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumbs">
                        <a href="index.html">Home</a><i class="fa fa-angle-double-right"></i><span>스터디</span>
                    </div> <!-- end of breadcrumbs -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of ex-basic-1 -->
    <!-- end of breadcrumbs -->
    <br /> <br />


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
                  	<p>코끼리에서는 누구든지 쉽게 익명으로 가입하여 직접 스터디를 만들 수 있고 스터디에 가입하여 활동할 수 있습니다.
                    <br>배우고 싶은 언어를 선택하여 간편하게 스터디를 찾을 수 있습니다.
                    <br>스터디에 가입하면 스터디원들과 게시글을 통해 소통할 수 있습니다.
                    <br>스터디 정보에서 링크공유 버튼을 눌러서 링크를 복사하여 초대가 가능합니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-3">
                <label for="qna-3">스터디 탈퇴는 어떻게 하나요?</label>
                <div>
                    <p>로그인 후 홈페이지 상단 위에 마이페이지 > 스터디정보 > 탈퇴 버튼을 클릭하시면 됩니다.
                    
                    <br><br>※탈퇴 시 유의사항
                    <br>1. 스터디장일 경우에 가입한 다른 회원이 있다면 다른 사람에게 스터디를 양도하지 않으면 스터디가 탈퇴됩니다.
                    <br>2. 스터디 탈퇴 시 게시글과 댓글은 자동으로 삭제됩니다.
                    
                    <br><br><a href="javascript:void(0);" onclick="javascript:frm.submit();">▶스터디정보 페이지 바로가기(클릭) </a></p>
                </div>
            </li>
            
            <!-- 스터디 조회 페이지 이동 -->
			<form action="mystudyinfo" method="post" name="frm">
			<input type="hidden" name="userNo" value=${userNo}>
			</form>
			
			
            <li>
                <input type="checkbox" id="qna-4">
                <label for="qna-4">아이디, 비밀번호를 잃어버렸습니다.</label>
                <div>
                    <p>아이디와 비밀번호 찾기는 로그인 페이지에서 가능합니다. 
                    <br>어쩌고 저쩌고</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-5">
                <label for="qna-5">회원 탈퇴를 하고 싶습니다.</label>
                <div>
                    <p>로그인 후 홈페이지 상단 위에 마이페이지 > 회원 정보 > 현재 비밀번호 입력 후 
                    <br>회원 탈퇴 버튼을 클릭하시면 됩니다.
                    <br><a href="mypage">▶마이페이지 바로가기(클릭) </a></p>
                  </div>
            </li>
        </ul>
 <!-- Breadcrumbs (홈-현재페이지)-->
    <div class="ex-basic-1">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumbs">
                        <a href="index.html">Home</a><i class="fa fa-angle-double-right"></i><span>스터디</span>
                    </div> <!-- end of breadcrumbs -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of ex-basic-1 -->
    <!-- end of breadcrumbs -->


    <!-- Footer -->
    <svg class="ex-footer-frame" data-name="Layer 2" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none"
        viewBox="0 0 1920 79">
        <defs>
            <style>
                .cls-2 {
                    fill: #185ADB;
                }
            </style>
        </defs>
        <title>footer-frame</title>
        <path class="cls-2"
            d="M0,72.427C143,12.138,255.5,4.577,328.644,7.943c147.721,6.8,183.881,60.242,320.83,53.737,143-6.793,167.826-68.128,293-60.9,109.095,6.3,115.68,54.364,225.251,57.319,113.58,3.064,138.8-47.711,251.189-41.8,104.012,5.474,109.713,50.4,197.369,46.572,89.549-3.91,124.375-52.563,227.622-50.155A338.646,338.646,0,0,1,1920,23.467V79.75H0V72.427Z"
            transform="translate(0 -0.188)" />
    </svg>
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="footer-col first">
                        <h4>About Tivo</h4>
                        <p class="p-small">We're passionate about offering some of the best business growth services for
                            start more words</p>
                    </div>
                </div> <!-- end of col -->
                <div class="col-md-4">
                    <div class="footer-col middle">
                        <h4>Important Links</h4>
                        <ul class="list-unstyled li-space-lg p-small">
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">Our business partners <a class="white"
                                        href="#your-link">startupguide.com</a></div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">Read our <a class="white" href="terms-conditions.html">Terms &
                                        Conditions</a>, <a class="white" href="privacy-policy.html">Privacy Policy</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div> <!-- end of col -->
                <div class="col-md-4">
                    <div class="footer-col last">
                        <h4>Contact</h4>
                        <ul class="list-unstyled li-space-lg p-small">
                            <li class="media">
                                <i class="fas fa-map-marker-alt"></i>
                                <div class="media-body">22 Innovative, San Francisco, CA 94043, US</div>
                            </li>
                            <li class="media">
                                <i class="fas fa-envelope"></i>
                                <div class="media-body"><a class="white"
                                        href="mailto:contact@Tivo.com">contact@Tivo.com</a> <i
                                        class="fas fa-globe"></i><a class="white" href="#your-link">www.Tivo.com</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of footer -->
    <!-- end of footer -->


    <!-- Copyright -->
    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p class="p-small">Copyright © 2020 <a href="https://inovatik.com">Template by Inovatik</a></p>
                </div> <!-- end of col -->
            </div> <!-- enf of row -->
        </div> <!-- end of container -->
    </div> <!-- end of copyright -->
    <!-- end of copyright -->
   <!-- Scripts -->
         <script src="./resources/assets/js/jquery.min.js"></script>
         <script src="./resources/assets/js/browser.min.js"></script>
         <script src="./resources/assets/js/breakpoints.min.js"></script>
         <script src="./resources/assets/js/util.js"></script>
         <script src="./resources/assets/js/main.js"></script>
		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		 <script src="http://code.jquery.com/jquery-latest.min.js"></script>  
    	 <script src="resources/js/popper.min.js"></script> <!-- Popper tooltip library for Bootstrap -->
    	 <script src="resources/js/bootstrap.min.js"></script> <!-- Bootstrap framework -->
    	 <script src="resources/js/jquery.easing.min.js"></script> <!-- jQuery Easing for smooth scrolling between anchors -->
     	 <script src="resources/js/swiper.min.js"></script> <!-- Swiper for image and text sliders -->
    	 <script src="resources/js/jquery.magnific-popup.js"></script> <!-- Magnific Popup for lightboxes -->
    	 <script src="resources/js/validator.min.js"></script> <!-- Validator.js - Bootstrap plugin that validates forms -->
    	 <script src="resources/js/scripts.js"></script> <!-- Custom scripts -->
</body>
</html>