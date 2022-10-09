<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.addr {
	display: block;
	overflow: hidden;
	width: 100%;
	height: 2.7rem;
	padding: 0.6rem;
	font-size: 1.2rem;
	color: #000;
	border-radius: 0.2rem;
	border: 1px solid #ccc;
	resize: none;
}
</style>
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
	<!-- studentLectureMenu -->
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
	<div>
		<ul class="nav nav-pills flex-column flex-md-row mb-3">
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/student/openedLectureOne?openedLecNo=${openedLecNo}">
					<i class="bx bx-user me-1"></i> 강의홈
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/student/lectureNoticeList?openedLecNo=${openedLecNo}">
					<i class="bx bx-bell me-1"></i> 강의공지사항
			</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="${pageContext.request.contextPath}/professor/lectureQuestionList?openedLecNo=${sessionScope.openedLecNo}">
					<i class="bx bx-link-alt me-1"></i> 질문게시판
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/student/assignmentList?openedLecNo=${openedLecNo}">
					<i class="bx bx-link-alt me-1"></i> 과제게시판
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/student/lectureAttendanceList?openedLecNo=${openedLecNo}&memberCode=${memberCode}">
					<i class="bx bx-link-alt me-1"></i> 강의출석
			</a></li>
			<li class="nav-item"><a class="nav-link" href=""> <i
					class="bx bx-link-alt me-1"></i> 강의시험
			</a></li>

		</ul>
	</div>
	<!-- addLectureQuestion -->
	<div class="row text-center">
		<div class="card">
			<h5 class="card-header"><strong>질문답변</strong></h5>
			<div class="card-body">
				<form name="form"
					action="${pageContext.request.contextPath}/professor/addLectureAnswer"
					method="post">

					<table class="table table-bordered">
						<tr>
							<th>강의 번호</th>
							<td colspan="2"><input type="text" class="form-control"
								value="${question.openedLecNo}" readonly="readonly">
								<input type="hidden" name="openedLecNo"
								value="${question.openedLecNo}"></td>
						</tr>

						<tr>
							<th>교수이름</th>
							<td colspan="2"><input type="text" class="form-control"
								value="${sessionScope.memberName} 교수" readonly="readonly"> <input
								type="hidden" name="writer" value="테스트"></td>
						</tr>

						<tr>
							<th>제목</th>
							<td colspan="2"><input type="text" class="form-control" name="noticeTitle" id="title" size="110" value="${question.noticeTitle}" readonly="readonly"
								></td>
						</tr>
						<tr>
							<th>답변내용</th>
							<td colspan="2"><textarea class="form-control" name="answerContent" id="content" rows="10"
									cols="110" style="" placeholder="내용을 입력해주세요"></textarea></td>
						</tr>


					</table>
					<div class="text-center">
						<button class="btn btn-primary" type="button" id="btnAdd">답변등록</button>
						<button class="btn btn-primary" type="button" id="btnCancel"
							onclick="window.history.back()">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- / Main -->


<script>
    $(document).ready(function () {
        $("#btnAdd").click(function () {
      
            let content = $("#content").val();
  
            if (!content) {
                alert("내용을 입력하세요");
                document.form.content.focus();
                return;
            }
            document.form.submit();
        });
    });
</script>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
