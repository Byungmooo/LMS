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

	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="row">
			<div class="col-sm-3 col-12"></div>
			<div class="col-sm-6 col-12 text-center">
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">${memberName}
					${memberType}님 어서오세요 </span>
				</h4>
			</div>
			<c:if test="${memberType eq '학생'}">
				<div class="col-sm-3 col-12" style="float:right;">
					<a href="${pageContext.request.contextPath}/student/studentLectureList?memberCode=${memberCode}" 
						class="btn btn-secondary" style="float: right;">강의리스트</a>
				</div>
			</c:if>
			<c:if test="${memberType eq '교수'}">
				<div class="col-sm-3 col-12">
					<a href="${pageContext.request.contextPath}/professor/professorLectureList?memberCode=${memberCode}" 
						class="btn btn-secondary" style="float: right;">강의리스트</a>
				</div>
			</c:if>
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
			<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
						style="padding: 1%;">
						<div class="product-status-wrap drp-lst">
							<h4>과제 상세보기</h4>
												
							<div class="container-info">
						</div>
							<c:if test="${map.assignmentDid eq 'N'}">
								<c:if test="${memberType eq '교수'}">
									<div>
									<form action="${pageContext.request.contextPath}/professor/addAssignmentScore" method="post">
										<input type="hidden" name="assignmentRegNo" value="${map.assignmentRegNo}">
										<input type="hidden" name="openedLecNo" value="${openedLecNo}">
										<input type="hidden" name="studentLecNo" value="${map.studentLecNo}">
										<input type="text" name="assignmentScore">
										<button type="submit" class= "btn btn-sm btn-primary">학생 과제 체점하기</button>
									</form>
									</div>
								</c:if>
							</c:if>
						<div class="card bady">
							<div class="asset-inner">
								<table class="table">
									<tr>
										<th>제출한 과제번호</th>
										<td>${map.assignmentNo}</td>			
									</tr>						
									<tr>
									<th>제목</th>
										<td>${map.assignmentRegTitle}</td>
									</tr>
									<tr>
										<th>내용</th>
										<td>${map.assignmentRegContent}</td>				
									</tr>
									<tr>
										<th>평가여부</th>
										<th>${map.assignmentDid}</th>
									</tr>
									<tr>
										<th>작성일</th>
										<th>${map.createDate}</th>
									</tr>
									<tr>
										<th>파일이름</th>
										<th>${map.originName}</th>
									</tr>
										<tr>
										<th>업로드된 파일이름</th>
										<th>${map.fileName}</th>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td> <img src ="${pageContext.request.contextPath}/imgFile/file/${map.fileName}">
											<a href="${pageContext.request.contextPath}/downloadFile?fileName=${map.fileName}&assignmentRegNo=${map.assignmentRegNo}">${map.originName}</a>
										</td>
									</tr>
								</table>
							</div>
						</div>
						</div>
					</div>
				</div>
				<c:if test="${sessionScope.memberType eq '학생'}">
					<form name="form" method="get" action = "${pageContext.request.contextPath}/student/removeAssignmentReg?openedLecNo=${sessionScope.openedLecNo}&assignmentRegNo=${map.assignmentRegNo}">
						<input type="hidden" name="openedLecNo" value="${sessionScope.openedLecNo}">
						<input type="hidden" name="assignmentRegNo" value="${map.assignmentRegNo}">
						<button	class="btn  btn-primary" type="button" id="btnDelete">삭제</button>
						<button	class="btn  btn-primary" type="button" id="btnUpdate">수정</button>
					</form>
				</c:if>
			</div>
		</div>
	</div>
    <script>
	if("${param.errorMsg}" != '') {
		alert("${param.errorMsg}");
	}
    
    $(document).ready(function () {
        $("#btnDelete").click(function () {
            if (confirm("삭제하시겠습니까?")) {
            	document.form.action = "${pageContext.request.contextPath}/student/removeAssignmentReg?openedLecNo=${sessionScope.openedLecNo}&assignmentRegNo=${map.assignmentRegNo}";
                document.form.method = "get";
                document.form.submit();
            }
    });
    
        $("#btnUpdate").click(function () {
            if (confirm("수정하시겠습니까?")) {
            	alert("등록된 과제는 수정 할 수 없습니다");
        	}
            
    });
});
</script>
    
    <!-- Footer -->
    <c:import url="/WEB-INF/view/include/footer.jsp"></c:import>

