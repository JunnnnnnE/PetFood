<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>임시 index</title>
    <script src="../assets/js/jquery-3.6.0.min.js"></script>
    <script src="../assets/js/jquery-1.12.4.min.js"></script>
    <script src="../assets/js/jquery.sliphover.min.js"></script>
    <link rel="stylesheet" href="../assets/css/reset.css">
    <link rel="stylesheet" href="../assets/css/top.css">
    <link href="https://www.cssscript.com/demo/sticky.css" rel="stylesheet" type="text/css">
	<link rel='stylesheet' type='text/css' media='screen' href='../assets/css/main.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='../assets/css/slider.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='../assets/css/settings.css'>
</head>

<body>

    <!-- 헤더 시작 -->
    <header>
        <div class="h_topBanner">
            <p><span class="top_img"><img src="../assets/images/talk_icon.png" alt="이벤트" width="35" height="30"></span>제 1회<span> 개밥멍선생</span> 레시피 공모전 이벤트! 채소를 이용한 나만의 레시피를 소개해주세요!<span  class="top_img"> <img src="../assets/images/arrow_icon.png" alt="" width="20" height="20"></span></p>
            <div class="h_topBar">
                <div class="h_topQuickMenu">
                    <ul>
                        <li><a href="#">로그인</a></li>
                        <li><a href="#">회원가입</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
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
                        <div class="w_btn"><img src="../assets/images/w_icon.png"></div>
                        <div class="h_search">
                            <input type="text" placeholder="#생일상 #브로콜리 #당근">
                            <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
                        </div>
                    </div>
                </nav>

            </div>
        </div>


    </header>
    <!-- 헤더끝 -->


<!--바디 시작-->

<main>

    <div class="slider" id="sliderBody">
        <button id="btnPrev">🢐</button>
        <button id="btnNext">🢒</button>
        <div class="slide slide1">1</div>
        <div class="slide slide2">2</div>
        <div class="slide slide3"><img src="https://cdn.imweb.me/upload/S201910012ff964777e0e3/62f9a36ea3cea.jpg" width="100%" height="100%" ></div>
        <div class="slider-navbar" id="sliderNavbar"></div>
    </div>
    <div id="settingsBoard">
        <label for="switchTimer">Autoplay</label>
        <button state="on" id="switchTimer">
            <span id="switchTimerBuble"></span>
        </button>
    </div>
</main>


<script src='../assets/js/slider_main.js'></script>
<script src='../assets/js/slider_bar.js'></script>
<script src='../assets/js/slider_swipe.js'></script>
<script src="../assets/js/slider_settings.js"></script>
<script>
try {
fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", { method: 'HEAD', mode: 'no-cors' })).then(function(response) {
return true;
}).catch(function(e) {
var carbonScript = document.createElement("script");
carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CE7DC2JW&placement=wwwcssscriptcom";
carbonScript.id = "_carbonads_js";
document.getElementById("carbon-block").appendChild(carbonScript);
});
} catch (error) {
console.log(error);
}
</script>
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-46156385-1', 'cssscript.com');
ga('send', 'pageview');

</script>






</body></html>