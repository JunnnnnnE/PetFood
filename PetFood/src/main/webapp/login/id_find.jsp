<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기</title>
</head>
<jsp:include page="../view/header.jsp"></jsp:include>
<style>
#wrap {
	width : 100%;
	height : 100%;
	margin : auto auto;
	padding : 100px;
}

.find {

	width : 500px;
	margin : 0 auto;
	margin-bottom : 50px;
	border-top : 1px solid black;
	padding : 30px;
	/* margin-left : auto;
	margin-right : auto; */
}

label {
	width : 50px;
}

.findItem {
	margin-top : 5px;
}
.btn input{
	width : 150px;
}
</style>
<script type="text/javascript">
	function id_search() { 
 		var frm = document.idfindscreen;

 		if (frm.user_Name.value.length < 1 || frm.user_Email.value.length < 1) {
	  	alert("회원정보를 입력해주세요.");
	  	return;
	 	}

	frm.method = "post";
	frm.action = "../LoginController/idFind.do"; //넘어간화면
	frm.submit();
	}
</script>
<script type="text/javascript">
	function pw_search() { 
 		var frm = document.pwfindscreen;

 		if (frm.user_Id.value.length < 1 || frm.user_Name.value.length < 1 || frm.user_Email.value.length < 1) {
	  	alert("회원정보를 입력해주세요.");
	  	return;
	 	}

	frm.method = "post";
	frm.action = "../LoginController/pwFind.do"; //넘어간화면
	frm.submit();
	}
</script>

<div id = "wrap">
<form action="${contextPath}LoginController/idFind.do" name="idfindscreen" method = "POST">
	<div class = "find">
		<div class = "search-title">
			<h3>ID 찾기</h3>
		</div>
			<section class = "form-search">
				<div class = "findItem">
					<label>이름</label>
					<input type="text" name="user_Name" class = "btn-name" placeholder = "본인 이름">
				<br>
				</div>
				<div class = "findItem">
					<label>Email</label>
					<input type="text" name="user_Email" class = "btn-Email" placeholder = "가입당시 입력했던 Email">
				</div>
			</section>
		<div class ="btn">
			<input type="button" name="enter" value="찾기"  onClick="id_search()">
			<input type="button" name="cancel" value="취소" onClick="history.back()">
	 	</div>
 	</div>
 </form>
 
 
 
 <form action="${contextPath}/LoginController/pwFind.do" name="pwfindscreen" method = "POST">
	<div class = "find" id = "findPw">
		<div class = "search-title">
			<h3>PW 찾기</h3>
		</div>
			<section class = "form-search">
				<div class = "findItem">
					<label>ID</label>
					<input type="text" name="user_Id" class = "btn-id" placeholder = "아이디">
				<br>
				</div>
				<div class = "findItem">
					<label>이름</label>
					<input type="text" name="user_Name" class = "btn-name" placeholder = "본인 이름">
				<br>
				</div>
				<div class = "findItem">
					<label>Email</label>
					<input type="text" name="user_Email" class = "btn-Email" placeholder = "가입당시 입력했던 Email">
				</div>
			</section>
		<div class ="btn">
			<input type="button" name="enter" value="찾기"  onClick="pw_search()">
			<input type="button" name="cancel" value="취소" onClick="history.back()">
	 	</div>
 	</div>
 </form>
</div>
<jsp:include page="../view/footer.jsp"></jsp:include>
</html>