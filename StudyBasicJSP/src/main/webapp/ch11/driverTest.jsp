<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<h2>JDBC 드라이버 테스트</h2>

<%
Connection conn = null;

try{
	String jdbcUrl = "jdbc:mysql://127.0.0.1:3306/basicjsp?useSSL=false&serverTimezone=UTC";
	String dbId = "root";
	String dbPass = "1234";
	
// 	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	out.println("제대로 연결되었습니다.");
}
catch(Exception e){
	e.printStackTrace();
}
%>