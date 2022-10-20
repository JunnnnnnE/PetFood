<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<jsp:include page="header.jsp"></jsp:include>


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