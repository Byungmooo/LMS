<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Login</h3>
	<c:forEach var="m" items="${member}">
		<table>
			<tr>
				<td>Name</td>
				<td>${m.memberName}</td>
			</tr>
			<tr>
				<td>Gender</td>
				<td>${m.memberGender}</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>