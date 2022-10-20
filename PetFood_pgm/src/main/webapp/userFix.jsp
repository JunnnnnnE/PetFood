<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-3.6.0.min.js"></script>
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
	bottom:115px;
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
function loadFn() {
    var userid = $("#userId").val();
    $.ajax({
        url: "dbselid.jsp",		// 데이터를 가져올 경로 설정
        type: "get",		// 데이터를 가져오는 방식
        data: {userId : userid},
        success: function(data){	// 데이터를 가져왔을때 동작. 매개변수로 data 입력
            var json = JSON.parse(data.trim());	// 가져온 데이터를 자바스크립트 객체로 변환해주는 작업이 필요
                                                // trim()을 통해 불필요한 여백 제거
			if(userid == ""){
				alert("아이디를 입력하세요.");
			}
			else{
				if(json == true){
					sw=0;
					alert("중복된 아이디 입니다.");
				}
				else{
					sw=1;
					alert("사용가능한 아이디 입니다.");
					$("#idck_b").prop("disabled","disabled");
					$("#userId").prop("disabled","disabled");
				}
			}
			var pwd1 = $("#userPwd1").val();
			var pwd2 = $("#userPwd2").val();
			var listVar = $("input[name=agree]:checked").val();
			if(sw==1){
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					if(listVar == 2){ //동의안함
						$("#next").removeClass("btn_m");
						$("#next").addClass("btn_del");
						$("#next").prop("disabled","disabled");
						$(".btn_del").attr("title","약관 동의를 확인해주세요.");
					}
					else if(listVar == 1){ // 동의함
						$("#next").removeClass("btn_del");
						$("#next").addClass("btn_m");
						$("#next").prop("disabled","");
						$(".btn_m").attr("title","회원가입 완료하기");
					}
				} else {
					$("#next").removeClass("btn_m");
					$("#next").addClass("btn_del");
					$(".btn_del").attr("title","필수 입력창을 확인해주세요.");
				}
				}
			}
			else if(sw==0){
				$("#next").removeClass("btn_m");
				$("#next").addClass("btn_del");
				$(".btn_del").attr("title","필수 입력창을 확인해주세요.");
			}
        }
    })
 }

function characterCheck(obj){
	  var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
	  if( regExp.test(obj.value) ){
	     obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
	  }
	}

	$(document).ready(function() {
		
		$("#userId").keyup(function(){ //영어 숫자만
			$(this).val($(this).val().replace(/[^a-z0-9]/gi,""));
		});
		$("#userName").keyup(function(){ // 한글 영어만
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^(ㄱ-힣a-zA-Z)]/gi, ''));
			}
		});
		
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
					if(sw==1){
					if(listVar == 2){ //동의안함
						$("#next").removeClass("btn_m");
						$("#next").addClass("btn_del");
						$("#next").prop("disabled","disabled");
					}
					else if(listVar == 1){ // 동의함
						$("#next").removeClass("btn_del");
						$("#next").addClass("btn_m");
						$("#next").prop("disabled","");
						$(".btn_m").attr("title","회원정보 변경하기");
					}
					}
					else if(sw==0){
						$("#next").removeClass("btn_m");
						$("#next").addClass("btn_del");
						$("#next").prop("disabled","disabled");
						$(".btn_del").attr("title","필수 입력창을 확인해주세요.");
					}
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
		
		$(".ckbox").change(function(){
			var pwd1 = $("#userPwd1").val();
			var pwd2 = $("#userPwd2").val();
			var listVar = $("input[name=agree]:checked").val();
			if(sw==1){
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					if(listVar == 2){ //동의안함
						$("#next").removeClass("btn_m");
						$("#next").addClass("btn_del");
						$("#next").prop("disabled","disabled");
					}
					else if(listVar == 1){ // 동의함
						$("#next").removeClass("btn_del");
						$("#next").addClass("btn_m");
						$("#next").prop("disabled","");
						$(".btn_m").attr("title","회원정보 변경하기");
					}
				} else {
					$("#next").removeClass("btn_m");
					$("#next").addClass("btn_del");
					$("#next").prop("disabled","disabled");
					$(".btn_del").attr("title","필수 입력창을 확인해주세요.");
				}
				}
			}
			else if(sw==0){
				$("#next").removeClass("btn_m");
				$("#next").addClass("btn_del");
				$("#next").prop("disabled","disabled");
				$(".btn_del").attr("title","필수 입력창을 확인해주세요.");
			}
		});
		
		$("#idck_b").on("click",function(){
			loadFn();
		});
		
		$("#reset_b").click(function(){
			$("#idck_b").prop("disabled","");
			$("#userId").prop("disabled","");
			$("#next").removeClass("btn_m");
			$("#next").addClass("btn_del");
			$("#next").prop("disabled","disabled");
			$(".btn_del").attr("title","필수 입력창을 확인해주세요.");
			$("#passwordck").text("");
		});
		
		$("#next").click(function(){
			$("#idck_b").prop("disabled","");
			$("#userId").prop("disabled","");
		});
		
		$("#petReally").change(function(){
			$("#petReally").is(":checked");
			
			if($("#petReally").is(":checked")){
				$(".join2").css("display","");
			}
			else{
				$(".join2").css("display","none");
			}
		});
	});
