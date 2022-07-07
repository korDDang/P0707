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
	if(doc.id.value==""){
		alert("사원번호를 입력하세요.");
		doc.id.focus();
		return false;
	}if(doc.name.value==""){
		alert("성명이 입력되지 않았습니다.");
		doc.name.focus();
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
String id=request.getParameter("id");
try{
	String sql="select * from info0707 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String name=rs.getString("name");
		String dept=rs.getString("dept");
		String position=rs.getString("position");
		String duty=rs.getString("duty");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
	

%>
<h2>인사관리 사원 수정 화면</h2>
<hr>
<form name="form" method="post" action="update_infoProcess.jsp">
<table border="1" id="tab1">
<tr>
<th class="th1">사원번호(자동생성)</th>
<td>
<input type="text" name="id" value="<%=id%>">
</td>
</tr>
<tr>
<th class="th1">성명</th>
<td>
<input type="text" name="name" value="<%=name %>" >
</td>
</tr>
<tr>
<th class="th1">소속부서</th>
<td>
<select name="dept">
<option value="10" <%=dept.equals("10")?"selected":"" %>>인사부</option>
<option value="20" <%=dept.equals("20")?"selected":"" %>>기획부</option>
<option value="30" <%=dept.equals("30")?"selected":"" %>>홍보부</option>
<option value="40" <%=dept.equals("40")?"selected":"" %>>영업부</option>
<option value="50" <%=dept.equals("50")?"selected":"" %>>경리부</option>
</select>
</td>
</tr>
<tr>
<th class="th1">직급</th>
<td>
<input type="radio" name="position" value="1" <%=position.equals("1")?"checked":"" %>>1급
<input type="radio" name="position" value="2" <%=position.equals("2")?"checked":"" %>>2급
<input type="radio" name="position" value="3" <%=position.equals("3")?"checked":"" %>>3급
<input type="radio" name="position" value="4" <%=position.equals("4")?"checked":"" %>>4급
<input type="radio" name="position" value="5" <%=position.equals("5")?"checked":"" %>>5급
</td>
</tr>
<tr>
<th class="th1">직책</th>
<td>
<input type="text" name="duty" value="<%=duty%>">
</td>
</tr>
<tr>
<th class="th1">연락처</th>
<td>
<input type="text" name="phone" value="<%=phone%>">
</td>
</tr>
<tr>
<th class="th1">주소</th>
<td>
<input type="text" name="address" value="<%=address%>">
</td>
</tr>
<tr>
<td colspan="2" class="td1">
<input type="button" value="수정" onclick="check()" class="bt1">
<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt1">
</td>
<% 
}
}catch(SQLException e){
	e.printStackTrace();
}
%>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>