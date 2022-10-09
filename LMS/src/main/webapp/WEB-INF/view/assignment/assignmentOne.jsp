<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<h5 class="card-title text-primary">${memberName}님어서오세요.</h5>
							<p class="mb-4">
								<span class="fw-bold" style="color: #000;">회원유형 :
									${memberType}</span><br> <span class="fw-bold"
									style="color: #000;">회원코드 : ${memberCode}</span><br>
								<c:if test="${memberType eq '교수'||memberType eq '학생'}">
									<span class="fw-bold" style="color: #000;">학과이름 :
										${depNameOrLevel}</span>
								</c:if>
							</p>
						</div>
					</div>
					<div class="col-sm-5 text-center text-sm-left">
						<div class="card-body pb-0 px-0 px-md-4">
							<img src="../imgFile/lecture.png" height="140"
								alt="View Badge User"
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
			<a class="btn btn-secondary"
				href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/studentLectureList?memberCode=${memberCode}"
				style="float: right;"> 강의리스트 </a>
		</div>
	</div>
	<div>
		<ul class="nav nav-pills flex-column flex-md-row mb-3">
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/openedLectureOne?openedLecNo=${openedLecNo}">
					<i class="bx bx-user me-1"></i> 강의상세
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureNoticeList?openedLecNo=${openedLecNo}">
					<i class="bx bx-bell me-1"></i> 강의공지사항
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureQuestionList?openedLecNo=${openedLecNo}">
					<i class="bx bx-link-alt me-1"></i> 질문게시판
			</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/assignmentList?openedLecNo=${openedLecNo}&studentCode=${memberCode}">
					<i class="bx bx-link-alt me-1"></i> 과제게시판
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureAttendanceList?openedLecNo=${openedLecNo}&memberCode=${memberCode}">
					<i class="bx bx-link-alt me-1"></i> 강의출석
			</a></li>
			<li class="nav-item"><a class="nav-link" href=""> <i
					class="bx bx-link-alt me-1"></i> 강의시험
			</a></li>
		</ul>
	</div>

	<div class="product-status mg-b-15">
		<div class="card">
			<div class="container-fluid">
				<form
					action="${pageContext.request.contextPath}/member/assignmentOne"
					method="get">
					<input type="hidden" name="assignmentNo" value="${assignmentNo}">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
							style="padding: 1%;">
							<div class="product-status-wrap drp-lst text-center">
								<h4>
									과제 상세보기
									<c:if test="${memberType eq '교수'}">
										<td><a
											href="${pageContext.request.contextPath}/professor/modifyAssignment?assignmentNo=${map.assignmentNo}"
											class="btn btn-sm btn-primary">수정 </a> <a
											href="${pageContext.request.contextPath}/professor/assignmentRegList?memberCode=${memberCode}&openedLecNo=${openedLecNo}&assignmentNo=${assignmentNo}"
											class="btn btn-sm btn-primary">학생 과제 제출 리스트</a></td>
									</c:if>
									<c:if test="${memberType eq '학생'}">
										<c:if test="${map.assignmentNo != 0}">
											<td><a
												href="${pageContext.request.contextPath}/student/addAssignmentReg?openedLecNo=${map.openedLecNo}&assignmentNo=${map.assignmentNo}&studentCode=${memberCode}"
												class="btn btn-sm btn-primary">과제 제출</a></td>
											<td><a
												href="${pageContext.request.contextPath}/student/assignmentRegList?openedLecNo=${map.openedLecNo}&assignmentNo=${map.assignmentNo}&studentCode=${memberCode}"
												class="btn btn-sm btn-primary">나의 과제 리스트</a></td>
										</c:if>
									</c:if>
								</h4>
								<div class="card bady">
									<div class="asset-inner">
										<table class="table">
											<tr>
												<th>과제번호</th>
												<td>${map.assignmentNo}</td>
											</tr>
											<tr>
												<th>수강중인 강의번호</th>
												<td>${map.openedLecNo}</td>
											</tr>
											<tr>
												<th>제목</th>
												<td>${map.assignmentTitle}</td>
											</tr>
											<tr>
												<th>내용</th>
												<td>${map.assignmentContent}</td>
											</tr>
											<tr>
												<th>제출기한</th>
												<th>${map.endDate}</th>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>