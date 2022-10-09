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
		
		<!-- lectureMenu -->
		<div>
			<ul class="nav nav-pills flex-column flex-md-row mb-3">
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/
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
					<a class="nav-link" href="${pageContext.request.contextPath}/
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
		<!-- studentLectureOne -->
		<div class="row text-center">
			<div class="card">
				<h5 class="card-header"><strong>강의상세보기</strong></h5>				
				<div class="card-body">
					<table class="table table-bordered">
						<tr>
							<th>담당교수</th>
							<td>${map.professorName}</td>
							<th>교과구분</th>
							<td>${map.lectureType}</td>
							<th>이수학점</th>
							<td>${map.credit}</td>
						</tr>
						<tr>
							<th>개설학부</th>
							<td>${map.departmentName}</td>
							<th>개설년도</th>
							<td>${map.lectureYear}</td>
							<th>개설학기</th>
							<td>${map.lectureSemester}</td>
						</tr>
						<tr>
							<th>강의장소</th>
							<td>${map.buildingName} / ${map.classroomName}</td>
							<th>강의정원</th>
							<td>${map.studentNum}</td>
							<th>신청인원</th>
							<td>16</td>							
						</tr>
						<tr>
							<th>강의계획서</th>
							<td colspan="5"><textarea class="form-control" rows="15px" readonly="readonly" style="background-color:#fff;">${map.syllabus}</textarea></td>
						</tr>
					</table>

				</div>
			</div>
		</div>
	</div>
	<!-- / Main -->
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
