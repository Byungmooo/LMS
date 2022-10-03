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


<!-- Main Contents -->
	
	<div class="product-status mg-b-15">
		<div class="container-fluid">
			<form action="${pageContext.request.contextPath}/modifyAssignment"
				method="post">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="product-status-wrap drp-lst">
							<h4>Modify assignment</h4>
							<hr>
							<div class="form-group">
								<input name="assignmentNo" type="hidden" value="${assignment.assignmentNo}">
							</div>
							<div class="form-group">
								<label for="openedLecNo">openedLecNo</label> <input
									name="openedLecNo" id="openedLecNo" type="text"
									class="form-control" value="${assignment.openedLecNo}" readonly>
							</div>
							<div class="form-group">
								<label for="assignmentTitle">assignmentTitle</label> <input
									name="assignmentTitle" id="reportTitle" type="text"
									class="form-control" value="${assignment.assignmentTitle}">
							</div>
							<div class="form-group edit-ta-resize res-mg-t-15">
								<label for="assignmentContent">assignmentContent</label>
								<textarea name="assignmentContent" id="assignmentContent">${assignment.assignmentContent}</textarea>
							</div>
							<div class="form-group">
								<label for="endDate">endDate</label> <input
									name="endDate" id="endDate" type="date"
									class="form-control" value="${assignment.endDate}">
							</div>
						</div>
						<div class="payment-adress">
							<button type="submit" class="btn btn-primary"
								style="float: right; margin-top: 3%; margin-right: 3%;">Submit</button>
						</div>
					</div>

				</div>
			</form>
			<!-- </form> -->
		</div>
	</div>
<!-- /Main -->
<%@ include file="/WEB-INF/view/include/footer.jsp" %>