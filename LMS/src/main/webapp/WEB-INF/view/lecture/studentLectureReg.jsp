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
							<c:forEach var="t" items="${totalList}">
								<tr>
									<td><strong>${t.lectureCode}</strong></td>
									<td>${t.lectureName}</td>
									<td><span class="badge bg-label-primary me-1"></span>${t.memberName}</td>
									<td><span class="badge bg-label-secondary me-1"></span>${t.credit}</td>
									<td><button type="button" id="cartAddBtn" class="addBtn" value="${t.openedLecNo}">add</button></td>
								</tr>
								<input type="hidden" name="studentCode" id="studentCode" value="20122001"> <!-- ${memberCode}로 수정해야함 -->
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<form action="${pageContext.request.contextPath}/studentLectureReg" method="post" id="lectureAddForm">
			<div style="float: right; width: 40%;">
				<div class="card text-center">
					<h5 class="card-header">내 강의</h5>
					<div class="table-responsive text-nowrap">
						<table class="table">
							<caption class="ms-4">Student Lecture</caption>
							<thead>
								<tr>
									<th width="10%">강의코드</th>
									<th width="40%">강의이름</th>
									<th width="10%">학점</th>
									<th width="10">취소</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="c" items="${cartList}">
									<tr>
										<td><strong>${c.lectureCode}</strong></td>
										<td>${c.lectureName}</td>
										<td><span class="badge bg-label-primary me-1"></span>${c.credit}</td>
										<td><button type="button" id="cartDeleteBtn" class="deleteBtn" value="${c.cartNo}">delete</button></td>
									</tr>
									<input type="hidden" name="openedLecNo2" value="${c.openedLecNo}">
									<input type="hidden" name="cartNo" value="${c.cartNo}">
									<input type="hidden" name="studentCode2" value="20122001"> <!-- ${memberCode}로 수정해야함 -->
								</c:forEach>
								<c:forEach begin="0" end="${size}" var="b">
									<tr>
										<td colspan="4">강의를 담아주세요</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</form>
		<div style="float: right; margin-top: 20px;">
			<button type="button" id="lectureAddBtn" class="btn btn-dark">수강신청하기</button>
			<button class="btn btn-dark">취소</button>
		</div>
	</div>
	<!-- / Main -->

<script>
	$('.addBtn').click(function() {
		var openedLecNoVal = $(this).val(); 
		$.ajax({
			url : 'cartAdd',
			type : 'post',
			data : {openedLecNo : openedLecNoVal, studentCode : $('#studentCode').val()},
			success : function(json) {
				if(json == 'y') {
					alert('수강 장바구니에 담겼습니다.');
				} else {
					alert('수강 장바구니에 담기지 못했습니다.');
				}
			}
		});
		location.reload();
		return false;
	});
	
	$('.deleteBtn').click(function() {
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

<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 