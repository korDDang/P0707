<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<h2>사원 정보 조회</h2>
<hr>
<table border="1" id="tab1">
<tr>
<th class="th1">no</th>
<th class="th1">사번</th>
<th class="th1">성명</th>
<th class="th1">직급</th>
<th class="th1">직책</th>
<th class="th1">연락처</th>
<th class="th1">소속부서</th>
<th class="th1">주소</th>
<th class="th1">관리</th>
</tr>
<%
int no=0;
try{
	String sql="select * from info0707";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString(1);
		String name=rs.getString(2);
		String dept=rs.getString(3);
		switch(dept){
		case "10": dept="인사부";
		break;
		case "20": dept="기획부";
		break;
		case "30": dept="홍보부";
		break;
		case "40": dept="영업부";
		break;
		case "50": dept="경리부";
		break;
		}
		String position=rs.getString(4);
		String duty=rs.getString(5);
		String phone=rs.getString(6);
		String address=rs.getString(7);
		System.out.println("조회성공");
		no++;	
%>
<tr>
<td><%=no %></td>
<td><a href="update_info.jsp?id=<%=id %>"><%=id %></a></td>
<td><%=name %></td>
<td><%=position %></td>
<td><%=duty %></td>
<td><%=phone %></td>
<td><%=dept %></td>
<td><%=address %></td>
<td class="td1"><a href="delete_info.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a></td>
</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("조회실패");
	}

%>

</table>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>