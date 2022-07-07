<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사관리 시스템</title>
</head>
<script>
function ch(){
	var doc=document.form;
	doc.submit();
}
function check() {
	var doc=document.form;
	if(doc.id.value==""){
		alert("사원번호를 입력하세요.");
		doc.id.focus();
		return false;
	}else{
		form.action="insert_sudangProcess.jsp";
	}
}
</script>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<%
String gajok=request.getParameter("gajok");
if(gajok==null){
	gajok="0";}
String jikchak=request.getParameter("jikchak");
if(jikchak==null){
	jikchak="0";}
String gunsok=request.getParameter("gunsok");
if(gunsok==null){
	gunsok="0";}
String gitasudang=request.getParameter("gitasudang");
if(gitasudang==null){
	gitasudang="0";}
String name=request.getParameter("name");
if(name==null){
	name="";}
String id=request.getParameter("id");
if(id==null){
	id="";
}else{
try{
	String sql="select name from info0707 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		name=rs.getString("name");
	}else{
		
		%>
		<script>
		alert("등록되지 않은 사원번호 입니다");
		</script>
	  <% 
	}	
}catch(SQLException e){
	e.printStackTrace();
}
}



%>
<h2>수당 정보 등록</h2>
<hr>
<form name="form" method="post" action="insert_sudang.jsp">
<table border="1" id="tab1">
<tr>
<th class="th2">사원번호</th>
<td>
<input type="text" name="id"  onchange="ch()"  value=<%=id %>>
</td>
<th class="th2">이름</th>
<td>
<input type="text" name="name" value=<%=name %>>
</td>
</tr>
<tr>
<th class="th2">가족수당</th>
<td>
<input type="text" name="gajok" value=<%=gajok %>>
</td>
<th class="th2">직책수당</th>
<td>
<input type="text" name="jikchak" value=<%=jikchak %>>
</td>
</tr>
<tr>
<th class="th2">근속수당</th>
<td colspan="1">
<input type="text" name="gunsok" value=<%=gunsok %>>
</td>
</tr>
<tr>
<th class="th2">기타수당</th>
<td colspan="3">
<input type="text" name="gitasudang" value=<%=gitasudang %>>
</td>
</tr>
<tr>
<td colspan="4" class="td1">
<input type="button" value="목록" onclick="location.href='index.jsp'" class="bt2">
<input type="submit" value="저장" onclick="check()" class="bt2">
</td>
</tr>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>