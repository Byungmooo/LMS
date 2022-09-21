<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<span class="text-muted fw-light">${totalNotice.writer} 님 /</span>
		</h4>
		
		<!-- studentLectureMenu -->
		<ul class="nav nav-pills flex-column flex-md-row mb-3">
			<li class="nav-item">
				<a class="nav-link active" href="">
				<i class="bx bx-user me-1"></i>
					LMS홈
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="">
				<i class="bx bx-bell me-1"></i> 
					전체게시판
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="">
				<i class="bx bx-link-alt me-1"></i> 
					학사게시판
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="">
				<i class="bx bx-link-alt me-1"></i> 
					질문게시판
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/student/studentAssignmentList?openedLecNo=${map.openedLecNo}">
				<i class="bx bx-link-alt me-1"></i> 
					과제게시판
				</a>
			</li>
		
	
		</ul>
		<hr class="my-5" />
		
		<!-- studentLectureOne -->
		<div class="row text-center">
			<div class="card">
				<h5 class="card-header"><strong>제목 : ${totalNotice.noticeTitle}</strong></h5>
				<hr class="my-0" />
				
				<div class="card-body">
					<table class="table table-bordered">
					
						<tr>
							<th>작성자</th>
							<td>${totalNotice.writer}</td>
							<th>부서코드</th>
							<td>${totalNotice.departmentCode}</td>
							<th>조회수</th>
							<td>${totalNotice.views}</td>
						</tr>
						<tr>
							<th>등록일</th>
							<td>${totalNotice.createDate}</td>
							<th>수정일</th>
							<td>${totalNotice.updateDate}</td>
				
						</tr>
		
						<tr>
							<th>내용</th>
							<td colspan="5"><textarea class="form-control" rows="20px" readonly="readonly" style="background-color:#fff;">${totalNotice.noticeContent}</textarea></td>
						</tr>
					</table>
								<div>				
					<a href="${pageContext.request.contextPath}/updateTotalNotice/${totalNotice.noticeNo}"
							class="btn btn-warning">수정</a>
					<a href="${pageContext.request.contextPath}/removeTotalNotice?noticeNo=${totalNotice.noticeNo}"
							class="btn btn-info">삭제</a>
					<a href="javascript:window.history.back()"
							class="btn btn-primary">목록</a>
				</div>

				</div>
			</div>
		</div>
	</div>
	<!-- / Main -->

<%@ include file="/WEB-INF/view/include/footer.jsp"%>
