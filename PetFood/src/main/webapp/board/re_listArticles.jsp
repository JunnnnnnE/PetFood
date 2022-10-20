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
<head>

<style>
.card {
	width: 200px;
	height: 400px;
	padding-right: 10px;
}

.no-uline {
	text-decoration: none;
}

.sel-page {
	text-decoration: none;
	color: red;
}

.cls1 {
	text-decoration: none;
}

.cls2 {
	text-align: center;
	font-size: 30px;
	clear: both;
}

.right-good {
	float: left;
}

.size-test {
	width: 180px;
	height: 150px;
	margin: 10px auto;
}

.size-test img {
	width: 180px;
	height: 150px;
}

.all_line {
	border: 1px solid red;
	width: 1000px;
	height: 1200px;
	margin: 0 auto;
}
</style>
<meta charset="UTF-8">
<title>글목록창</title>
</head>
<body>


	<div class="all_line">

		<c:choose>
			<c:when test="${articlesList ==null }">
				<p align="center">
					<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
				</p>
			</c:when>
			<c:when test="${articlesList !=null }">
				<c:forEach var="article" items="${articlesList }"
					varStatus="articleNum">


					<div class="row row-cols-4 row-cols-md-3 g-10 ">
						<div class="col right-good" style="border: 1px solid grey;">
							<div class="card text-center " style="border: 1px solid aqua;">


								<div class="size-test" style="border: 1px solid red">
									<img
										src="${contextPath}/download2.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}"
										id="preview" />
								</div>
								<div class="card-body">
									<h5 class="card-title">${article.articleNO}</h5>
									<p>${article.id }</p>
									<p class="card-text">

										
												<a href="${contextPath}/recipe/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
											

									</p>
								</div>
								<div class="card-footer">
									<small class="text-muted">${article.writeDate}</small>
								</div>
							</div>
						</div>
					</div>



				</c:forEach>
			</c:when>





		</c:choose>



	</div>



	<div class="cls2">
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
					<c:forEach var="page" begin="1" end="${totArticles/10 +1}" step="1">
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
	<br>
	<br>
	<a href="${contextPath}/recipe/articleForm.do">글쓰기</a>
</body>
</html>