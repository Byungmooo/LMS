<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Header -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
	<div class="row" style="margin-bottom: 20px;">
		<div class="col-sm-9 col-12"></div>
		<div class="col-sm-3 col-12">
			<a class="btn btn-secondary"
				href="${pageContext.request.contextPath}/
					<c:if test="${memberType eq '학생'}">student</c:if>
					<c:if test="${memberType eq '교수'}">professor</c:if>/studentLectureList?memberCode=${memberCode}"
				style="float: right;"> 강의리스트 </a>
		</div>
	</div>

	<!-- lectureMenu -->
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
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/
					<c:if test="${memberType eq '학생'}">exam/studentExList?openedLecNo=${openedLecNo}&memberCode=${memberCode}</c:if>
					<c:if test="${memberType eq '교수'}">exam/professorExList?openedLecNo=${openedLecNo}&memberCode=${memberCode}</c:if>">
					<i class="bx bx-link-alt me-1"></i> 강의시험
			</a></li>
		</ul>
	</div>
	<!-- Main Contents -->

	<div class="product-status mg-b-15">
		<div class="container-fluid">
			<div class="row">
				<div class="card">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
						style="padding: 1%;">
						<div class="product-status-wrap drp-lst">
							<div class="card-header">
								<h4 class="text center">과제 상세보기</h4>
							</div>
							<div class="container-info"></div>
							<c:if test="${map.assignmentDid eq 'N'}">
								<c:if test="${memberType eq '교수'}">
									<div class="row">
										<form action="${pageContext.request.contextPath}/professor/addAssignmentScore"
											method="post">
											<input type="hidden" name="assignmentRegNo" value="${map.assignmentRegNo}"> 
											<input type="hidden" name="openedLecNo" value="${openedLecNo}"> 
											<input type="hidden" name="studentLecNo" value="${map.studentLecNo}">
											<div class="col-sm-3 col12"></div>
											<div class="col-sm-6 col12">
												<input type="text" name="assignmentScore" class="form-control">
											</div> 
											<div class="col-sm-3 col12">
											<button type="submit" class="btn btn-sm btn-primary">학생
												과제 체점하기</button>
											</div>
										</form>
									</div>
								</c:if>
							</c:if>
							<div class="card bady">
								<table class="table table-boarderd">
									<tr>
										<th width="20%">제출한 과제번호</th>
										<td width="10%">${map.assignmentNo}</td>
										<th width="20%">평가여부</th>
										<th width="10%">${map.assignmentDid}</th>
										<th width="10%">작성일</th>
										<th width="30%">${map.createDate}</th>
									</tr>
									<tr>
										<th>제목</th>
										<td colspan="5">${map.assignmentRegTitle}</td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="5"><textarea rows="10px" class="form-control">${map.assignmentRegContent}</textarea></td>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td colspan="5"><img src="${pageContext.request.contextPath}/imgFile/file/${map.fileName}" width=300>
											<a href="${pageContext.request.contextPath}/downloadFile?fileName=${map.fileName}&assignmentRegNo=${map.assignmentRegNo}">${map.originName}</a>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="text-center">
						<c:if test="${sessionScope.memberType eq '학생'}">
							<form name="form" method="get"
								action="${pageContext.request.contextPath}/student/removeAssignmentReg?openedLecNo=${sessionScope.openedLecNo}&assignmentRegNo=${map.assignmentRegNo}">
								<input type="hidden" name="openedLecNo"
									value="${sessionScope.openedLecNo}"> <input type="hidden"
									name="assignmentRegNo" value="${map.assignmentRegNo}">
								<button class="btn  btn-primary" type="button" id="btnDelete">삭제</button>
								<button class="btn  btn-primary" type="button" id="btnUpdate">수정</button>
							</form>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		if ("${param.errorMsg}" != '') {
			alert("${param.errorMsg}");
		}

		$(document)
				.ready(
						function() {
							$("#btnDelete")
									.click(
											function() {
												if (confirm("삭제하시겠습니까?")) {
													document.form.action = "${pageContext.request.contextPath}/student/removeAssignmentReg?openedLecNo=${sessionScope.openedLecNo}&assignmentRegNo=${map.assignmentRegNo}";
													document.form.method = "get";
													document.form.submit();
												}
											});

							$("#btnUpdate").click(function() {
								if (confirm("수정하시겠습니까?")) {
									alert("등록된 과제는 수정 할 수 없습니다");
								}

							});
						});
	</script>

	<!-- Footer -->
	<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>