<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사관리 시스템</title>
</head>
<script>
function check() {
	var doc=document.form;
	if(doc.dunggub.value==""){
		alert("직급을 입력하세요.");
		doc.dunggub.focus();
		return false;
	}if(doc.salary.value==""){
		alert("급여가 입력되지 않았습니다.");
		doc.salary.focus();
		return false;
	}else{
		doc.submit();
	}
}
</script>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<%
String dunggub=request.getParameter("dunggub");
try{
	String sql="select * from hobong0707 where dunggub=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, dunggub);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String salary=rs.getString("salary");
	
%>
<h2>인사관리 호봉 수정 화면</h2>
<hr>
<form name="form" method="post" action="update_hobongProcess.jsp">
<table border="1" id="tab1">
<tr>
<th class="th1">직급</th>
<td>
<select name="dunggub">
<option value="1"  <%=dunggub.equals("1")?"selected":"" %>>1급</option>
<option value="2"  <%=dunggub.equals("2")?"selected":"" %>>2급</option>
<option value="3"  <%=dunggub.equals("3")?"selected":"" %>>3급</option>
<option value="4"  <%=dunggub.equals("4")?"selected":"" %>>4급</option>
<option value="5"  <%=dunggub.equals("5")?"selected":"" %>>5급</option>
</select>
</td>
</tr>
<tr>
<th class="th1">급여</th>
<td>
<input type="text" name="salary" value="<%=salary%>">
</td>
</tr>
<tr>
<td colspan="2" class="td1">
<input type="button" value="등록" onclick="check()" class="bt1">
<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt1">
</td>
</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
	}

%>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>