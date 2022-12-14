<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="text-center">
			<h4 class="fw-bold py-3 mb-4">
				<span class="text-muted fw-light">"${memberName}"님의</span> 시험목록
			</h4>
		</div>
		
		<!-- studentLectureList -->
		<div class="card text-center">
			<h5 class="card-header">강의별 시험현황</h5>
			<div class="table-responsive text-nowrap">
				<table class="table">
					<caption class="ms-4">List of Lecture</caption>
					<thead>
						<tr>
							<th>강의명</th>
							<th>시험명</th>
							<th>시험점수</th>
							<th>출석점수</th>
							<th>과제점수</th>
							<th>총점</th>
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
								<td>
									<c:if test="${s.examName == null}">(NOT EXAM)</c:if>
									<c:if test="${s.examName != null}">${s.examName}</c:if>									
								</td>
								<td>
									<c:if test="${s.examScore<0}">0</c:if>
									<c:if test="${s.examScore>=0}">${s.examScore}</c:if>								
								</td>
								<td>
									<c:if test="${s.attendanceScore<0}">0</c:if>
									<c:if test="${s.attendanceScore>=0}">${s.attendanceScore}</c:if>
								</td>
								<td>
									<c:if test="${s.assignmentScore<0}">0</c:if>
									<c:if test="${s.assignmentScore>=0}">${s.assignmentScore}</c:if>								
								</td>	
								<td>
									<c:set  var="totalScore" value="${(s.examScore*0.4)+(s.attendanceScore*0.3)+(s.assignmentScore*0.3)}" />
									<c:if test="${totalScore<0}">0</c:if>
									<c:if test="${totalScore>0}">
									<fmt:formatNumber value="${totalScore }" pattern=".00"/></c:if>
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
