<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="recipes" value="${recipeArticles}" />
<c:set var="imgPath" value="C:/board/recipe_image/" />

<html>
<jsp:include page="header.jsp"></jsp:include>


<div id="carouselExampleIndicators" class="carousel slide test00 h-30"
	data-bs-ride="carousel">
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#carouselExampleIndicators"
			data-bs-slide-to="0" class="active" aria-current="true"
			aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators"
			data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators"
			data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img
				src="http://hohk.dothome.co.kr/load/data/kt180401/166662296824983200.png"
				class="d-block " alt="...">
		</div>
		<div class="carousel-item">
			<img
				src="http://hohk.dothome.co.kr/load/data/kt180401/166662854954777184.jpg"
				class="d-block " alt="...">
		</div>
		<div class="carousel-item">
			<img
				src="http://hohk.dothome.co.kr/load/data/kt180401/166662962517025088.jpg"
				class="d-block " alt="...">
		</div>
	</div>
	<button class="carousel-control-prev" type="button"
		data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>
</div>


<c:if test="${recipeArticles == null }">
	<c:redirect url="../recipe/setMainPage.do" />
</c:if>
<!-- 컨텐츠01 -->
<div class="mainContent">
	<ul class="mainTopIcon">
		<li><a href=""><img src="../assets/images/01.svg" alt=""><br>껌</a></li>
		<li><a href=""><img src="../assets/images/02.svg" alt=""><br>비스켓</a></li>
		<li><a href=""><img src="../assets/images/03.svg" alt=""><br>건조</a></li>
		<li><a href=""><img src="../assets/images/04.svg" alt=""><br>음료</a></li>
		<li><a href=""><img src="../assets/images/05.svg" alt=""><br>간편식</a></li>
		<li><a href=""><img src="../assets/images/06.svg" alt=""><br>저키</a></li>
		<li><a href=""><img src="../assets/images/07.svg" alt=""><br>생식</a></li>
		<li><a href=""><img src="../assets/images/08.svg" alt=""><br>소시지</a></li>
		<li><a href=""><img src="../assets/images/09.svg" alt=""><br>영양식</a></li>
		<li><a href=""><img src="../assets/images/10.svg" alt=""><br>이유식</a></li>
	</ul>

	<div class="mainContent_01">
		<div class="con01_title">
			<p>New</p>
			<p>Recipe</p>
			<p>새로 등록된 레시피를 확인해보세요</p>
			<p>
				<a href="">전체보기 <img src=".." alt="" width="14" height="14"></a>
			</p>
		</div>
			
			<c:forEach var="recipe" items="${recipes }">
			<div class="con01_recipe">
				<a href="${contextPath}/recipe/viewArticle.do?articleNO=${recipe.articleNO}"
					display=block>
					<div class="con01_img">
						<input type="hidden" name="originalFileName" value="${recipe.imageFileName }" /> 
						<img src="${contextPath}/download2.do?articleNO=${recipe.articleNO}&imageFileName=${recipe.imageFileName}"
							id="preview" width="220" height="150" /> 
					</div>
					<p class="title"> ${recipe.title }</p>
				</a>
			</div>
		</c:forEach>
	</div>

</div>
<!--mainContent 끝-->




<!-- mainContent02 시작-->
<div class="mainContent_02">
	<div class="mainContent02_con">
		<div class="mainContent02_img">
			<img src="../assets/images/con2_01.png" alt="" width="350"
				height="350">
		</div>

		<div>
			<div class="mainContent02_title">
				서늘한 바람이 솔솔~<br>가을에 딱 맞는 추천 랭킹 레시피
			</div>
			<p>
				<img src="../assets/images/con2_02.png" alt="" width="250"
					height="230">
			</p>
			<p>
				<img src="../assets/images/con2_03.png" alt="" width="250"
					height="230">
			</p>
			<p>
				<img src="../assets/images/con2_04.png" alt="" width="250"
					height="230">
			</p>

		</div>
	</div>
</div>
<!-- mainContent02 시작-->



<!-- mainContent03 시작 -->

<div class="mainContent_03">
	<div class="mainContent_03_banner">
		<img src="../assets/images/banner01.jpg" alt="" width="580">
	</div>
	<div class="mainContent_03_banner">
		<img src="../assets/images/banner02.jpg" alt="" width="580">
	</div>
</div>

<!-- mainContent03 끝 -->

<!-- mainContent04 시작 -->
<div class="mainContent_04">
	<h3>똥손도 만들 수 있는 난이도 ⭐별 한개짜리 레시피</h3>
	<div class="minRecipe">
		<div class="img">
			<img src="../assets/images/con4_01.jpg" alt="" width="130"
				height="130">
		</div>
		<h6>고구마 우유 개껌</h6>
		<p>
			고구마, 우유, 건조기만 있으면 수제 간식 뚝딱!<br>재료: 락토프리 우유 1L, 한천가루 15g, 으깬고구마
			1줌
		</p>
	</div>
	<div class="minRecipe">
		<div class="img">
			<img src="../assets/images/con4_02.jpg" alt="" width="130"
				height="130">
		</div>
		<h6>고구마 바나나 치킨 마들렌</h6>
		<p>
			식사대용으로도 줄 수 있는 든든한 간식!<br>재료: 바나나 3개, 고구마 1개, 닭 안심 10개
		</p>
	</div>
	<div class="minRecipe">
		<div class="img">
			<img src="../assets/images/con4_03.jpg" alt="" width="130"
				height="130">
		</div>
		<h6>강아지와 함께 먹는 단호박 돼지고기 찜</h6>
		<p>
			쌀쌀한 날씨에 몸보신 시켜주기 딱 좋은 메뉴!<br>노견이나 소화기관이 약한 아이에게 좋아요.
		</p>
	</div>
	<div class="minRecipe">
		<div class="img">
			<img src="../assets/images/con4_04.jpg" alt="" width="130"
				height="130">
		</div>
		<h6>강아지 전용 보쌈세트</h6>
		<p>
			닭가슴살과 배추, 토마토를 이용한 보쌈 세트!<br>부드러운 식감으로 이빨이나 턱관절이 약한 아이도 부담없는 식사를
			즐길 수 있습니다.
		</p>
	</div>
</div>
<!-- mainContent04 끝 -->






<jsp:include page="footer.jsp"></jsp:include>
<html>