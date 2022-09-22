<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	width: 100px;
	height: 40px;
}
th, td {
	padding: 20px;
}
th {
	text-align: center;
}
</style>
</head>
<body>
	<h1>OOO의 시간표</h1>

	<table style="width: 100%">
		<caption>OOO의 2018년도 2학기의 시간표 입니다.</caption>

		<tr>
			<th></th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
		</tr>
		<c:forEach begin="1" end="9" var="a">
			<tr>
				<th>${a}교시</th>
					<c:forEach begin="1" end="5" var="b">
						<td style="background: ${list.get(b).color};">
							<c:forEach items="${list}" var="s">
								<c:if test="${b==s.lectureYoil && s.lectureStart<=a && a<=s.lectureEnd}">
									${s.lectureName} 
									</br>
									${s.lecClassRoom}
								</c:if>
							</c:forEach>
						</td> <!-- 요일이 b이고 교시가 <=a<=인 -->
					</c:forEach>
			</tr>	
		</c:forEach>
	</table>
</body>
</html>