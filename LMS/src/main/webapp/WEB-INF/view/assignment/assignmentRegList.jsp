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
	<!-- studentMenu -->
	<div class="row">
		<div class="col-sm-9 col-12">
			<h4 class="fw-bold py-3 mb-4">
				<span class="text-muted fw-light">${memberName}
					${memberType}님 어서오세요 </span>
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
			<form action="${pageContext.request.contextPath}/student/assignmentRegList" method="post">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
						style="padding: 1%;">
						<div class="product-status-wrap drp-lst">
							<c:if test="${memberType eq '교수'}">
								<h4>학생이 제출한 과제목록</h4>	
							</c:if>
							<c:if test="${memberType eq '학생'}">
								<h4>내가 제출한 과제목록</h4>
							</c:if>
							
							<div class="card bady">
							<div class="asset-inner">
								<table class="table">
									<tr>
										<th>제출한 과제번호</th>
										<th>과제번호</th>
										<th>강의번호</th>
										<th>제출한 과제제목</th>
										<th>제출일자</th>
										<c:if test="${memberType eq '교수'}">
											<th>제출여부</th>
										</c:if>
										<c:if test="${memberType eq '학생'}">
											<th>내 점수</th>
										</c:if>
									</tr>
									<c:forEach var="a" items="${list}">
										<tr>
											<td>${a.assignmentRegNo}</td>
											<td>${a.assignmentNo}</td>
											<td>${a.openedLecNo}</td>
											<c:if test="${memberType eq '학생'}">
												<td><a href="${pageContext.request.contextPath}/student/assignmentRegOne?assignmentRegNo=${a.assignmentRegNo}&openedLecNo=${openedLecNo}" style="float: bottom;">
												${a.assignmentRegTitle}</a></td>
											</c:if>
											<c:if test="${memberType eq '교수'}">
												<td><a href="${pageContext.request.contextPath}/professor/assignmentRegOne?assignmentRegNo=${a.assignmentRegNo}&openedLecNo=${openedLecNo}" style="float: bottom;">
												${a.assignmentRegTitle}</a></td>
											</c:if>
											
											<td>${a.createDate}</td>
											<td>${a.assignmentDid}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
						</div>
					</div>
				</div>
			</form>
			<!-- </form> -->
		</div>
	</div>
	</div>
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
