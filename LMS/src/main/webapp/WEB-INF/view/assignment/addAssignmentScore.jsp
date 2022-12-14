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
			<form action="${pageContext.request.contextPath}/professor/addAssignmentScore" method="post">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding:3%;">
						<div class="product-status-wrap drp-lst">
							<h4>${assignmentRegNo}번 과제 점수입력</h4>
							<hr>
							<input type="hidden" name="openedLecNo" value="${openedLecNo}">
							<input type="hidden" name="assignmentRegNo" value="${assignmentRegNo}">
							<table class="table">
								<tr>
									<th>과제 점수 입력</th>
									<td>
										<input type="text" name="assignmentScore" class="form-control">
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="payment-adress">
						<button type="submit" class="btn btn-primary">점수입력</button>
					</div>
				</div>
				<!-- row -->
			</form>
			<!-- </form> -->
		</div>
	</div>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
