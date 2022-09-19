<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>상세보기</h3>
	<table border="1">
		<tr>
			<th>조회수</th>
			<td>${one.views}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${one.lecNoticeTitle}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${one.writer}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${one.lecNoticeContent}</td>
		</tr>
		<tr>
			<th>등록날짜</th>
			<td>${one.createDate}</td>
		</tr>
	</table>
</body>
</html>