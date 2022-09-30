<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/include/employeeHeader.jsp"%>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<!-- Main -->

<div class="container-xxl flex-grow-1 container-p-y">
	<div class="row">
			<div class="col-sm-9 col-12">
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">"${memberName}"님 /</span>${lectureName}
				</h4>
			</div>
			<div class="col-sm-3 col-12">
				<a class="btn btn-secondary" href="${pageContext.request.contextPath}/professor/departmentList?memberCode=${memberCode}" style="float: left;">
					학부리스트
				</a>
			</div>
		</div>
	
	<!-- employeeList -->
	<div class="card">
		<h5 class="card-header">교수리스트</h5>
		<div class="table-responsive text-nowrap">
			<table class="table">
			<caption class="ms-4"></caption>
							
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>교수코드</th>
						<th>학부코드</th>
						<th>학과장여부</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${list}">
						<tr>
							<td>${p.memberId}</td>
							<td>${p.memberName}</td>
							<td><span class="badge bg-label-secondary me-1">
								<a href="${pageContext.request.contextPath}/member/professor/stunentprofessorOne?professorCode=${p.professorCode}">${p.professorCode}</a>
								</span>
							</td>
							<td>${p.departmentCode}</td>				
							<td>${p.professorLeader}</td>					
							<td>${p.professorState}</td>							
						</tr>
					</c:forEach>
				</tbody>
			
			</table>
		</div>
	</div>
</div>
<!--  end main -->
<%@ include file="/WEB-INF/view/include/footer.jsp"%>