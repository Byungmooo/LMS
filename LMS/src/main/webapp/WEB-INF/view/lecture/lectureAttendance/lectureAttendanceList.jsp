<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
		<div class="row">
			<div class="col-sm-9 col-12"></div>
			<div class="col-sm-3 col-12">
				<a class="btn btn-secondary" href="${pageContext.request.contextPath}/
					<c:if test="${memberType eq '학생'}">student</c:if>
					<c:if test="${memberType eq '교수'}">professor</c:if>/studentLectureList?memberCode=${memberCode}" style="float: right;">
					강의리스트
				</a>
			</div>
		</div>
		
		<!-- lectureMenu -->
		<div>
			<ul class="nav nav-pills flex-column flex-md-row mb-3">
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/openedLectureOne?openedLecNo=${openedLecNo}">
					<i class="bx bx-user me-1"></i>
						강의상세
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureNoticeList?openedLecNo=${openedLecNo}">
					<i class="bx bx-bell me-1"></i> 
						강의공지사항
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureQuestionList?openedLecNo=${openedLecNo}">
					<i class="bx bx-link-alt me-1"></i> 
						질문게시판
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/assignmentList?openedLecNo=${openedLecNo}&studentCode=${memberCode}">
					<i class="bx bx-link-alt me-1"></i> 
						과제게시판
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureAttendanceList?openedLecNo=${openedLecNo}&memberCode=${memberCode}">
					<i class="bx bx-link-alt me-1"></i> 
						강의출석
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/

					<c:if test="${memberType eq '학생'}">exam/studentExList?openedLecNo=${openedLecNo}&memberCode=${memberCode}</c:if>

					<c:if test="${memberType eq '교수'}">exam/professorExList?openedLecNo=${openedLecNo}&memberCode=${memberCode}</c:if>">

					<i class="bx bx-link-alt me-1"></i> 
						강의시험
					</a>
				</li>
			</ul>
		</div>
		
		<!-- lectureAttendance -->
		<div class="card text-center">
			<h5 class="card-header">강의출석</h5>
			<div class="table-responsive text-nowrap">
				<table class="table table-bordered ">
					<caption class="ms-4">List of Attendance</caption>
					<thead>
						<tr>
							<c:if test="${memberType eq '교수'}">
								<th>강의날짜</th>
								<th>출석부</th>
								<th>강의날짜</th>
								<th>출석부</th>
								<th>강의날짜</th>
								<th>출석부</th>
							</c:if>
							<c:if test="${memberType eq '학생'}">
								<th>강의날짜</th>
								<th>출석상태</th>
								<th>강의날짜</th>
								<th>출석상태</th>
								<th>강의날짜</th>
								<th>출석상태</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<c:set var="i" value="0" />
						<c:if test="${memberType eq '교수'}">
							<c:forEach items="${lectureTime}" var="l">
								<c:set var="date" value="${l.attendanceDate}"/>
								<c:if test="${i%3 == 0 }">
								    <tr>
								</c:if>
									<td>${fn:substring(date,0,4)} / ${fn:substring(date,4,6)} / ${fn:substring(date,6,8)}</td>
									<td>
										<a href="${pageContext.request.contextPath}/professor/
											lectureAttendance?openedLecNo=${openedLecNo}&attendanceDate=${l.attendanceDate}" 
											class="btn btn-dark">
											click
										</a>
									</td>
								<c:if test="${i%3 == 2}">
									</tr>
								</c:if>
								<c:set var="i" value="${i+1}" />
							</c:forEach>
						</c:if>	
						<c:if test="${memberType eq '학생'}">
							<c:forEach items="${studentAttendance}" var="l">
								<c:set var="date" value="${l.attendanceDate}"/>
								<c:if test="${i%3 == 0 }">
								    <tr>
								</c:if>
									<td>${fn:substring(date,0,4)} / ${fn:substring(date,5,7)} / ${fn:substring(date,8,10)}</td>
									<td>
										<c:if test="${!(l.attendanceState eq '대기중')}">
											<span class="badge bg-label-primary me-1">${l.attendanceState}</span>
										</c:if>
										<c:if test="${l.attendanceState eq '대기중'}">
											<span class="badge bg-label-secondary me-1">${l.attendanceState}</span>
										</c:if>
									</td>
								<c:if test="${i%3 == 2}">
									</tr>
								</c:if>
								<c:set var="i" value="${i+1}" />
							</c:forEach>
						</c:if>				
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- / Main -->
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
