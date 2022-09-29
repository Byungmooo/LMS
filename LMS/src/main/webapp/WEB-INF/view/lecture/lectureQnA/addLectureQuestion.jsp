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
	<div class="row">
		<div class="col-sm-9 col-12">
			<h4 class="fw-bold py-3 mb-4">
				<span class="text-muted fw-light">"${memberName}"님 /</span>${lectureName}
			</h4>
		</div>
		<div class="col-sm-3 col-12" style="float: right;">
			<a class="btn btn btn-primary"
				href="${pageContext.request.contextPath}/student/studentLectureList?memberCode=${memberCode}"
				style="float: right;"> 강의리스트 </a>
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
				href="${pageContext.request.contextPath}/student/lectureQuestionList?openedLecNo=${openedLecNo}">
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


	<hr class="my-1" />


	<!-- addLectureQuestion -->
	<div class="row text-center">
		<div class="card">
			<h5 class="card-header">
				<strong>강의 질문</strong>
			</h5>
			<hr class="my-0" />

			<div class="card-body">
				<form name="form"
					action="${pageContext.request.contextPath}/student/addLectureQuestion"
					method="post">


					<%--                    <input type="hidden" name="memberId" value="${session.id}">--%>

					<table class="table table-bordered">
						<tr>
							<th>강의 번호</th>
							<td colspan="2"><input type="text" class="form-control"
								value="${sessionScope.openedLecNo}" readonly="readonly">
								<input type="hidden" name="openedLecNo"
								value="${sessionScope.openedLecNo}"></td>
						</tr>

						<tr>
							<th>작성자</th>
							<td colspan="2"><input type="text" class="form-control"
								value="${sessionScope.memberName}" readonly="readonly"> <input
								type="hidden" name="writer" value="${sessionScope.memberName}"></td>
						</tr>

						<tr>
							<th>제목</th>
							<td><input name="noticeTitle" id="title" size="110" value=""
								placeholder="제목을 입력해주세요"></td>
						</tr>
						<tr>
							<th>질문내용</th>
							<td ><textarea name="noticeContent" id="content" rows="10"
									cols="110" style="" placeholder="내용을 입력해주세요"></textarea></td>
						</tr>


					</table>
					<div style="width: 650px; text-align: right;">
						<button class="btn btn-primary" type="button" id="btnAdd">질문등록</button>
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
            let title = $("#title").val();
            let content = $("#content").val();
            if (!title) {
                alert("제목을 입력하세요");
                document.form.title.focus();
                return;
            }
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
