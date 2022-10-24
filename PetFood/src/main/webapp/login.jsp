<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
table
{
   margin: 0 auto;
   }
</style>
<title>로그인</title>
</head>
<body>
   <h1>로그인</h1>
   <hr>
      <!-- <form action="LoginController/login.do" method="post"> -->
      <form action="${contextPath}/LoginController/login.do" method="post">
         <table border="1" cellpadding="0" cellspacing="0">
            <tr>
               <td bgcolor="orange">아이디</td>
               <td><input type="text" name="userId" /></td>
            </tr>
            <tr>
               <td bgcolor="orange">비밀번호</td>
               <td><input type="password" name="userPwd" /></td>
            </tr>
            <tr>
               <td colspan="2" align="center">
               <input type="submit" value="로그인" />
               </td>
            </tr>
         </table>
      </form>
      <hr>
</body>
</html>