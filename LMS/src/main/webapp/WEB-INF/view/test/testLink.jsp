<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<title>JS Bin</title>
</head>
<body>
	<div class="table-responsive">
		<form action="${pageContext.request.contextPath}/professorClubList" method="get">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>A</th>
					<th>B</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="1" end="9" var="i">
					<tr>
						<td>${i}</td>
						<td>${i+2}</td>
						<td>
							<input name="studentNo" id="student${i}" class="student" 
								type="text" value="${i}" />
							<input name="clubNo" id="club${i+2}" 
								type="text" value="${i+2}" />
							<a href="${pageContext.request.contextPath}/addTestLink?studentNo=${i}&clubNo=${i+2}">승인</a>
							<a href="${pageContext.request.contextPath}/removeTestLink?studentNo=${i}&clubNo=${i+2}">취소</a>
						</td>
					</tr>
					
				</c:forEach>
			</tbody>
		</table>
		</form>
	</div>
<script>
	$('.addBtn').click(function() {
		var openedLecNoVal = $(this).val();
		var clubValue = $('#student2').val();
		
		alert(openedLecNoVal);
		alert(clubValue);
		$.ajax({
			url : 'addTestLink',
			type : 'get',
			data : {clubNo :  $('#club${i+2}').val(), studentNo : $('#student${i}').val()},
			success : function(json) {
				if(json == 'y') {
					alert('수강 장바구니에 담겼습니다.');
				} else {
					alert('이미 장바구니에 있는 과목입니다.');
				}
			}
		});
		location.reload();
		return false;
	});
	
	$('.removeBtn').click(function() {
		var cartNoVal = $(this).val(); 
		$.ajax({
			url : 'cartRemove',
			type : 'post',
			data : {cartNo : cartNoVal},
			success : function(json) {
				if(json == 'y') {
					alert('수강 장바구니에서 삭제되었습니다.');
				} else {
					alert('수강 장바구니에서 삭제되지 못했습니다.');					
				}
			}
		});
		location.reload();
		return false;
	});
	
	$('#lectureAddBtn').click(function() {
		// if($('#lectureAddBtn').val() == '') {
		lectureAddForm.submit();
	});
</script>
</body>
</html>