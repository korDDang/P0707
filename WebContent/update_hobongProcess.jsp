<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
try{
	String sql="update hobong0707 set salary=? where dunggub=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(2, request.getParameter("dunggub"));
	pstmt.setString(1, request.getParameter("salary"));
	pstmt.executeUpdate();
	%>
	<script>
	alert("수정 성공");
	location.href="select_hobong.jsp";
	</script>
	
	
	 <% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정 실패");
}

%>
</body>
</html>