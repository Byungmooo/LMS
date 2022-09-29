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

	<!-- Main Contents -->
	
	<div class="product-status mg-b-15">
		<div class="container-fluid">
			<form action="${pageContext.request.contextPath}/assignmentRegList" method="post">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
						style="padding: 1%;">
						<div class="product-status-wrap drp-lst">
							<h4>과제리스트</h4>
							<hr>
							<c:if test="${memberType eq '학생'}">
								<div class="container">
									<a href="${pageContext.request.contextPath}/assignmenMytRegList">나의
										과제 제출 리스트</a>
								</div>
							</c:if>
							<c:if test="${memberType eq '교수'}">
								<div class="container-info">
									<div>
									<a href="${pageContext.request.contextPath}/assignmentScore?studentLecNo=${assignmentReg.studentLecNo}">
										학생 과제 제출 체점하기</a>
									</div>
								</div>
							</c:if>
							<div class="card bady">
							<div class="asset-inner">
								<table class="table">
									<tr>
										<th>assignmentNo</th>
										<th>openedLecNo</th>
										<th>assignmentTitle</th>
										<th>createDate</th>
										<th>score</th>
										<th>Setting</th>
									</tr>
									<c:forEach var="assignmentReg" items="${assignmentRegList}">
										<tr>
											<td>${assignmentReg.assignmentNo}</td>
											<td>${assignmentReg.openedLecNo}</td>
											<td>
												<a href="${pageContext.request.contextPath}/assignmentRegOne?assignmentRegNo=${assignmentReg.assignmentRegNo}" style="float: bottom;">
												${assignmentReg.assignmentRegTitle}</a>
											</td>
											<td>${assignmentReg.createDate}</td>
											<td>${assignmentReg.assignmentScore}</td>
											
											
											<c:if test="${memberType eq '학생'}">
												<td><a href="${pageContext.request.contextPath}/addAssignmentReg?assignmentRegNo=${assignmentReg.assignmentRegNo}" class= "btn btn-primary">
												과제 제출</a></td>
											</c:if>
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
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
