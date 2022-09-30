<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.addBtn:  {

}

</style>
<!-- Header -->
<c:import url="/WEB-INF/view/include/studentHeader.jsp"></c:import>
	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="fw-bold py-3 mb-4">
			<span class="text-muted fw-light">${memberName}님 / <strong>수강신청</strong></span>
		</h4>
		<hr class="my-5" />
		
		<!-- 수강신청 폼 -->
		<div style="float: left; width: 55%;">
			<div class="card text-center">
				<h5 class="card-header">전체강의</h5>
				<!-- 전체강의 리스트 -->
				<div class="table-responsive text-nowrap">
					<table class="table">
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
							<c:forEach var="t" items="${openedList}">
								<tr>
									<td><strong>${t.lectureCode}</strong></td>
									<td>${t.lectureName}</td>
									<td><span class="badge bg-label-primary me-1"></span>${t.memberName}</td>
									<td><span class="badge bg-label-secondary me-1"></span>${t.credit}</td>
									<td><button type="button" id="cartAddBtn" class="addBtn" style="   
	display: inline-block;
    font-weight: 400;
    line-height: 1.53;
    color: #697a8d;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
    background-color: transparent;
    border: 1px solid transparent;
    padding: 0.4375rem 1.25rem;
    font-size: 0.9375rem;
    border-radius: 0.375rem;
    transition: all 0.2s ease-in-out;	
	color: #fff;
    background-color: #696cff;
    border-color: #696cff;
    box-shadow: 0 0.125rem 0.25rem 0 rgb(105 108 255 / 40%);" value="${t.openedLecNo}">add</button></td>
								</tr>
								<input type="hidden" name="studentCode" id="studentCode" value="${memberCode}">
							</c:forEach>
						</tbody>
					</table>
				</div>
				<hr class="my-3" />
				<!-- 검색 -->
				<form action="${pageContext.request.contextPath}/student/studentLectureReg" method="get">
					<div class="row">
						<div class="col-sm-2 col-12 text-center">
						</div>
						<div class="col-sm-7 col-12 text-center">
							<input type="hidden" name="memberCode" value="${memberCode}">
							<input type="text" name="keyword" class="form-control" placeholder="과목이름을 입력하세요">
						</div>
						<div class="col-sm-2 col-12 text-center">
							<button type="submit" class="btn btn-dark">검색</button>
						</div>
					</div>
				</form>
				<!-- 페이징 -->
				<div style="display: block; text-align: center;">		
					<c:if test="${paging.prePage}">
						<a href="${pageContext.request.contextPath}/student/studentLectureReg?currentPage=${paging.currentPage-1}
							&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&memberCode=${memberCode}">이전</a>
					</c:if>
					<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
						<c:choose>
							<c:when test="${p == paging.currentPage }">
								<b>${p}</b>
							</c:when>
							<c:when test="${p != paging.currentPage }">
								<a href="${pageContext.request.contextPath}/student/studentLectureReg?currentPage=${p}
									&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&memberCode=${memberCode}">${p}</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.nextPage}">
						<a href="${pageContext.request.contextPath}/student/studentLectureReg?currentPage=${paging.currentPage+1}
							&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&memberCode=${memberCode}">다음</a>
					</c:if>
				</div>
			</div>
		</div>
		<form action="${pageContext.request.contextPath}/student/studentLectureReg" method="post" id="lectureAddForm">
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
									<input type="hidden" name="studentCode2" value="${memberCode}">
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
<script>
	
</script>
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 