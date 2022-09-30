<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Header -->
<c:choose>
	<c:when test="${memberType eq '학생'}">
		<c:import url="/WEB-INF/view/include/studentHeader.jsp"></c:import>	
	</c:when>
	<c:when test="${memberType eq '교수'}">
		<c:import url="/WEB-INF/view/include/professorHeader.jsp"></c:import>	
	</c:when>
	<c:when test="${memberType eq '직원'}">
		<c:import url="/WEB-INF/view/include/employeeHeader.jsp"></c:import>	
	</c:when>
	<c:otherwise>	
	</c:otherwise>
</c:choose>
	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="fw-bold py-3 mb-4">
			<span class="text-muted fw-light">${memberName}님 / <strong>전체강의</strong></span>
		</h4>
		<hr class="my-5" />
		
		<div class="card text-center">
			<h5 class="card-header">강의신청</h5>
				
			<!-- 전체강의 리스트 -->
			<div class="table-responsive text-nowrap">
				<table class="table">
					<thead>
						<tr>
							<th width="50%">강의이름</th>
							<th width="20%">작성자</th>
							<th width="10%">학점</th>
							<th width="20%">신청</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="t" items="${totalDepLectureList}">
							<tr>
								<td>${t.lectureName}</td>
								<td>${t.lectureType}</td>
								<td><span class="badge bg-label-secondary me-1"></span>${t.credit}</td>
								<td><a href="${pageContext.request.contextPath}/professor/professorAddLecture?lectureCode=${t.lectureCode}" class="btn btn-primary">add</a>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<hr class="my-3" />
			
			<!-- 검색 -->
			<form action="${pageContext.request.contextPath}/professor/professorLectureReg" method="get">
				<div class="row">
					<div class="col-sm-4 col-12 text-center">
					</div>
					<div class="col-sm-4 col-12 text-center">
						<input type="hidden" name="memberCode" id="memberCode" value="${memberCode}">
						<input type="text" name="keyword" class="form-control" placeholder="과목이름을 입력하세요">
					</div>
					<div class="col-sm-2 col-12 text-center">
						<button type="submit" class="btn btn-dark">검색</button>
					</div>
				</div>
			</form>
			
			<!-- 페이징 -->
			<div class="row text-center" style="margin-top: 20px;">
				<div class="col-sm-4 col-12 text-center">
				</div>
				<div class="col-sm-4 col-12 text-center">
					<ul class="pagination justify-content-center">
						<c:if test="${paging.prePage}">
							<li class="page-item prev">
								<a class="page-link" href="${pageContext.request.contextPath}/professor/professorLectureReg?currentPage=${paging.currentPage-1}
									&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&memberCode=${memberCode}">
								<i class="tf-icon bx bx-chevron-left"></i>
								</a>
							</li>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
							<c:choose>
								<c:when test="${p == paging.currentPage }">
									<li class="page-item active">
										<a class="page-link" href="#">${p}</a>
									</li>
								</c:when>
								<c:when test="${p != paging.currentPage }">
									<li class="page-item">
										<a class="page-link" href="${pageContext.request.contextPath}/professor/professorLectureReg?currentPage=${p}
										&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&memberCode=${memberCode}">${p}</a>
									</li>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.nextPage}">
							<li class="page-item next">
								<a class="page-link" href="${pageContext.request.contextPath}/professor/professorLectureReg?currentPage=${paging.currentPage+1}
									&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&memberCode=${memberCode}">
								<i class="tf-icon bx bx-chevron-right"></i>
								</a>
							</li>
						</c:if>
					</ul>
				</div>
				<div class="col-sm-4 col-12 text-center">
				</div>	
			</div>
		</div>
	</div>
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>