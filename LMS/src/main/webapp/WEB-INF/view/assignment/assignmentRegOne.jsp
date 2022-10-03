<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Header -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
<!-- studentMenu -->
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
				<a class="nav-link active" href="${pageContext.request.contextPath}/student/assignmentList?openedLecNo=${openedLecNo}">
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
	<hr class="my-5" />
	<!-- Main Contents -->
	
	<div class="product-status mg-b-15">
		<div class="container-fluid">
			<form action="${pageContext.request.contextPath}/student/modifyAssignmentReg" method="post">
			<input type="hidden" name="assignmentNo" value="${RegOne.assignmentNo}">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
						style="padding: 1%;">
						<div class="product-status-wrap drp-lst">
							<h4>과제 상세보기</h4>							
							<div class="container-info">
							<c:if test="${memberType eq '학생'}">
								<a href="${pageContext.request.contextPath}/student/modifyAssignmentReg?assignmentRegNo=${assignmentReg.assignmentRegNo}" 
								class= "btn btn-primary" type="button">과제 수정</a>
							</c:if>
							</div>
							<c:if test="${memberType eq '교수'}">
								<div class="container-info">
									<div>
									<a href="${pageContext.request.contextPath}/professor/assignmentScore?studentLecNo=${assignmentReg.studentLecNo}">
										학생 과제 제출 체점하기</a>
									</div>
								</div>
							</c:if>
							<hr>
							<div class="card bady">
							<div class="asset-inner">
								<table class="table">
									<tr>
										<th>제출한 과제번호</th>
										<td>${RegOne.assignmentNo}</td>			
									</tr>						
									<tr>
									<th>제목</th>
										<td>${RegOne.assignmentRegTitle}</td>
									</tr>
									<tr>
										<th>내용</th>
										<td>${RegOne.assignmentRegContent}</td>				
									</tr>
									<tr>
										<th>내 점수</th>
										<th>${RegOne.assignmentScore}</th>
									</tr>
									<tr>
										<th>작성일</th>
										<th>${RegOne.createDate}</th>
									</tr>
									<tr>
										<th>파일이름</th>
										<th>${RegOne.originName}</th>
									</tr>
										<tr>
										<th>업로드된 파일이름</th>
										<th>${RegOne.fileName}</th>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td> <img src ="${pageContext.request.contextPath}/imgFile/file/${RegOne.fileName}">
											<a href="${pageContext.request.contextPath}/downloadFile?fileName=${RegOne.fileName}&assignmentRegNo=${RegOne.assignmentRegNo}">${RegOne.originName}</a>
										</td>
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
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
