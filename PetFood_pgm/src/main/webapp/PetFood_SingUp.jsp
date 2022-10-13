<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
#userName, #userId, #userPwd1, #userPwd2{
    width:200px;
}
#add{
    width:350px;
}
#tel1, #tel2, #tel3{
    width:70px;
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
.btn input{
    width:150px; height:30px;
    float:left;
    margin:0 2px;
    cursor:pointer;
    border:2px solid #cccccc;
    border-radius:5px;
}
.btn input:hover{
    background-color:#333333;
    color:#ffffff;
}
</style>
</head>
<body>
	<div id="join_cotaier">
        <h3>회원가입</h3>
        <p class="information"><strong class="point">*</strong> 는 필수입력 항목을 나타냅니다.</p>
        <form action="joinOK.jsp" method="get" id=join>
            <fieldset class="join1">
                <legend>필수 입력 항목</legend>
                <p class="inbox"><label for="userName"><strong class="point">*</strong> 이름</label><input type="text" name="userName" autocomplete="off" required></p>
                <p class="inbox"><label for="userName"><strong class="point">*</strong> 닉네임</label><input type="text" name="userNickname" autocomplete="off" required></p>
                <p class="inbox"><label for="userId"><strong class="point">*</strong> 아이디</label><input type="text" name="userId" autocomplete="off" required></p>
                <p class="inbox"><label for="userPwd1"><strong class="point">*</strong> 비밀번호</label><input type="password" name="userPwd1" autocomplete="off" required></p>
                <p class="inbox"><label for="userPwd2"><strong class="point">*</strong> 비밀번호 확인</label><input type="password" name="userPwd2" autocomplete="off" required></p>
                <p class="inbox"><label for="userEmail"><strong class="point">*</strong> 이메일</label><input type="text" name="userEmail" autocomplete="off" required></p>
                <p class="textbox"><strong class="piont">주의!</strong> 이메일은 완성형으로 작성해주세요. 잃어버린 정보를 찾는데 사용됩니다.</p>
            </fieldset>
            <fieldset class="join2">
            	<legend>반려동물 정보 입력</legend>
                <p class="inbox"><label for="petName">이름</label><input type="text" name="petName" autocomplete="off" ></p>
                <p class="inbox"><label for="petAge">나이</label><input type="text" name="petAge" autocomplete="off" ></p>
                <p class="inbox"><label for="petType">품종</label><input type="text" name="petType" autocomplete="off" ></p>
            </fieldset>
            <fieldset class="join3">
                <legend>이용약관 동의</legend>
                <p id="text_wrap">
                <textarea cols="65" rows="15" readonly>약관
                </textarea>
                </p>
                <p class="box_i">
                    <input type="radio" name="agree" id="chk1" value="1">
                    <label for="chk1">동의</label>
                    <input type="radio" name="agree" id="chk2" value="2">
                    <label for="chk2">동의안함</label>
                </p>
            </fieldset>
            <p class="btn">
                <input type="submit" value="회원가입하기" disabled>
                <input type="reset" value="다시작성">
            </p>
        </form>
    </div>
</body>
</html>