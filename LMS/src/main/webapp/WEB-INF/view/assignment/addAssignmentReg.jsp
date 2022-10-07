<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
		    <span class="text-muted fw-light">${memberName}님 /</span> 과제 제출페이지 입니다.
		</h4>
		
		<hr class="my-5" />
		
		<!-- addTotalNotice -->
		<div class="row text-center">
			<div class="card">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding:3%;">
					<div class="product-status-wrap drp-lst">
						<div class="card-body">
							<form name="form" action="${pageContext.request.contextPath}/student/addAssignmentReg"
								enctype="multipart/form-data" method="post">
									<input type="hidden" name = "studentLecNo" value="${studentLecNo}">
									<input type="hidden" name = "assignmentNo" value="${assignmentNo}">
									<input type="hidden" name = "openedLecNo" value="${openedLecNo}">
								<div class="form-group">
									<label for="assignmentRegTitle">과제 제목</label>
									<input name="assignmentRegTitle" id="title" type="text" class="form-control">
								</div>
								<div class="form-group">
									<label for="assignmentRegContent">과제 내용</label>
									<textarea name="assignmentRegContent" id="content" class="form-control"></textarea>
								</div>
								<div class="form-group">
									<label for="regFile">첨부파일</label>
									<input name="regFile" id="regFile" type="file" class="form-control">
								</div>
						
								<div style="text-align: center;">
									<button class="btn btn-primary" type="submit">추가</button>
		                        	<button class="btn btn-info" type="submit" onclick="window.history.back()">취소</button>
	                    		</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- / Main -->
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
