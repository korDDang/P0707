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
	String sql="insert into hobong0707 values(?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("dunggub"));
	pstmt.setString(2, request.getParameter("salary"));
	pstmt.executeUpdate();
	%>
	<script>
	alert("등록 성공");
	location.href="select_hobong.jsp";
	</script>
	
	
	 <% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록실패");
}

%>
</body>
</html>