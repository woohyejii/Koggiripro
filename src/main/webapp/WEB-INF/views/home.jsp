<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
   <style>
		.disable{
   		opacity: 0.3; 
   		filter: alpha(opacity=30);
		}
	</style>
   
   <title>스터디</title>
</head>
<body data-spy="scroll" data-target=".fixed-top">
   <div id="wrapper">
   
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
   
      <!-- Privacy Content (검색-언어)-->
    <div class="ex-basic-2">
        <div class="container">
            <div class="row" style="text-align: center;">
                <div style="text-align:center">
                        <select name="searchOption" id="searchOption" class="form-select"
                        aria-label="Default select example" style="display:inline-block;width:100px;">
                        <option value="studyName">제목</option>
                        <option value="language">언어</option>
                    </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" class="w-25" name="searchValue" id="searchValue"
                        style="display:inline-block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button value="검색" id="searchStudyBtn" style="display:inline-block;">검색</button>
                    <br><br><br><br>
                <img src="resources/images/java01.png" class="img disable" class="rounded float-start" id="JAVA"/>
                <img src="resources/images/node.js04.png" class="img disable" class="rounded float-end" id="NODEJS"/>
                <img src="resources/images/spring06.png" class="img disable" class="rounded float-start"  id="SPRING"/>
                <img src="resources/images/python05.png" class="img disable" class="rounded float-end" id="PYTHON"/>
                <img src="resources/images/kotlin03.png" class="img disable" class="rounded float-end" id="JAVASCRIPT"/>
                <img src="resources/images/javascript02.png" class="img disable" class="rounded float-end" id="KOTLIN"/>              
                </div><!-- 검색-->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of ex-basic-2 -->
    <!-- end of privacy content -->

   <hr />
   <div style="float:right;margin:50px;">
     <%if(name!=null){ %>
      <button id="insertStudy" onclick="location.href='newStudyForm?userNo=${userNo}';">스터디 생성</button>
     <%}%>
     </div>
   
   <script>
   
      //스터디 정보 보여주기
      function show(StudyData){
         
         let str=""

         let count = 0;
         let list = StudyData.datas;
         $(list).each(function(index, obj){
            str +=`<div onclick="location.href='studyDetail?studyNo=` + obj.studyNo + `';">`
            str +=obj.studyName;
            str +=obj.language;
            str +=obj.nowPeopleNum +"/"+ obj.maxPeopleNum;
            str +="<br />"
            str +="</div>"
            count++;
         });
         if(count==0) str = "검색된 스터디가 없습니다."
         $("#showStudy").html(str);
      }
   
   
      //var path = "./resources/img/Language/JAVA.jpg" + "?" +Date.now();
      //$("#JAVA").attr('src', path);
   
      //스터디 검색 버튼
      $("#searchStudyBtn").click(function(){
         if ($("#searchValue").val()==""){
            alert('검색어를 입력해주세요.');
         }
         else{
            $("#showStudy").empty();
            let str=""
            $.ajax({
               type:"get",
               url:"searchStudy?searchOption="+$('#searchOption option:selected').val()+ "&searchValue="+$('#searchValue').val(),
               dataType:"json",
               success:function(StudyData){
                  show(StudyData)
               },
               error:function(){
                  alert("searchStudyBtn click error")
                  $("#showStudy").text("에러");
               }
            })
            
            $(".img").each(function (index, item) {
               $(this).removeClass("able");
                $(this).addClass("disable");
            });   
            
            $(this).addClass("disable");
            langList.splice(0,langList.length);
            console.log(langList);
            
         }

/*          $.ajax({
            type:"get",
            url:"searchStudy?searchOption="+$('#searchOption option:selected').val()+ "&searchValue="+$('#searchValue').val(),
            dataType:"json",
            success:function(StudyData){
               console.log(StudyData);
               let count = 0;
               let list = StudyData.datas;
               console.log(list);
               $(list).each(function(index, obj){
                  str += obj.studyName;
                  str +=obj.language;
                  str +=obj.nowPeopleNum +"/"+ obj.maxPeopleNum;
                  str +="<br />"
                  count++;
               });
               if(count==0) str = "검색된 스터디가 없습니다."
               $("#showStudy").html(str);
            },
            error:function(){
               alert("searchStudyBtn click error")
               $("#showStudy").text("검색된 스터디가 없습니다.");
            }
         }) */
      });

      let langList = new Array();
      $(".img").click(function(){//이미지를 클릭했을때
         
         $("#searchValue").val('');
         
         var name =$(this).attr("id");
         if($(this).hasClass("able")){
            $(this).removeClass("able");
            $(this).addClass("disable");
            langList.splice(langList.indexOf(name),1);

         }
         else{
            $(this).addClass("able");
            $(this).removeClass("disable");
            langList.push(name);
         }
         
         if (langList.length != 0){
            let str=""
            $.ajax({
               type:"post",
               url:"imgBtnClick",
               dataType:"json",
               data:{
                  "langList":langList,
               },
               success:function(StudyData){
                  show(StudyData)
               },
               error:function(){
                  alert("버튼을 클릭해주세요.");
                  $("#showStudy").text("검색된 스터디가 없습니다.");
               }
            })
         }else{
            let str=""
            $.ajax({
               type:"get",
               url:"imgBtnClick",
               dataType:"json",
               success:function(StudyData){
                  show(StudyData)
               },
               error:function(){
                  alert("버튼을 클릭해주세요.");
                  $("#showStudy").text("검색된 스터디가 없습니다.");
               }
            })
         }

         
      });
      
   </script>
   
   <div id="showStudy">
         <c:choose>
         <c:when test="${size  eq 0}">
            <div class="totalStudy">
               검색된 스터디가 없습니다.
            </div>
         </c:when>
         <c:otherwise>               
               <!-- Main -->
                  <div id="main">
                     <div class="inner">
                        <section class="tiles">
                     
                        
                           <%-- <c:forEach var="tmp" items="${study}"  varStatus="status">
                           
                                    <article class="style${status.index%6+1}"> <script></script>
                                       <span class="image">
                                          <img src="./resources/images/pic0${status.index%6+1}.jpg" alt="" />
                                       </span>
                                       <a href="studyDetail?studyNo=${tmp.studyNo}">
                                          <h2>${tmp.studyName }</h2>
                                          <div class="content">
                                             ${tmp.language }
                                             <br/>
                                             인원: ${tmp.nowPeopleNum }/${tmp.maxPeopleNum }
                                       
                                       </div></a>
                                    </article>
                           </c:forEach>          --%>
                           
                           
                           <c:choose>                                                      
                               <c:when test="${fn:length(study) == 0}">
                                      조회결과가 없습니다.
                               </c:when>
                               <c:otherwise>
                                   <c:forEach var="tmp" items="${study}"  varStatus="status">
                                    <article class="style${status.index%6+1}"> <script></script>
                                       <span class="image">
                                          <img src="./resources/images/pic0${status.index%6+1}.jpg" alt="" />
                                       </span>
                                       <a href="studyDetail?studyNo=${tmp.studyNo}">
                                          <h2>${tmp.studyName }</h2>
                                          <div class="content">
                                             ${tmp.language }
                                             <br/>
                                             인원: ${tmp.nowPeopleNum }/${tmp.maxPeopleNum }
                                       
                                       </div></a>
                                    </article>
                                 </c:forEach>   
                               </c:otherwise> 
                           </c:choose>
                        </section>
                     </div>
                  </div>
        </c:otherwise>
      </c:choose>
   </div>
   
   </div>
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