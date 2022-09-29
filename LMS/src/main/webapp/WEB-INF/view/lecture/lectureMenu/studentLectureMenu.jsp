<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- studentLectureMenu -->
<div>
	<ul class="nav nav-pills flex-column flex-md-row mb-3">
		<li class="nav-item">
			<a class="nav-link active" href="${pageContext.request.contextPath}/student/openedLectureOne?openedLecNo=${openedLecNo}">
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
			<a class="nav-link" href="${pageContext.request.contextPath}/student/assignmentList?openedLecNo=${openedLecNo}&studentCode=${memberCode}">
			<i class="bx bx-link-alt me-1"></i> 
				과제게시판
			</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath}/student/lectureAttendanceList?openedLecNo=${openedLecNo}&memberCode=${memberCode}">
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
