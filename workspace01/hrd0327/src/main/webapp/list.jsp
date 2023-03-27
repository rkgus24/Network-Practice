<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="style.css" rel="stylesheet">
<title>List</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<section>
		<table border=1>
			<tr>
				<td>참가번호</td>
				<td>참가자명</td>
				<td>생년월일</td>
				<td>성별</td>
				<td>특기</td>
				<td>소속사</td>
			</tr>
		</table>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>