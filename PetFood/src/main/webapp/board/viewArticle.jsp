<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<head>
   <meta charset="UTF-8">
   
    <style>
        html, body, div, span, h1, h2, h3, p, a,  input, select, option, table, tr, th, td,search,input,textarea {
      margin: 0;padding: 0;border: 0;box-sizing: border-box; color: #333; texdt-decoration: none;}
         .wrap{max-width: 1000px; margin: 0 auto; padding: 50px;}
        .tit{text-align: center; font-size: 30px; font-weight: bold; background-color: #eefaff; padding: 50px 0; } 
        .sub_tit{text-align: center; margin-bottom: 30px; margin-top: 20px;}
        .sub_tit a{color: #fff; background-color: #5e92c6; padding: 5px 20px; display: inline-block; text-decoration: none; border-radius: 20px;}
        .sub_tit a:hover{text-decoration: underline; background-color: #5282b2;}
/*        테이블 */
        .board_write_table{width: 100%; padding: 10px; border-collapse: collapse; border-top: 2px solid #555; border-bottom: 2px solid #555;}
        .board_write_table td{padding: 10px 0; line-height: 40px; height: 40px;}
        .board_write_table tr{border-bottom: 1px solid #ccc;}
        .board_write_table tr>td:nth-child(1){width: 250px;}
        .board_write_table tr>td input{ border: 1px solid #ccc; width: 100%; height: 40px; line-height: 40px;}
        .board_write_table .txt_area{width: 100%; height: 300px; border: 1px solid #ccc; resize: none;}
        
        .board_edit{display: block;width: 100%; height: 50px; background-color: #4a4242; color: #fff; cursor: pointer;}
        .board_edit:hover{background-color: #362c2c;}
        
        .board_btns {text-align: center; margin: 30px 0;}
        /* .board_btns a{text-align: center; text-decoration: none; border-bottom: 3px solid #333; display: inline-block; margin: 0 5px; padding: 5px 10px;}
        .board_btns a:hover{border-bottom: 3px solid #5e92c6;} */
        .board_btns input{text-align: center; text-decoration: none; border-bottom: 3px solid #333; display: inline-block; margin: 0 5px; padding: 5px 10px;}
        .board_btns input:hover{border-bottom: 3px solid #5e92c6;}
    </style>
    
   <title>글보기</title>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript">
      function backToList(obj){
	    obj.action="${contextPath}/PetFoodBoard/listArticles.do";
	    obj.submit();
	  }
	 function fn_enable(obj){
		 document.getElementById("i_title").disabled=false;
		 document.getElementById("i_content").disabled=false;
		 document.getElementById("i_imageFileName").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/PetFoodBoard/modArticle.do";
		 obj.submit();
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
   <div class="wrap">
    <h1 class="tit">글 상세</h1>
	  <form name="frmArticle" method="post"   enctype="multipart/form-data">
		  <table class="board_write_table">
		  <tr>
		   <td>글번호</td>
		   <td>
		    <input type="text"  value="${article.articleNO }"  disabled />
		    <input type="hidden" name="articleNO" value="${article.articleNO}"  />
		   </td>
		  </tr>
		  <tr>
			   <td>제목</td>
			   <td><input type="text" value="${article.title }"  name="title"  id="i_title" disabled /></td>   
		  </tr>
		  <tr>
		   	<td>작성자</td>
		   	<td >
		    <input type="text" value="${article.id }" name="id"  disabled />
		   	</td>
		  </tr>
		  <tr>
		   <td>
		      내용
		   </td>
		   <td>
		    	<textarea rows="20" cols="120"  name="content"  id="i_content"  style= "resize : none;" disabled >${article.content }</textarea>
		   </td>  
		  </tr>
		 
		<c:if test="${not empty article.imageFileName && article.imageFileName!='null' }">  
		<tr>
		   <td rowspan="2">
		      이미지
		   </td>
		   <td>
		     <input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
		     <img src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" id="preview"  width="300px" height="300px"/><br>
		       
		   </td>   
		  </tr>  
		  <tr>
		    <td>
		       <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
		    </td>
		  </tr>
		 </c:if>
		  <tr>
			   <td>등록일자</td>
			   <td><input type=text value="<fmt:formatDate value="${article.writeDate}" />" disabled /></td>   
		  </tr>
		  <tr>
		   <td>조회수</td>
		   <td>
			    <input type="text"  value="${article.count }"  disabled />
			    <input type="hidden" name="count" value="${article.count}"  />
		   </td>
		  </tr>
		  
		  <c:if test="${article.id == user.userId }">
		  <tr id="tr_btn_modify"  >
			   <td colspan="2"   align="center" >
			       <input type=button value="수정하기"   onClick="fn_modify_article(frmArticle)"  >
		           <input type=button value="취소"  onClick="backToList(frmArticle)">
			   </td>   
		  </tr>
		  </c:if>
		    
		  <tr  id="tr_btn">
		   <td colspan=2 align="center">
		     <%-- <c:if test="${member.id == article.id }">
			    <input type=button value="수정하기" onClick="fn_enable(this.form)">
			    <input type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})">
			  </c:if> --%>
			  <p class="board_btns">   
				  <input type=button value="수정하기" onClick="fn_enable(this.form)">
				  <input type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/PetFoodBoard/removeArticle.do', ${article.articleNO})">
				  <input type=button value="리스트로 돌아가기"  onClick="backToList(this.form)">
				  <input type=button value="답글쓰기"  onClick="fn_reply_form('${contextPath}/PetFoodBoard/replyForm.do', ${article.articleNO})">
			  </p>
		   </td>
		  </tr>
		 </table>
	 </form>
 </div>
</body>
</html>