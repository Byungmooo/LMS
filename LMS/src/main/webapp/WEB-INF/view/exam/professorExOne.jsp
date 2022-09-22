<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>시험지 : ${examSheet.examName} / ${examSheet.examNo }</h2>
	<hr>
	<h3>객관식</h3>
		<table border="1">
			<tr>
			<th>문제번호</th>
			<th>문제내용</th>
			<th>답안</th>
			<th>제출여부</th>
			</tr>
		
			<c:forEach var = "m" items="${multipleQ}">
				<tr>
					<td>${m.multipleNo}</td>
					<td>${m.multipleContent }</td>
					<td>${m.exampleList}</td>
					<td>제출</td>
				</tr>
				<label>arrayUs</label>
				<select>
				<option>${m.exampleList}</option>
				</select>
			</c:forEach>
		</table>
		
	
	<h3>주관식</h3>
		<table border="1">
			<tr>
			<th>문제번호</th>
			<th>문제내용</th>
			<th>답안</th>
			<th>제출여부</th>
			</tr>
		
			<c:forEach var = "s" items="${subjectiveQ}">
			<tr>
			<td>${s.subjectiveNo}</td>
			<td>${s.subjectiveContent }</td>
			<td><input type="text" id="" name=""></td>
			<td>제출</td>
			</tr>
			</c:forEach>	
		</table>
</body>
</html>