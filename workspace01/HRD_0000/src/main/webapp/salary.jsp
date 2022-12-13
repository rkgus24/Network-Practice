<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="style.css" rel="stylesheet">
<body>
	<jsp:include page="header.jsp"/>
	<section>
		<h1>강사매출현황</h1>
		<table border="1">
			<tr>
				<td>강사코드</td><td>강의명</td><td>강사명</td><td>총매출</td>
			</tr>
			<%
				try{
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "system", "1234");
					String sql=
							"SELECT te.teacher_code, te.class_name, te.teacher_name, sum(TUTION) FROM tbl_teacher_202201 te, tbl_class_202201 cl WHERE te.teacher_code = cl.teacher_code GROUP BY te.teacher_code, te.class_name, te.teacher_name ORDER BY te.teacher_code";
					PreparedStatement stmt = con.prepareStatement(sql);
					ResultSet rs = stmt.executeQuery();
					while(rs.next()){
						String  sales = rs.getString(4);
						sales = "\\" + sales.substring(0,3) + "," + sales.substring(3, 6);
			%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=sales %></td>
				</tr>
				<%
					}
				} catch(Exception e){
					e.printStackTrace();
				}
				%>
		</table>
	</section>
</body>
</html>