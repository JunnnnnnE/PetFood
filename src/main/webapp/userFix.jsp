<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="login.user.UserVO" %>
<%@ page import="login.user.impl.UserDAO" %>

<!DOCTYPE html>
<html>
<head>
<script src="assets/js/jquery-3.6.0.min.js"></script>
<style>
/*reset*/
body,div,h3,p,strong,form,fildset,legend,label,input,select,option,span,textarea{
    margin:0;
    padding:0;
}
body,input,select,option,textarea{
    font:normal 12px/1.5 nanum,sans-serif;
    background-color:#ffffff;
    color:#333333;
}
input,select,option,textarea{
    outline:none;
}

/*join_cotaier*/
#join_cotaier{
    width:500px; height:800px;
    margin:20px auto;
}
#join_cotaier>h3{
    font-size:19px;
    height:20px;
    margin-bottom:10px;
    text-align:center;
}
.point{
    color:#cc0066;
}

#join fieldset{
    border:1px solid #cccccc;
    padding:10px;
    margin-bottom:30px;
}
#join fieldset legend{
    font-size:15px;
    font-weight:bold;
    padding:5px;
}

.inbox{
    clear:both;
    margin:5px 0;
}
.textbox{
    clear:both;
    margin:10px 0;
    margin-left:35px;
}
.textbox strong{
	color:red;
}

.information{
    height:20px;
    margin-bottom:5px;
}

/*필수 입력 항목*/
.join1{
	position: relative;
}
.join1 label{
    width:110px; height:30px;
    display:inline-block;
    text-align:right;
    line-height:30px;
    margin-right:10px;
}
.join1 input{
    border:1px solid #cccccc;
    height:30px;
    text-align:center;
}
#userName, #userNickname, #userEmail, #userId, #userPwd1, #userPwd2, #petAge, #petName, #petType{
    width:180px;
}
#add{
    width:350px;
}
#tel1, #tel2, #tel3{
    width:70px;
}
#passwordck{
	width:155px; height:30px;
	position:absolute;
	right:20px;
	bottom:83px;
	line-height:30px;
	letter-spacing:-1px;
	color:#000000;
}
#idck_b{
	position:absolute;
	right:100px;
	top:93px;
}
#reallyBox{
	position:relative;
	width:250px; height:30px;
	margin-left:30px;
	padding-left:135px;
}
#really{
	position:absolute;
	left:0px; top:50px;
	margin-top:-50px;
	width:130px;
}


/*반려동물 정보 입력*/
.join2 label{
    width:110px; height:30px;
    display:inline-block;
    text-align:right;
    line-height:30px;
    margin-right:10px;
}
.join2 input{
    border:1px solid #cccccc;
    height:30px;
    text-align:center;
}

/*이용약관 동의*/
.join3 textarea{
    width:480px; height:250px;
    border:none;
    resize:none;
}
.join3 textarea::-webkit-scrollbar{width:6px;}
.join3 textarea::-webkit-scrollbar-track{background-color:#999999;}
.join3 textarea::-webkit-scrollbar-thumb{background-color:#333333;}
.join3 textarea::-webkit-scrollbar-thumb:hover{background-color:#666666;}
.join3 textarea::-webkit-scrollbar-thumb:active{background-color:#000000;}
#chk1, #chk2{
    vertical-align:-2px;
}
#chk2{
    margin-left:8px;
}

/*회원가입하기, 다시작성*/
.btn{
    width:308px; height:30px;
    margin-left:auto;
    margin-right:auto;
}
.btn_m{
    width:150px; height:30px;
    float:left;
    margin:0 2px;
    cursor:pointer;
    border:2px solid #cccccc;
    border-radius:5px;
}
.btn_del{
    width:150px; height:30px;
    float:left;
    margin:0 2px;
    cursor:pointer;
    border:2px solid #cccccc;
    border-radius:5px;
}
.btn_m:hover{
    background-color:#333333;
    color:#ffffff;
}
</style>
<script>
var sw=0;
function characterCheck(obj){
	  var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
	  if( regExp.test(obj.value) ){
	     obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
	  }
	}
	
	$(document).ready(function() {
		$("#next").prop("disabled","disabled");
		$("#next").attr("class","btn_del");
		$(".join3").css("display","none");

		$(".userPwdCk").keyup(function() {
			var pwd1 = $("#userPwd1").val();
			var pwd2 = $("#userPwd2").val();
			var listVar = $("input[name=agree]:checked").val();

			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#passwordck").css("color","blue");
					$("#passwordck").text("비밀번호가 일치합니다.");
					$("#next").prop("disabled","");
					$("#next").removeClass("btn_del");
					$("#next").addClass("btn_m");
					$(".btn_m").attr("title","회원가입 완료하기");
				} else {
					$("#passwordck").css("color","red");
					$("#passwordck").text("비밀번호가 일치하지 않습니다");
					$("#next").prop("disabled","disabled");
					$("#next").removeClass("btn_m");
					$("#next").addClass("btn_del");
					$(".btn_del").attr("title","필수 입력창을 확인해주세요.");
				}
			}
		});

		
		$("#reset_b").click(function(){
			$("#next").removeClass("btn_m");
			$("#next").addClass("btn_del");
			$("#next").prop("disabled","disabled");
			$(".btn_del").attr("title","필수 입력창을 확인해주세요.");
			$("#passwordck").text("");
		});
		
		$("#next").click(function(){
			$("#userName").prop("disabled","");
			$("#userId").prop("disabled","");
		});
		
	});
