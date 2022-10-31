<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<head>
<jsp:include page="../view/header.jsp"></jsp:include>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	function backToList(obj) {
		obj.action = "${contextPath}/recipe/listArticles.do";
		obj.submit();
	}
</script>
<title>새글 쓰기 창</title>
</head>
<body>


	<div class="contentRecipe_w">
		<form name="articleForm" method="post" action="${contextPath}/recipe/addArticle.do"	 enctype="multipart/form-data">

			<p>나만의 멋진 레시피를 작성해주세요. ex) 강아지도 좋아하는 건강식~</p>
			<input type="text" size="67" maxlength="500" name="title"
				value="제목입력" class="formtitle" />
			<div class="contentCW">
			<textarea name="content" rows="10" cols="65" maxlength="4000"
				value="글입력"></textarea>
			</div>
			<input type="file" name="imageFileName" onchange="readURL(this);"
				class="file_upload" />
			<!--<td><img  id="preview" src="#"   width=200 height=200/></td>-->
			<div class="formBtn">
				<input type="submit" value="글쓰기" /> <input type=button value="목록보기"
					onClick="backToList(this.form)" />
			</div>
		</form>
	</div>




	<jsp:include page="../view/footer.jsp"></jsp:include>
</html>
