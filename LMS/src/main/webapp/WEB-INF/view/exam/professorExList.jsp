<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/include/studentHeader.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="fw-bold py-3 mb-4">
			<span class="text-muted fw-light">"교수이름"님 /</span>Example
		</h4>
		<hr class="my-5" />
		
		<!-- professor Example List -->
		<div class="card">
			<h5 class="card-header">시험지 목록</h5>
			<div class="table-responsive text-nowrap">
				<table class="table">
					<caption class="ms-4">Example ${memberType}.Ver/ 안녕하세요. ${memberName}님!</caption>
					<thead>
						<tr>
							<td>강의번호</td>
							<th>시험지번호</th>
							<th>시험지이름</th>
							<th>등록일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="e" items="${Exlist}">
							<tr>
								<td>${e.examNo}</td>
								<td><a href="${pageContext.request.contextPath}/exam/professorExList/${e.examNo}">
											${e.examName}</a></td>
								<td>${e.createDate}</td>
								<td>${e.updateDate}</td>
								
								<td>
									<div class="dropdown">
										<button type="button" class="btn p-0 dropdown-toggle hide-arrow"
											data-bs-toggle="dropdown">
											<i class="bx bx-dots-vertical-rounded"></i>
										</button>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="">
											<i class="bx bx-book me-1"></i>
												수정 <!-- 시험지수정 -->
											</a>
											<a class="dropdown-item" href="">
											<i class="bx bx-book me-1"></i>
												삭제 <!-- 시험지삭제 -->
											</a>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<hr>
				
				
				<a href="${pageContext.request.contextPath}/exam/professorAddExamSheet" style="float: right" class="btn btn-danger">시험지추가(교수)</a>
				
	</div>

	<!-- / Main -->
	
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
