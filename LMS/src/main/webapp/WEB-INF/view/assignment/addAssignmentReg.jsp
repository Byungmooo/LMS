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

	
	<div class="product-status mg-b-15">
		<div class="container-fluid">
			<form action="${pageContext.request.contextPath}/student/addAssignmentRegAction"
			enctype="multipart/form-data" id="addForm" method="post">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding:3%;">
						<div class="product-status-wrap drp-lst">
							<h4>과제 제출</h4>
							<hr>
							<div class="form-group">
								<label for="assignmentNo">제출해야할 과제 번호</label>
								<input name="assignmentNo" id="assignmentNo" type="text"
									 	value="${RegOne.assignmentNo}" class="form-control" >
							</div>
							<div class="form-group">
								<label for="studentLecNo">학생이 수강하고 있는 번호</label>
								<input name="studentLecNo" id="studentLecNo"  type="text"
									 	value="${RegOne.studentLecNo}"	class="form-control" >
							</div>
							<div class="form-group">
								<label for="assignmentRegTitle">과제 제목</label>
								<input name="assignmentRegTitle" id="assignmentRegTitle" type="text"
									 	value="${RegOne.assignmentRegTitle}" class="form-control">
							</div>
							<div class="form-group">
								<label for="assignmentRegContent">과제 내용</label>
								<textarea name="assignmentRegContent" id="assignmentRegContent" class="form-control"></textarea>
							</div>
							<div class="form-group">
								<label for="regFile">첨부파일1</label>
								<input name="regFile" id="regFile" type="file" class="form-control">
							</div>
						</div>
					</div>
					<div class="payment-adress">
					<button type="submit" class="btn btn-primary">과제 제출</button>
					
					</div>
				</div>
				<!-- row -->
			</form>
			<!-- </form> -->
		</div>
	</div>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
