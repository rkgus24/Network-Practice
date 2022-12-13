<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp"/>
	<section>
		<h1>회원정보조회</h1>
		<table border="1">
			<tr>
				<td>수강월</td>
				<td>회원번호</td>
				<td>회원명</td>
				<td>강의명</td>
				<td>강의장소</td>
				<td>수강료</td>
				<td>등급</td>
			</tr>
			<%
				try {
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
					String sql = "SELECT tc.regist_month, tm.c_no, tm.c_name, tt.class_name, tc.class_area, tc.tution, tm.grade FROM TBL_TEACHER_202201 tt, TBL_MEMBER_202201 tm, TBL_CLASS_202201 tc WHERE tm.c_no = tc.c_no AND tc.teacher_code  = tt.teacher_code";
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()){
						String date = rs.getString(1);
						date = date.substring(0,4) + "년" + date.substring(4, 6) + "월";
						
						String price = Integer.toString(rs.getInt(6));
						if(price.length() == 6)
							price = "\\" + price.substring(0, 3) + "," + price.substring(3, 6);
						else price = "\\" + price.substring(0, 2) + "," + price.substring(2, 5);
			%>
				<tr>
				<td><%=date %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=price %></td>
					<td><%=rs.getString(7) %></td>
				</tr>
				<%
					}
				} catch(Exception e){
					e.printStackTrace();
				}
					%>
		</table>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>