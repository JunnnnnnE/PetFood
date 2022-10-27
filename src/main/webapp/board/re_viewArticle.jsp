<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<jsp:include page="../view/header.jsp"></jsp:include>
<head>
   <meta charset="UTF-8">
   <title>상세글보기</title>
   <style>
     #tr_btn_modify_re{
       display:none;
     }
     body{background:url("http://hohk.dothome.co.kr/load/data/kt180401/166687951057718112.png")}
   
   </style>
<!--    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>  -->
   <script type="text/javascript" >
     
     function backToList(tt){
    	 tt.action="${contextPath}/recipe/listArticles.do";
    	 tt.submit();
     }
     	 
	 function ttest(tt){
 		 document.getElementById("i_title_re").disabled=false;	
		 document.getElementById("i_content_re").disabled=false;
		 document.getElementById("i_imageFileName_re").disabled=false; 
		 document.getElementById("tr_btn_modify_re").style.display="block"; 
 		 document.getElementById("tr_btn_re").style.display="none"; 
	 }
	 
	 	 function tt_modify_article(tt){
		 tt.action="${contextPath}/recipe/modArticle.do";
		 tt.submit();
	 } 
	 
	 
	 function fn_remove_article(url,articleNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","hidden");
	     articleNOInput.setAttribute("name","articleNO");
	     articleNOInput.setAttribute("value", articleNO);
		 
	     form.appendChild(articleNOInput);
	     document.body.appendChild(form);
		 form.submit();	 
	 }
	 
	 
	 
	 function readURL(input) {
	     if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         reader.onload = function (e) {
	             $('#preview').attr('src', e.target.result);
	         }
	         reader.readAsDataURL(input.files[0]);
	     }
	 }  
 </script>
</head>
<body>


	<!-- 상단 대분류/중분류 메뉴 시작 -->
	<div class="recipyMenuBar" style="background-color:#fff;">
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

		</div>
	</div>
	<!-- 상단 대분류/중분류 메뉴 끝 -->











<div class="contentRecipe">
  <form name="recipe_con" method="post" action="${contextPath}"  enctype="multipart/form-data">

<div class="topTitle">



				
    <em><input type="text"  value="No. ${article.articleNO }"  disabled /></em><br>
    <input type="hidden" name="articleNO" value="${article.articleNO}"  />
    <p><input type=text value="${article.id }" name="writer"  disabled /></p>
    <h3><input type=text value="${article.title }"  name="title" id="i_title_re" disabled="true"></h3>
</div>


<c:if test="${not empty article.imageFileName && article.imageFileName!='null' }">  
     <input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
    <img src="${contextPath}/download2.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" id="preview"  class="contentImg" /><br>
       <input  type="file"  name="imageFileName " id="i_imageFileName_re"   disabled   onchange="readURL(this);"   />
 </c:if>

    <textarea rows="20" cols="60"  name="content"  id="i_content_re"  disabled  class="contentC">${article.content }</textarea>

 
 
 <!-- 이미지 -->
<%-- <c:if test="${not empty article.imageFileName && article.imageFileName!='null' }">  
     <input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
    <img src="${contextPath}/download2.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" id="preview"  class="contentImg" /><br>
       <input  type="file"  name="imageFileName " id="i_imageFileName_re"   disabled   onchange="readURL(this);"   />
 </c:if> --%>




	    <input type=text value="<fmt:formatDate value="${article.writeDate}" />" disabled class="date"/>

  
  <table>
  <tr id="tr_btn_modify_re" >
	   <td >
	       <input type=button value="수정반영"  onClick="tt_modify_article(recipe_con)"  >
         <input type=button value="취소"  onClick="backToList(recipe_con)">
	  </td>   
  </tr>
    
  <tr id="tr_btn_re" >
   <td>
   		<input type=button value="수정" onClick="ttest(this.form);">
	    <input type=button value="삭제" onClick="fn_remove_article('${contextPath}/recipe/removeArticle.do', ${article.articleNO})">
	    <input type=button value="목록으로"  onClick="backToList(this.form)">
   </td>
  </tr>
 </table>
 </form>
 </div>
<jsp:include page="../view/footer.jsp"></jsp:include>
</html>