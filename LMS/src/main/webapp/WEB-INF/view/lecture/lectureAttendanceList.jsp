<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Header -->
<c:import url="/WEB-INF/view/include/studentHeader.jsp"></c:import>	

	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<!-- studentLectureMenu -->
		<div class="row">
			<div class="col-sm-9 col-12">
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">"${memberName}"님 /</span>${lectureName}
				</h4>
			</div>
			<div class="col-sm-3 col-12">
				<a class="btn btn-secondary" href="${pageContext.request.contextPath}/student/studentLectureList?memberCode=${memberCode}" style="float: right;">
					강의리스트
				</a>
			</div>
		</div>
		<div>
			<ul class="nav nav-pills flex-column flex-md-row mb-3">
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/student/openedLectureOne?openedLecNo=${openedLecNo}">
					<i class="bx bx-user me-1"></i>
						강의홈
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/student/lectureNoticeList?openedLecNo=${openedLecNo}">
					<i class="bx bx-bell me-1"></i> 
						강의공지사항
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/student/lectureQuestionList?openedLecNo=${openedLecNo}">
					<i class="bx bx-link-alt me-1"></i> 
						질문게시판
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/student/assignmentList?openedLecNo=${openedLecNo}">
					<i class="bx bx-link-alt me-1"></i> 
						과제게시판
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/student/lectureAttendanceList?openedLecNo=${openedLecNo}&memberCode=${memberCode}">
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
		</div>
		<hr class="my-5" />
		
		<!-- lectureAttendance -->
		<div class="card text-center">
			<h5 class="card-header">강의출석</h5>
			<div class="table-responsive text-nowrap">
				<table class="table table-borderless ">
					<caption class="ms-4">List of Lecture</caption>
					<thead>
						<tr>
							<th>번호</th>
							<th>강의날짜</th>
							<c:if test="${memberType eq '교수'}">
								<th>출석부</th>
							</c:if>
							<c:if test="${memberType eq '학생'}">
								<th>출석상태</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${day}" var="d">
							<c:forEach begin="1" end="${d.endDay+d.week-1}" var="i">
								<c:if test="${(i-d.week+1) > 0}">
									<c:forEach items="${lectureTime}" var="l">
										<c:if test="${i%7==(l.lectureYoil+1)}">
											<tr>
												<td>no</td>
												<td>${d.year} / ${d.month} / ${i-d.week+1}</td>
												<c:if test="${memberType eq '교수'}">
													<td>
														<a href="${pageContext.request.contextPath}/
															lectureAttendance?openedLecNo=${l.openedLecNo}&
															year=${d.year}&month=${d.month}&day=${i-d.week+1}" 
															class="btn btn-dark">
															check
														</a>
													</td>
												</c:if>
												<c:if test="${memberType eq '학생'}">
													<c:forEach items="${studentAttendance}" var="s">
														<c:if test="${s.attendanceYear==d.year&&s.attendanceMonth==d.month&&s.attendanceDay==(i-d.week+1)}">
															<td><span class="badge bg-label-primary me-1">${s.attendanceState}</span></td>
														</c:if>
													</c:forEach>
												</c:if>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
							</c:forEach>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- / Main -->
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
