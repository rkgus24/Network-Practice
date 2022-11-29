<%@ page import="DBPKG.Util"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rank</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />
	<section>
	<h2><b>오디션 참가 신청</b></h2>
	<form>
	<table border="1">
		<tr>
			<td>참가번호</td>
			<td>참가자명</td>
			<td>총점</td>
			<td>평균</td>
			<td>등수</td>
		</tr>
		<tr>
			<%
				request.setCharacterEncoding("UTF-8");
				try {
					Connection conn = Util.getConnection();
					String sql = "SELECT ar.artist_id, artist_name, SUM(score), TO_CHAR(AVG(score),'99.99'), RANK() OVER(ORDER BY SUM(score) DESC) FROM tbl_artist_201905 ar, tbl_point_201905 po WHERE ar.artist_id=po.artist_id GROUP BY ar.artist_id, artist_name";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()) {
			%>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
		</tr>
		<%
					}
				} catch(Exception e) {
					e.printStackTrace();
				}
		%>
	</table>
	</form>
	</section>
<jsp:include page="footer.jsp" />
</body>
</html>