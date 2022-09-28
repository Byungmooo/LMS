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
			<span class="text-muted fw-light">${memberName}님 /</span>강의
		</h4>
		<hr class="my-5" />
		
		<!-- studentLectureList -->
		<div class="card">
			<h5 class="card-header">수강중인 강의</h5>
			<div class="table-responsive text-nowrap">
				<table class="table">
					<caption class="ms-4">List of Lecture</caption>
					<thead>
						<tr>
							<th>강의명</th>
							<th>담당교수</th>
							<th>강의종류</th>
							<th>학점</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="s" items="${list}">
							<tr>
								<td>
									<a href="${pageContext.request.contextPath}/student/openedLectureOne?openedLecNo=${s.openedLecNo}">
										<strong>
											${s.lectureName}
										</strong>
									</a>		
								</td>
								<td>${s.professorName}</td>
								<td><span class="badge bg-label-primary me-1">${s.lectureType}</span></td>
								<td><span class="badge bg-label-secondary me-1">${s.credit}</span></td>
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
