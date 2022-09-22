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
		
		<!-- studentLectureMenu -->
		<ul class="nav nav-pills flex-column flex-md-row mb-3">
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/student/studentLectureOne?openedLecNo=${map.openedLecNo}">
				<i class="bx bx-user me-1"></i>
					강의홈
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/member/studentLectureOne?openedLecNo=${map.openedLecNo}">
				<i class="bx bx-bell me-1"></i> 
					강의공지사항
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="">
				<i class="bx bx-link-alt me-1"></i> 
					질문게시판
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link active" href="${pageContext.request.contextPath}/student/studentAssignmentList?openedLecNo=${map.openedLecNo}&studentCode=${memberCode}">
				<i class="bx bx-link-alt me-1"></i> 
					과제게시판
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="">
				<i class="bx bx-link-alt me-1"></i> 
					강의출석
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="">
				<i class="bx bx-link-alt me-1"></i> 
					강의시험
				</a>
			</li>
		</ul>
		<hr class="my-5" />
		
		<!-- studentAssignmentList -->
		<div class="card text-center">
			<h5 class="card-header">강의질문</h5>
			<div class="table-responsive text-nowrap">
				<table class="table">
					<caption class="ms-4">List of Assignment</caption>
					<thead>
						<tr>
							<th width="10%">번호</th>
							<th width="50%">제목</th>
							<th width="10%">답변여부</th>
							<th width="20%">날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="q" items="${question}">
							<tr>
								<td><strong>${q.lecQuestionNo}</strong></td>
								<td>
									<a href="${pageContext.request.contextPath}/student/lectureQuestionOne?lecQuestionNo=${q.lecQuestionNo}">
										${q.noticeTitle}
									</a>
								</td>
								<td><span class="badge bg-label-primary me-1"></span>${q.answerY}</td>
								<td><span class="badge bg-label-secondary me-1"></span>${q.createDate}</td>
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
