<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script>
	$(document).ready(function() {
		$(".click-btn").on('click', function(e) {
			alert('수강 장바구니에 담겼습니다.');
		});
	});
</script>
<title>JS Bin</title>
</head>
<body>
	<c:forEach begin="1" end="9" var="a">
		<input>
		<button class="click-btn" id="btn-${a}">${a} 번 버튼</button>
	</c:forEach>
</body>
</html>