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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		boolean sw=false;
		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	
		//회원가입 창에서 값 받아오기
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("userId");
		String password = request.getParameter("userPwd1");
		String password2 = request.getParameter("userPwd2");
		String name = request.getParameter("userName");
		String nickname = request.getParameter("userNickname");
		String email = request.getParameter("userEmail");
		String date = sf.format(nowTime);
		
		//애완동물 관련 정보
		String petName = request.getParameter("petName");
		String petAge = request.getParameter("petAge");
		String petKind = request.getParameter("petType");
		
			//db사용 준비
			Class.forName("org.mariadb.jdbc.Driver");  /* System.out.println("mariadb 사용가능"); */
			
			//db연결
			Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/petfood","root","123456");  /* System.out.println(conn + "<-- conn"); */
	
			//db 값 불러오기
			PreparedStatement stmt = conn.prepareStatement("select * from t_petfood_user");  /* System.out.println(stmt + "<-- stmt"); */
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
				/* System.out.println("중복된 아이디 입니다."); */
				%>
				<script>
					alert("중복된 아이디입니다!");
					<%
					response.sendRedirect("failjoin.jsp");
					%>
				</script>
				<%
			}
			else{
				//db값 넣기
				PreparedStatement pstmt = conn.prepareStatement("INSERT INTO t_petfood_user(userId, userPwd, userName, userNickname, userEmail, joinDate) VALUES(?,?,?,?,?,?)");
				pstmt.setString(1,id);
				pstmt.setString(2,password);
				pstmt.setString(3,name);
				pstmt.setString(4,nickname);
				pstmt.setString(5,email);
				pstmt.setString(6,date);
				
				pstmt.executeUpdate();
				
				if(petName !="" || petAge !="" || petKind !=""){
					PreparedStatement pstmt_pet = conn.prepareStatement("INSERT INTO t_petfood_pet(userId, petName, petAge, petKind, petProfile) VALUES(?,?,?,?,?)");
					pstmt_pet.setString(1,id);
					pstmt_pet.setString(2,petName);
					pstmt_pet.setString(3,petAge);
					pstmt_pet.setString(4,petKind);
					pstmt_pet.setString(5,"");
					
					pstmt_pet.executeUpdate();
				}
			}
			
			//db사용 마지막
			conn.close();
	%>
	<h1>정상적으로 회원가입 완료되었습니다.</h1>
</body>
</html>