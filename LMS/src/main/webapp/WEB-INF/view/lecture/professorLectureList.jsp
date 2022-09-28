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
		<div class="card text-center">
			<h5 class="card-header">수강중인 강의</h5>
			<div class="table-responsive text-nowrap">
				<table class="table">
					<caption class="ms-4">List of Lecture</caption>
					<thead>
						<tr>
							<th>강의명</th>
							<th>수강학생수</th>
							<th>개강일</th>
							<th>종강일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p" items="${list}">
							<tr>
								<td>
									<a href="${pageContext.request.contextPath}/professor/openedLectureOne?openedLecNo=${p.openedLecNo}">
										<strong>
											${p.lectureName}
										</strong>
									</a>		
								</td>
								<td>${p.currentStudentNum}명</td>
								<td>${p.openLectureDate}</td>
								<td>${p.closeLectureDate}</td>
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
