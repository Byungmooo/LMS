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
			<form action="${pageContext.request.contextPath}/addAssignment" method="post">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding:3%;">
						<div class="product-status-wrap drp-lst">
							<h4>과제 출제</h4>
							<hr>
						
							<div class="form-group">
								<label for="assignmentTitle">assignmentTitle</label>
								<input name="assignmentTitle" id="assignmentTitle" type="text"
											class="form-control">
							</div>
							<div class="form-group">
								<label for="assignmentContent">assignmentContent</label>
								<textarea name="assignmentContent" id="assignmentContent"></textarea>
							</div>
							<div class="form-group">
								<label for="endDate">endDate</label>
								<input name="endDate" id="endDate" type="date"
											class="form-control">
							</div>
							
						</div>
					</div>
					<div class="payment-adress">
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</div>
				<!-- row -->
			</form>
			<!-- </form> -->
		</div>
	</div>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
