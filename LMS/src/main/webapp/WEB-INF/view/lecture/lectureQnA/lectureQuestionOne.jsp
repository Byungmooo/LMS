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
			<li class="nav-item"><a class="nav-link active"
				href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureQuestionList?openedLecNo=${openedLecNo}">
					<i class="bx bx-link-alt me-1"></i> 질문게시판
			</a></li>
			<li class="nav-item"><a class="nav-link"
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

	<!-- studentLectureOne -->
	<div class="row text-center">
		<div class="card">
			<h5 class="card-header"><strong>질문상세보기</strong></h5>	
			<div class="card-body">
				<form name="form"
					action="${pageContext.request.contextPath}/student/removeLectrueQuestion"
					method="get">
					<table class="table table-bordered">
						<tr>
							<th>질문번호</th>
							<td>${question.lecQuestionNo}</td>
							<th>작성자</th>
							<td>${question.writer}</td>
							<th>답변여부</th>
							<td>${question.answerY}</td>
							<th>등록날짜</th>
							<td>${question.createDate}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="7">${question.noticeTitle}</td>
						</tr>
						<tr>
							<th>질문내용</th>
							<td colspan="7"><textarea class="form-control" rows="10px"
									readonly="readonly" style="background-color: #fff;">${question.noticeContent}</textarea>
							</td>
						</tr>

						<tr>
							<th>답변내용</th>
							<td colspan="7"><textarea class="form-control" rows="10px"
									readonly="readonly" style="background-color: #fff;">${answer.answerContent}</textarea></td>
						</tr>
					</table>
					<div>
						<!-- 목록 경로 수정해야함. -->

						<c:if test="${sessionScope.memberType eq '교수'}">
							<a
								href="${pageContext.request.contextPath}/professor/addLectureAnswer"
								class="btn btn-primary">답변하기</a>
							<a
								href="${pageContext.request.contextPath}/professor/lectureQuestionList?openedLecNo=${sessionScope.openedLecNo}"
								class="btn btn-primary">목록</a>
						</c:if>

						<c:if test="${sessionScope.memberType eq '학생'}">

							<a
								href="${pageContext.request.contextPath}/student/updateLectureQuestion/${lectureQuesion.lecQuestionNo}"
								class="btn btn-primary">수정</a>

							<button class="btn btn-primary" type="button" id="btnDelete">삭제</button>
							<a
								href="${pageContext.request.contextPath}/student/lectureQuestionList?openedLecNo=${sessionScope.openedLecNo}"
								class="btn btn-primary">목록</a>
						</c:if>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- / Main -->

<script>
	if ("${param.errorMsg}" != '') {
		alert("${param.errorMsg}");
	}

	$(document).ready(function() {
			$("#btnDelete").click(function() {
				if (confirm("삭제하시겠습니까?")) {
					document.form.action = "${pageContext.request.contextPath}/student/removeLectrueQuestion?openedLecNo=${sessionScope.openedLecNo}";
					document.form.method = "get";
					document.form.submit();
				}
			});
		});
</script>

<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>
