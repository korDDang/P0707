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
	String sql="insert into info0707 values(?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("id"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.setString(3, request.getParameter("dept"));
	pstmt.setString(4, request.getParameter("position"));
	pstmt.setString(5, request.getParameter("duty"));
	pstmt.setString(6, request.getParameter("phone"));
	pstmt.setString(7, request.getParameter("address"));
	pstmt.executeUpdate();
	%>
	<script>
	alert("등록 성공");
	location.href="select_info.jsp";
	</script>
	
	
	 <% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록실패");
}

%>
</body>
</html>