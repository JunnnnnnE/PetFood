<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		boolean sw=false;
	
		//회원가입 창에서 값 받아오기
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("userId");
		String password = request.getParameter("userPwd1");
		String password2 = request.getParameter("userPwd2");
		String name = request.getParameter("userName");
		String nickname = request.getParameter("userNickname");
		String Email = request.getParameter("userEmail");
		
		if(!(password2.equals(password))){
			
		}
		
		//db사용 준비
		Class.forName("org.mariadb.jdbc.Driver");
		System.out.println("mariadb 사용가능");
		
		//db연결
		Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/sys","root","123456");
		System.out.println(conn + "<-- conn");

		//db 값 불러오기
		PreparedStatement stmt = conn.prepareStatement("select * from petfood_user");
		System.out.println(stmt + "<-- stmt");
		ResultSet rs = stmt.executeQuery();	
		
		//아이디 중복 확인
		while(rs.next()){
			if(rs.getString("userId").equals(id)){  //중복
				sw=true;
				break;
			}
			else{  //가입 완료
				sw=false;
			}
		}
		
		//중복확인 결과값으로 행동
		if(sw==true){
			System.out.println("중복된 아이디 입니다.");
		}
		else{
			//db값 넣기
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO petfood_user(userId, userPwd, userName, userNickname) VALUES(?,?,?,?)");
			pstmt.setString(1,id);
			pstmt.setString(2,password);
			pstmt.setString(3,name);
			pstmt.setString(4,nickname);
			System.out.println(pstmt + "<-- pstmt");
			
			System.out.println("가입을 축하드립니다.");
			
			//db사용 마지막
			pstmt.executeUpdate();
			
		}
		
		//db사용 마지막
		conn.close();
	%>
	<h1>회원가입 페이지 입니다.</h1>
</body>
</html>