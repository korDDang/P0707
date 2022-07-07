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
int ma=0;
try{
	String sql="select max(id) from info0707";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1)+1;
	}
}catch(SQLException e){
	e.printStackTrace();
}

%>
<h2>인사관리 사원등록 화면</h2>
<hr>
<form name="form" method="post" action="insert_infoProcess.jsp">
<table border="1" id="tab1">
<tr>
<th class="th1">사원번호(자동생성)</th>
<td>
<input type="text" name="id" value="<%=ma%>">
</td>
</tr>
<tr>
<th class="th1">성명</th>
<td>
<input type="text" name="name" >
</td>
</tr>
<tr>
<th class="th1">소속부서</th>
<td>
<select name="dept">
<option value="10">인사부</option>
<option value="20">기획부</option>
<option value="30">홍보부</option>
<option value="40">영업부</option>
<option value="50">경리부</option>
</select>
</td>
</tr>
<tr>
<th class="th1">직급</th>
<td>
<input type="radio" name="position" value="1">1급
<input type="radio" name="position" value="2">2급
<input type="radio" name="position" value="3">3급
<input type="radio" name="position" value="4">4급
<input type="radio" name="position" value="5">5급
</td>
</tr>
<tr>
<th class="th1">직책</th>
<td>
<input type="text" name="duty" >
</td>
</tr>
<tr>
<th class="th1">연락처</th>
<td>
<input type="text" name="phone" >
</td>
</tr>
<tr>
<th class="th1">주소</th>
<td>
<input type="text" name="address" >
</td>
</tr>
<tr>
<td colspan="2" class="td1">
<input type="button" value="등록" onclick="check()" class="bt1">
<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt1">
</td>
</tr>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>