</script>
<meta charset="UTF-8">
<title>회원 정보 수정하기</title>
</head>
<body>
	<div id="join_cotaier">
        <h3>회원 정보 변경하기</h3>
        <p class="information"><strong class="point">*</strong> 는 변경가능 항목을 나타냅니다.</p>
        <form action="FixGood" method="post" id="join">
            <fieldset class="join1">
                <legend>사용자정보 변경</legend>
                <p class="inbox"><label for="userName"> 이름</label><input type="text" id="userName" name="userName" autocomplete="off" value="${fix.userName}" disabled required></p>
                <p class="inbox"><label for="userNickname"><strong class="point">*</strong> 닉네임</label><input type="text" id="userNickname" name="userNickname" autocomplete="off" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" value="${fix.userNickname}"  required></p>
                <p class="inbox"><label for="userId"> 아이디</label><input type="text" id="userId" name="userId" autocomplete="off" value="${fix.userId}" disabled required></p>
                <p class="inbox"><label for="userPwd1"><strong class="point">*</strong> 비밀번호</label><input type="password" class="userPwdCk" id="userPwd1" name="userPwd1" autocomplete="off"  required></p>
                <p class="inbox"><label for="userPwd2"><strong class="point">*</strong> 비밀번호 확인</label><input onkeyup="printPwd()" type="password" class="userPwdCk" id="userPwd2" name="userPwd2" autocomplete="off" required></p>
                <p id="passwordck"></p>
                <p class="inbox"><label for="userEmail"><strong class="point">*</strong> 이메일</label><input type="text" id="userEmail" name="userEmail" autocomplete="off" value="${fix.userEmail}" required></p>
                <p class="textbox"><strong class="piont">주의!</strong> 이메일은 완성형으로 작성해주세요. 잃어버린 정보를 찾는데 사용됩니다.</p>
                
            </fieldset>
            <fieldset class="join2">
            	<legend>반려동물 정보 입력</legend>
                <p class="inbox"><label for="petName">이름</label><input type="text" id="petName" name="petName" autocomplete="off" value="${fix.petName}" ></p>
                <p class="inbox"><label for="petAge">나이</label><input type="text" id="petAge" name="petAge" autocomplete="off" value="${fix.petAge}" ></p>
                <p class="inbox"><label for="petType">품종</label><input type="text" id="petType" name="petType" autocomplete="off" value="${fix.petKind}" ></p>
            </fieldset>
            <fieldset class="join3">
                <legend>회원정보 변경 하기</legend>
                <p id="text_wrap">
                <textarea cols="65" rows="15" readonly>
                </textarea>
                </p>
                <p class="box_i">
                    <input type="radio" class="ckbox" name="agree" id="chk1" value="1" checked>
                    <label for="chk1">동의</label>
                    <input type="radio" class="ckbox" name="agree" id="chk2" value="2">
                    <label for="chk2">동의안함</label>
                </p>
            </fieldset>
            <p class="btn">
                <input class="btn_m" type="submit" id="next" title="필수 입력창을 확인해주세요." value="회원정보변경하기" >
                <input class="btn_m" type="reset" id="reset_b" value="다시작성">
            </p>
        </form>
    </div>
</body>
</html>