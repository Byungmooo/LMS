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
								<h5 class="card-title text-primary">${memberName}</h5>
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
		
		<!-- studentLectureList -->
		<div class="card text-center">
			<h5 class="card-header">
				<c:set var="aDate" value="${date}"/>
				출석부 - ${fn:substring(aDate,0,4)} / ${fn:substring(aDate,4,6)} / ${fn:substring(aDate,6,8)}
			</h5>
			<div class="table-responsive text-nowrap">
				<table class="table">
					<caption class="ms-4">List of Lecture</caption>
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>학번</th>
							<th>출석체크</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="l" items="${list}">
							<tr>
								<td><strong><fmt:formatNumber type="number" maxFractionDigits="0" value="${l.listNo}"/></strong></td>
								<td>${l.memberName}</td>
								<td>${l.studentCode}</td>
								<td>
									<div class="dropdown">
										${l.attendanceState}
										<button type="button" class="btn p-0 dropdown-toggle hide-arrow"
											data-bs-toggle="dropdown">
											<i class="bx bx-dots-vertical-rounded"></i>
										</button>
										<div class="dropdown-menu">
											<form class="dropdown-item" action="${pageContext.request.contextPath}/professor/lectureAttendance" method="post">
												<input type="hidden" name="studentLecNo" value="${l.studentLecNo}">
												<input type="hidden" name="openedLecNo" value="${l.openedLecNo}">
												<input type="hidden" name="attendanceDate" value="${date}">
												<input type="hidden" name="attendanceState" value="출석">
												<i class="bx bx-book me-1"></i>
												<button type="submit" class="btn">출석</button>
											</form>
											<form class="dropdown-item" action="${pageContext.request.contextPath}/professor/lectureAttendance" method="post">
												<input type="hidden" name="studentLecNo" value="${l.studentLecNo}">
												<input type="hidden" name="openedLecNo" value="${l.openedLecNo}">
												<input type="hidden" name="attendanceDate" value="${date}">
												<input type="hidden" name="attendanceState" value="지각">
												<i class="bx bx-book me-1"></i>
												<button type="submit" class="btn">지각</button>
											</form>
											<form class="dropdown-item" action="${pageContext.request.contextPath}/professor/lectureAttendance" method="post">
												<input type="hidden" name="studentLecNo" value="${l.studentLecNo}">
												<input type="hidden" name="openedLecNo" value="${l.openedLecNo}">
												<input type="hidden" name="attendanceDate" value="${date}">
												<input type="hidden" name="attendanceState" value="조퇴">
												<i class="bx bx-book me-1"></i>
												<button type="submit" class="btn">조퇴</button>
											</form>
											<form class="dropdown-item" action="${pageContext.request.contextPath}/professor/lectureAttendance" method="post">
												<input type="hidden" name="studentLecNo" value="${l.studentLecNo}">
												<input type="hidden" name="openedLecNo" value="${l.openedLecNo}">
												<input type="hidden" name="attendanceDate" value="${date}">
												<input type="hidden" name="attendanceState" value="결석">
												<i class="bx bx-book me-1"></i>
												<button type="submit" class="btn">결석</button>
											</form>
										</div>
									</div>
								</td>
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
