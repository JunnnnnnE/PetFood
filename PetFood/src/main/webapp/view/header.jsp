<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개밥멍선생 : 소중한 반려견을 위한 건강한 레시피</title>
    <link rel="stylesheet" href="../assets/css/reset.css">
    <script src="../assets/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../assets/css/top.css?after">
    <link rel="stylesheet" href="../assets/css/bottom.css?after">
    <link rel="stylesheet" href="../assets/css/content_recipy.css?after">
    <link rel="stylesheet" href="../assets/css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>

<body>

    <!-- 헤더 시작 -->
           <header>
        <div class="h_topBanner">
            <p><span class="top_img"><img src="../assets/images/talk_icon.png" alt="이벤트" width="35" height="30"></span>제 1회<span> 개밥멍선생</span> 레시피 공모전 이벤트! 채소를 이용한 나만의 레시피를 소개해주세요!<span  class="top_img"> <img src="../assets/images/arrow_icon.png" alt="" width="20" height="20"></span></p>
            <div class="h_topBar">
                <div class="h_topQuickMenu">
               <c:choose>
                   <c:when test="${user ==null }" >
                          <ul>
                              <li><a href="../login.jsp">로그인</a></li>
                              <li><a href="#">회원가입</a></li>
                              <li><a href="#">고객센터</a></li>
                          </ul>
                      </c:when>
                   <c:when test="${user !=null }" >
                          <ul>
                              <li><a href="#">"${user.userName}" 님 환영합니다</a></li>
                              <li><a href="#">고객센터</a></li>
                          </ul>
                      </c:when>
                  </c:choose>
                </div>
                <nav>
                    <ul class="menu">
                        <li><a href="#">🍳 모두의 레시피</a></li>
                        <li><a href="#">명예의 전당</a></li>
                        <li><a href="#">커뮤니티</a></li>
                        <li><a href="#">이벤트</a></li>
                    </ul>
                    <div id="logo">
                        <img src="../assets/images/logo.png" alt="개밥멍선생" width="198" height="88">
                    </div>
                    <div class="h_right">
                       <form action="${contextPath}/PetFood/PetFoodBoard/SearchBoardList.do" method="post">
                       
                           <div class="h_search">
                               <input type="text" placeholder="#생일상 #브로콜리 #당근"  name="searchKeyword" class="s_input">                               
                               <input type="submit" value="" class="s_btn">
                           </div>
                        </form>
                    </div>
                </nav>

            </div>
        </div>


    </header>
    <!-- 헤더끝 -->

