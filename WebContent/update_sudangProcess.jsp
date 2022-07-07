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
	String sql="update sudang0707 set gajok=?,jikchak=?,gunsok=?,gitasudang=? where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(5, request.getParameter("id"));
	pstmt.setString(1, request.getParameter("gajok"));
	pstmt.setString(2, request.getParameter("jikchak"));
	pstmt.setString(3, request.getParameter("gunsok"));
	pstmt.setString(4, request.getParameter("gitasudang"));
	pstmt.executeUpdate();
	%>
	<script>
	alert("수정 성공");
	location.href="select_sudang.jsp";
	</script>
	
	
	 <% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정실패");
}

%>
</body>
</html>