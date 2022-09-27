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
			<span class="text-muted fw-light">"이름"님 /</span>${map.lectureName}
		</h4>
		
		<hr class="my-5" />
		
		<!-- studentAssignmentList -->
		<div class="card text-center">
			<h5 class="card-header">과제게시판</h5>
			<div class="table-responsive text-nowrap">
			<button class="btn btn-danger" type="button" style="float: right"
					onclick="location.href='${pageContext.request.contextPath}/assignment/AddAssignment'">글쓰기</button>
			
				<table class="table">
					<caption class="ms-4">List of Assignment</caption>
					<thead>
						<tr>
							<th width="10%">번호</th>
							<th width="50%">과제명</th>
							<th width="10%">등록</th>
							<th width="10%">평가</th>
							<th width="20%">날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="s" items="${assignmentList}">
							<tr>
								<td><strong>${s.assignmentNo}</strong></td>
								<td><a href="${pageContext.request.contextPath}/assignment/openedAssignmentOne?assignmentNo=${s.assignmentNo}">${s.assignmentTitle}</a></td>
								<td><span class="badge bg-label-primary me-1">${s.assignmentDid}</span></td>
								<td><span class="badge bg-label-secondary me-1">${s.assignmentScore}</span></td>
								<td>${s.createDate}</td>
								<td>${s.endDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- / Main -->
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
