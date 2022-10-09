<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.addBtn, .deleteBtn {
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
    box-shadow: 0 0.125rem 0.25rem 0 rgb(105 108 255 / 40%);
}
</style>
<!-- Header -->
<c:import url="/WEB-INF/view/include/studentHeader.jsp"></c:import>
	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="row" style="margin-bottom: 20px;">
			<div class="container">
				<div class="goodee border border-3" style="background-color: #fff;">
					<div class="d-flex align-items-end row">
						<div class="col-sm-7">
							<div class="card-body">
								<h5 class="card-title text-primary">${memberName}님 어서오세요.</h5>
								<p class="mb-4">
									<span class="fw-bold" style="color: #000;">회원유형 : ${memberType}</span><br> 
									<span class="fw-bold" style="color: #000;">회원코드 : ${memberCode}</span><br>
									<c:if test="${memberType eq '교수'||memberType eq '학생'}">
										<span class="fw-bold" style="color: #000;">학과이름 : ${depNameOrLevel}</span>
									</c:if>
								</p>
							</div>
						</div>
						<div class="col-sm-5 text-center text-sm-left">
							<div class="card-body pb-0 px-0 px-md-4">
								<img src="../imgFile/lecture.png"
									height="140" alt="View Badge User"
									data-app-dark-img="illustrations/man-with-laptop-dark.png"
									data-app-light-img="illustrations/man-with-laptop-light.png" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 수강신청 폼 -->
		<div style="float: left; width: 55%;">
			<div class="card text-center">
				<h5 class="card-header">학과강의목록</h5>
				<!-- 전체강의 리스트 -->
				<div class="table-responsive text-nowrap">
					<table class="table text-center">
						<thead>
							<tr>
								<th width="20%" style="background-color: #999999; color: #fff;">강의코드</th>
								<th width="35%" style="background-color: #999999; color: #fff;">강의이름</th>
								<th width="20%" style="background-color: #999999; color: #fff;">담당교수</th>
								<th width="15%" style="background-color: #999999; color: #fff;">학점</th>
								<th width="10%" style="background-color: #999999; color: #fff;">담기</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="t" items="${openedList}">
								<tr>
									<td><strong>${t.openedLecNo}</strong></td>
									<td>${t.lectureName}</td>
									<td><span class="badge bg-label-primary me-1"></span>${t.memberName}</td>
									<td><span class="badge bg-label-secondary me-1"></span>${t.credit}</td>
									<td><button type="button" id="cartAddBtn" class="addBtn" value="${t.openedLecNo}">add</button></td>
								</tr>
								<input type="hidden" name="studentCode" id="studentCode" value="${memberCode}">
							</c:forEach>
						</tbody>
					</table>
				</div>
				<hr>
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
					<h5 class="card-header">내 강의 장바구니</h5>
					<div class="table-responsive text-nowrap">
						<table class="table text-center">
							<thead>
								<tr>
									<th width="20%" style="background-color: #999999; color: #fff;">강의코드</th>
									<th width="40%" style="background-color: #999999; color: #fff;">강의이름</th>
									<th width="20%" style="background-color: #999999; color: #fff;">학점</th>
									<th width="20%" style="background-color: #999999; color: #fff;">취소</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="c" items="${cartList}">
									<tr>
										<td><strong>${c.openedLecNo}</strong></td>
										<td>${c.lectureName}</td>
										<td><span class="badge bg-label-primary me-1"></span>${c.credit}</td>
										<td><button type="button" id="cartDeleteBtn" class="deleteBtn" value="${c.cartNo}">delete</button></td>
									</tr>
									<input type="hidden" name="openedLecNo2" value="${c.openedLecNo}">
									<input type="hidden" name="cartNo" value="${c.cartNo}">
									<input type="hidden" name="studentCode2" value="${memberCode}">
								</c:forEach>
								<c:forEach begin="0" end="${size}" var="b">
									<tr height="65">
										<td colspan="4">강의를 담아주세요</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="row" style="margin-top: 20px;">
						<div class="col-sm-8 col12"></div>
						<div class="col-sm-4 col12">
							<button type="button" id="lectureAddBtn" class="btn btn-dark">신청</button>
						</div>
					</div>
					<br/>
				</div>
			</div>
		</form>
	</div>
	<!-- / Main -->
<script>
	if("${errorMsg}" != '') {
		alert("${errorMsg}");
		location.href='studentLectureReg?memberCode='+"${memberCode}";
	}
</script>
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
					alert('이미 장바구니에 있는 과목입니다.');
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