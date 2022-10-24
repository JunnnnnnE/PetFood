<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%
	String id = request.getParameter("userId");

    // 드라이버를 가져옴
    Class.forName("org.mariadb.jdbc.Driver");
    
    // db접속
    Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/petfood","root","12345");
    
    //db 데이터 검색
    PreparedStatement pstmt = conn.prepareStatement("select userId from t_petfood_user where userId='"+id+"'");
	ResultSet rs = pstmt.executeQuery();

	out.print(rs.next());
%>