</script>
<meta charset="UTF-8">
<title>회원 정보 수정하기</title>
</head>
<body>
	<%
		boolean sw=false;
	
		String id = (String)session.getAttribute("s_userId");
		String pwd = "";
		String name = "";
		String nickname = "";
		String date ="";
		String email ="";
		
		String petName="", petAge="", petKind="";
	
			//db사용 준비
			Class.forName("org.mariadb.jdbc.Driver"); 
				
			//db연결
			Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/petfood","root","123456");  
		
			//db 값 불러오기
			PreparedStatement stmt = conn.prepareStatement("select * from t_petfood_user");  
			ResultSet rs = stmt.executeQuery();
			PreparedStatement stmt_p = conn.prepareStatement("select * from t_petfood_pet");  
			ResultSet rs_p = stmt_p.executeQuery();
			
			while(rs.next()){
				if(rs.getString("userId").equals(id)){ //db에서 아이디 찾음
					sw=false;
				
					pwd = rs.getString("userPwd");
					name = rs.getString("userName");
					nickname = rs.getString("userNickname");
					date = rs.getString("joinDate");
					email = rs.getString("userEmail");
					
					while(rs_p.next()){
					if(rs_p.getString("userId").equals(id)){
						petName = rs_p.getString("petName");
						petAge = rs_p.getString("petAge");
						petKind = rs_p.getString("petKind");
						break;
					}
					}
				}
				else{ //db에서 아이디 못찾음
					sw=true;
				}
			}
			
			if(sw == true){
				%>
				<script>
				alert("아이디를 찾지 못했습니다.");
				</script>
				<%
			}
	%>
	
	<%=id %>님 안녕하세요
	
	<div id="join_cotaier">
        <h3>회원 정보 변경하기</h3>
        <p class="information"><strong class="point">*</strong> 는 필수입력 항목을 나타냅니다.</p>
        <form action="joinOK.jsp" method="get" id="join">
            <fieldset class="join1">
                <legend>사용자정보 변경</legend>
                <p class="inbox"><label for="userName"><strong class="point">*</strong> 이름</label><input type="text" id="userName" name="userName" autocomplete="off" value="<%=name %>" required></p>
                <p class="inbox"><label for="userNickname"><strong class="point">*</strong> 닉네임</label><input type="text" id="userNickname" name="userNickname" autocomplete="off" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" value="<%=nickname %>"  required></p>
                <p class="inbox"><label for="userId"><strong class="point">*</strong> 아이디</label><input type="text" id="userId" name="userId" autocomplete="off" value="<%=id %>" required></p>
                <p class="inbox"><label for="userPwd1"><strong class="point">*</strong> 비밀번호</label><input type="password" class="userPwdCk" id="userPwd1" name="userPwd1" autocomplete="off"  required></p>
                <p class="inbox"><label for="userPwd2"><strong class="point">*</strong> 비밀번호 확인</label><input onkeyup="printPwd()" type="password" class="userPwdCk" id="userPwd2" name="userPwd2" autocomplete="off" required></p>
                <p id="passwordck"></p>
                <p class="inbox"><label for="userEmail"><strong class="point">*</strong> 이메일</label><input type="text" id="userEmail" name="userEmail" autocomplete="off" value="<%=email %>" required></p>
                <p class="textbox"><strong class="piont">주의!</strong> 이메일은 완성형으로 작성해주세요. 잃어버린 정보를 찾는데 사용됩니다.</p>
                
                <button id="idck_b" type="button">중복확인</button>
            </fieldset>
            <fieldset class="join2">
            	<legend>반려동물 정보 입력</legend>
                <p class="inbox"><label for="petName">이름</label><input type="text" id="petName" name="petName" autocomplete="off" value="<%=petName %>" ></p>
                <p class="inbox"><label for="petAge">나이</label><input type="text" id="petAge" name="petAge" autocomplete="off" value="<%=petAge %>" ></p>
                <p class="inbox"><label for="petType">품종</label><input type="text" id="petType" name="petType" autocomplete="off" value="<%=petKind %>" ></p>
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