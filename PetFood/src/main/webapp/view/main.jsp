<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<jsp:include page="header.jsp"></jsp:include>


<div id="carouselExampleIndicators" class="carousel slide test00 h-30" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="http://hohk.dothome.co.kr/load/data/kt180401/166654406749161600.jpg" class="d-block " alt="...">
    </div>
    <div class="carousel-item">
      <img src="http://hohk.dothome.co.kr/load/data/kt180401/166654406095696320.jpg" class="d-block " alt="...">
    </div>
    <div class="carousel-item">
      <img src="http://hohk.dothome.co.kr/load/data/kt180401/166654405377077504.jpg" class="d-block " alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>



<!-- 컨텐츠01 -->
    <div class="mainContent">
        <ul class="mainTopIcon">
            <li><a href=""><img src="../assets/images/01.svg" alt=""><br>저키/트릿</a></li>
            <li><a href=""><img src="../assets/images/02.svg" alt=""><br>비스켓</a></li>
            <li><a href=""><img src="../assets/images/03.svg" alt=""><br>소시지</a></li>
            <li><a href=""><img src="../assets/images/04.svg" alt=""><br>건조</a></li>
            <li><a href=""><img src="../assets/images/05.svg" alt=""><br>음료</a></li>
            <li><a href=""><img src="../assets/images/06.svg" alt=""><br>시리얼</a></li>
            <li><a href=""><img src="../assets/images/07.svg" alt=""><br>수제간식</a></li>
            <li><a href=""><img src="../assets/images/08.svg" alt=""><br>아몰라</a></li>
            <li><a href=""><img src="../assets/images/09.svg" alt=""><br>뭐써야돼</a></li>
            <li><a href=""><img src="../assets/images/09.svg" alt=""><br>메뉴하나더</a></li>
        </ul>

        <div class="mainContent_01">
            <div class="con01_title">
                <p>New</p>
                <p>Recipe</p>
                <p>새로 등록된 레시피를 확인해보세요</p>
                <p><a href="">전체보기 <img src=".." alt="" width="14" height="14"></a></p>                
            </div> 
            <div class="con01_recipe">           
               <div class="con01_img"></div>
               <p>당근케이스 찹찹</p>
            </div>
            <div class="con01_recipe">           
                <div class="con01_img"></div>
                <p>당근케이스 찹찹</p>
             </div>
             <div class="con01_recipe">           
                <div class="con01_img"></div>
                <p>당근케이스 찹찹</p>
             </div>
             <div class="con01_recipe">           
                <div class="con01_img"></div>
                <p>당근케이스 찹찹</p>
             </div>           
        </div>        
    
    </div>
    <!--mainContent 끝-->






<jsp:include page="footer.jsp"></jsp:include>
<html>