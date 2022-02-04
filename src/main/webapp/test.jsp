<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/pagenav.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<html>
<head>
   <title>Home</title>
   <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
   <link rel="stylesheet" href="./resources/assets/css/main.css" />
   <noscript><link rel="stylesheet" href="./resources/assets/css/noscript.css" /></noscript>
   
</head>
<style>
.disable{
   opacity: 0.3; 
   filter: alpha(opacity=30);
}
</style>
<body class="is-preload">
   <div id="wrapper">
   

   
   <%
      //로그인된 아이디가 있는지 확인
      String name=(String)session.getAttribute("namekey");
      int userNo=(Integer)session.getAttribute("userNo");
   %>
    <br /> <br />
   <div style="text-align:center">
   
   
   <select name="searchOption" id="searchOption" class="form-select" aria-label="Default select example" style="display:inline-block;width:100px;"  >
      <option value="studyName">제목</option>
      <option value="language">언어</option>
   </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



      <input type="text" class="w-25" name="searchValue" id="searchValue"style="display:inline-block;" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <button value="검색" id="searchStudyBtn" style="display:inline-block;" >검색</button>
</div>
 <br /> <br />

   <div style="text-align:center">
      <img src="./resources/img/Language/NODEJS.png" class="img disable" id="NODEJS"/>
      <img src="./resources/img/Language/PYTHON.png" class="img disable" id="PYTHON"/>
      <img src="./resources/img/Language/JAVA.png" class="img disable" id="JAVA"/>
      <img src="./resources/img/Language/JAVASCRIPT.png" class="img disable" id="JAVASCRIPT"/>
      <img src="./resources/img/Language/SPRING.png" class="img disable" id="SPRING"/>
      <img src="./resources/img/Language/KOTLIN.png" class="img disable" id="KOTLIN"/>
   </div>
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
      
   <script>
   
   </script>
   
   </div>
   
   </div>
   <!-- Scripts -->
         <script src="./resources/assets/js/jquery.min.js"></script>
         <script src="./resources/assets/js/browser.min.js"></script>
         <script src="./resources/assets/js/breakpoints.min.js"></script>
         <script src="./resources/assets/js/util.js"></script>
         <script src="./resources/assets/js/main.js"></script>

</body> 

</html>