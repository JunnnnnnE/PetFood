<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>



<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="articlesList" value="${articlesMap.articlesList}" />
<c:set var="totArticles" value="${articlesMap.totArticles}" />
<c:set var="section" value="${articlesMap.section}" />
<c:set var="pageNum" value="${articlesMap.pageNum}" />

<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<jsp:include page="../view/header.jsp"></jsp:include>
<head>

<meta charset="UTF-8">
<title>글목록창 맞나</title>
</head>
<body>

	<!-- 상단 대분류/중분류 메뉴 시작 -->
	<div class="recipyMenuBar">
		<div class="mainCategory">
			<ul>
				<li><a href="#">재료별</a></li>
				<li><a href="#">조리별</a></li>
				<li><a href="#">이벤트</a></li>
			</ul>
		</div>
		<div class="subCategory">
			<!-- 재료별 메뉴 -->
			<ul class="sub1">
				<li><a href="#">소고기</a></li>
				<li><a href="#">돼지고기</a></li>
				<li><a href="#">닭고기</a></li>
				<li><a href="#">감자</a></li>
				<li><a href="#">고구마</a></li>
				<li><a href="#">호박</a></li>
				<li><a href="#">연어</a></li>
				<li><a href="#">참치</a></li>
				<li><a href="#">당근</a></li>
				<li><a href="#">쌀/곡류</a></li>
				<li><a href="#">브로콜리</a></li>
				<li><a href="#">계란</a></li>
				<li><a href="#">사과</a></li>
			</ul>


			<!-- 조리별 메뉴 -->
			<ul class="sub2">
				<li><a href="#">굽기</a></li>
				<li><a href="#">찌기</a></li>
				<li><a href="#">삶기</a></li>
				<li><a href="#">볶기</a></li>
				<li><a href="#">비조리</a></li>
				<li><a href="#">다듬기</a></li>
				<li><a href="#">세척</a></li>
			</ul>

			<ul class="sub3">
				<li><a href="#">생일상</a></li>
				<li><a href="#">특별한날</a></li>
				<li><a href="#">영양식</a></li>
				<li><a href="#">소화기관</a></li>
				<li><a href="#">알러지</a></li>
			</ul>
			<div class="etcMenu">
				<a href="#">이번주 추천 레시피 보러가기</a>
			</div>
		</div>
		<!-- 상단 대분류/중분류 메뉴 끝 -->



<!-- 여기부터 게시글 -->
<div class="event_bar">
    <div>
    	<p>총 <em class="count">${totArticles}</em>개의 건강하고 맛있는 레시피가 등록되어 있습니다.</p>
    </div>
    <div class="wr_btn"><a href="${contextPath}/recipe/articleForm.do">글쓰기</a></div>
</div>


<div class="recipyContent">

    <c:choose>

        <c:when test="${articlesList ==null }">
            <p align="center">
                <b>등록된 글이 없습니다.</b>
            </p>
        </c:when>

<c:when test="${articlesList !=null }">
    <c:forEach var="article" items="${articlesList }" varStatus="articleNum">


<div class="posting ">
    <div class="photo"><img src="${contextPath}/download2.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}"></div>
    <div class="con">

        <div class="test">
        <p class="Number">${article.articleNO}</p>
        <p><a href="${contextPath}/recipe/viewArticle.do?articleNO=${article.articleNO}" class="re_title">${article.title }</a></p>
        </div>

                <div class="test2">
            <p>${article.id }</p>
            <p>${article.writeDate}</p>
            </div>
    </div>
</div>

</c:forEach>
</c:when>
</c:choose>


</div><!-- 전체 라인 End-->






		<!-- 하단 글 갯수 리스트 -->
<div class="bottomPaging">
		<div class="pagingMenu">
			<c:if test="${totArticles != null }">
				<c:choose>
				
					<c:when test="${totArticles >100 }">					
						<!-- 글 개수가 100 초과인경우 -->
						<c:forEach var="page" begin="1" end="10" step="1">
							<c:if test="${section >1 && page==1 }">
								<a class="no-uline"
									href="${contextPath }/recipe/listArticles.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;
									pre </a>
							</c:if>
							<a class="no-uline"
								href="${contextPath }/recipe/listArticles.do?section=${section}&pageNum=${page}">${(section-1)*10 +page }
							</a>
							<c:if test="${page ==10 }">
								<a class="no-uline"
									href="${contextPath }/recipe/listArticles.do?section=${section+1}&pageNum=${section*10+1}">&nbsp;
									next</a>
							</c:if>
						</c:forEach>
					</c:when>
					
					
					<c:when test="${totArticles ==100 }">					
						<!--등록된 글 개수가 100개인경우  -->
						<c:forEach var="page" begin="1" end="10" step="1">
							<a class="no-uline" href="#">${page } </a>
						</c:forEach>
					</c:when>
					<c:when test="${totArticles< 100 }">
					
					
						<!--등록된 글 개수가 100개 미만인 경우  -->
						<c:forEach var="page" begin="1" end="${totArticles/13 +1}"
							step="1">
							<c:choose>
								<c:when test="${page==pageNum }">
									<a class="sel-page"
										href="${contextPath }/recipe/listArticles.do?section=${section}&pageNum=${page}">${page }
									</a>
								</c:when>
								<c:otherwise>
									<a class="no-uline"
										href="${contextPath }/recipe/listArticles.do?section=${section}&pageNum=${page}">${page }
									</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
				</c:choose>
			</c:if>
		</div>
		</div>
		
</body>
</html>