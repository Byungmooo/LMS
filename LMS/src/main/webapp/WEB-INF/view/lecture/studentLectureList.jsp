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
		
		<!-- studentLectureList -->
		<div class="card text-center">
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
