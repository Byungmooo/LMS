<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>글쓰기</h3>
	<form action="${pageContext.request.contextPath}/addNotice" method="post">
		<table border="1">
			<tr>
				<th>작성자(후에 세션으로 처리할 예정)</th>
				<td><input name="writer" value="admin" readonly="readonly"></td>
			</tr>
			<tr>
				<th>강의(작성자 세션으로 조인할 예정)</th>
				<td><input name="openedLecNo" value="1" readonly="readonly"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input name="lecNoticeTitle"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="" cols="" name="lecNoticeContent">
					</textarea>
				</td>
			</tr>
		</table>
		<button type="submit">작성</button>
	</form>
</body>
</html>