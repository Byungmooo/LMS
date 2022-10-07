<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
			<span class="text-muted fw-light"> ${memberName} / ${memberType}님 반갑습니다.</span>
		</h4>
		<hr class="my-5" />
		
		<!-- studentLectureOne -->
		<div class="row text-center">
			<div class="card">
				<h5 class="card-header"><strong>과제번호(${map.assingmentNo}) / 수정 Page</strong></h5>
				<hr class="my-0" />
				
				<div class="card-body">
					<form action="${pageContext.request.contextPath}/professor/modifyAssignment" 
								method="post" class="form-inline">
						<table class="table table-bordered">
							<tr>
								<th>과제 제목</th>
								<td colspan="2">
									<input type="text" name="assignmentTitle" class="form-control" value="${map.assignmentTitle}">
								</td>
							</tr>
							<tr>
								<th>과제 내용</th>
								<td colspan="2">
									<input type="text" name="assignmentContent" class="form-control" value="${map.assignmentContent}">
								</td>
							</tr>
							<tr>
								<th>제출 기한</th>
								<td colspan="1">
									<input type="date" name="endDate" class="form-control" value="${map.endDate}">
								</td>
							</tr>
						</table>
						<div style="margin-top: 20px;">
							<input type="hidden" name="assignmentNo" value="${map.assignmentNo}" >
							<button type="submit" class="btn btn-primary" style="color: #fff;">수정</button>
							<a href="${pageContext.request.contextPath}/professor/assignmentOne?assignmentNo=${map.assignmentNo}" 
									class="btn btn-primary" style="color: #fff;">취소</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- / Main -->
	
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 