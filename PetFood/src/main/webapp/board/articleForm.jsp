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
<meta charset="UTF-8">

<style>
/*         html, body, div, span, h1, h2, h3, p, a,  input, select, option, table, tr, th, td,search,input,textarea {
      margin: 0;padding: 0;border: 0;box-sizing: border-box; color: #333; texdt-decoration: none;}
         .wrap{max-width: 1000px; margin: 0 auto; padding: 50px;}
        .tit{text-align: center; font-size: 30px; font-weight: bold; background-color: #eefaff; padding: 50px 0; } 
        .sub_tit{text-align: center; margin-bottom: 30px; margin-top: 20px;}
        .sub_tit a{color: #fff; background-color: #5e92c6; padding: 5px 20px; display: inline-block; text-decoration: none; border-radius: 20px;}
        .sub_tit a:hover{text-decoration: underline; background-color: #5282b2;}
/*        테이블 */
.board_write_table {
	width: 100%;
	padding: 10px;
	border-collapse: collapse;
	border-top: 2px solid #555;
	border-bottom: 2px solid #555;
}

.board_write_table td {
	padding: 10px 0;
	line-height: 40px;
	height: 40px;
}

.board_write_table tr {
	border-bottom: 1px solid #ccc;
}

.board_write_table tr>td:nth-child(1) {
	width: 150px;
}

.board_write_table tr>td input {
	border: 1px solid #ccc;
	width: 100%;
	height: 40px;
	line-height: 40px;
}

.board_write_table .txt_area {
	width: 100%;
	height: 300px;
	border: 1px solid #ccc;
	resize: none;
}

.board_edit {
	display: block;
	width: 100%;
	height: 50px;
	background-color: #4a4242;
	color: #fff;
	cursor: pointer;
}

.board_edit:hover {
	background-color: #362c2c;
}

.board_btns {
	text-align: center;
	margin: 30px 0;
}

.board_btns a {
	text-align: center;
	text-decoration: none;
	border-bottom: 3px solid #333;
	display: inline-block;
	margin: 0 5px;
	padding: 5px 10px;
}

.board_btns a:hover {
	border-bottom: 3px solid #5e92c6;
}
*
/
</style>

<title>글쓰기창</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }  
  function backToList(obj){
    obj.action="${contextPath}/PetFoodBoard/listArticles.do";
    obj.submit();
  }

</script>
<title>새글 쓰기 창</title>
</head>
<body>

	<div class="wrap">
		<h1 class="tit">새글 쓰기</h1>
		<form name="articleForm" method="post"
			action="${contextPath}/PetFoodBoard/addArticle.do"
			enctype="multipart/form-data">
			<table class="board_write_table">
				<tr>
					<td>제목</td>
					<td align="left"><input type="text" maxlength="500"
						name="title" required /></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td align="left"><input type="text" name="writer" size="10"
						value="${user.userName}" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td align="left"><textarea name="content" cols="40" rows="10"
							class="txt_area" required></textarea></td>
				</tr>
				<tr>
					<td>이미지파일 첨부:</td>
				</tr>
				<tr>
					<td><input type="file" name="imageFileName"
						onchange="readURL(this);" /></td>
				</tr>
				<tr>
					<td><img id="preview" src="#" width=200 height=200 /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글쓰기" class="board_edit" /> 
						<input type=button value="목록보기" class="board_edit" onClick="backToList(this.form)" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
