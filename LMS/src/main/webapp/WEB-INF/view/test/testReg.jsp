<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Header -->
<c:import url="/WEB-INF/view/include/studentHeader.jsp"></c:import>
	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="fw-bold py-3 mb-4">
			<span class="text-muted fw-light">"이름"님 /</span>
		</h4>
		<hr class="my-5" />
		
		<!-- 수강신청 폼 -->
		
		<div style="float: left; width: 55%;">
			<div class="card text-center">
				<h5 class="card-header">전체강의</h5>
				<div class="table-responsive text-nowrap">
					<table class="table">
						<caption class="ms-4">Total Lecture</caption>
						<thead>
							<tr>
								<th width="10%">강의코드</th>
								<th width="40%">강의이름</th>
								<th width="20%">담당교수</th>
								<th width="10%">학점</th>
								<th width="10">담기</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach begin="1" end="9" var="a">
								<tr>
									<td><strong>${a}</strong></td>
									<td>${a}</td>
									<td><span class="badge bg-label-primary me-1"></span>${a}</td>
									<td><span class="badge bg-label-secondary me-1"></span>${a}</td>
									<td><button type="button" class="btn-dark" id="btn" value="${a}">add</button></td>
								</tr>
								<input type="hidden" name="bNo" id="bNo" value="${a+5}">
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- / Main -->
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script>
	$(".btn-dark").click(function() {
		var aNo = $(this).val(); 
		alert(aNo);
		$.ajax({
			url : 'testPost',
			type : 'post',
			data : {aNo : aNo, bNo : $('#bNo').val()},
			success : function(json) {
					//alert('수강 장바구니에 담겼습니다.');
			}
		});
		location.reload();
		return false;
	});
</script>
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 