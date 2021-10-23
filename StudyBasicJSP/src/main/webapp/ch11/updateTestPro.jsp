<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%request.setCharacterEncoding("utf-8");%>

<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/basicjsp?useSSL=false&serverTimezone=UTC";
	String dbId = "jspid";
	String dbPass = "jsppass";
	
	Class.forName("com.mysql.jdbc.cj.Driver");
	conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	String sql = "select id, passwd from member where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		String rId = rs.getString("id");
		String rPasswd = rs.getString("passwd");
		if(id.equals(rId) && passwd.equals(rPasswd)){
			sql = "update member set name= ? where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레코드 수정</title>
</head>
<body>
	<h2>member 테이블의 레코드를 수정했습니다.</h2>
</body>
</html>

<%
	}
	else
		out.print("패스워드가 틀렸습니다");
	else
		out.println("아이디가 틀렸습니다.");
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(rs != null)
			try{rs.close();}catch(SQLException){}
		if(pstmt != null)
			try{pstmt.close();}catch(SQLException){}
		if(conn != null)
			try{conn.close();}catch(SQLException){}
	}
%>
