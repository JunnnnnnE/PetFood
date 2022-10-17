<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

<h2>JDBC드라이버 테스트 </h2>

<%
  Connection conn=null;

  try{
	 String jdbcUrl = "jdbc:mariadb://127.0.0.1:3306/univ";
     String dbId = "root";
     String dbPass = "12345";
	
	 Class.forName("org.mariadb.jdbc.Driver");
	 conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	 out.println("제대로 연결되었습니다.");
  }catch(Exception e){ 
	 e.printStackTrace();
  }
%>
