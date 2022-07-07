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
	String sql="insert into sudang0707 values(?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("id"));
	pstmt.setString(2, request.getParameter("gajok"));
	pstmt.setString(3, request.getParameter("jikchak"));
	pstmt.setString(4, request.getParameter("gunsok"));
	pstmt.setString(5, request.getParameter("gitasudang"));
	pstmt.executeUpdate();
	%>
	<script>
	alert("등록 성공");
	location.href="select_sudang.jsp";
	</script>
	
	
	 <% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록실패");
}

%>
</body>
</html>