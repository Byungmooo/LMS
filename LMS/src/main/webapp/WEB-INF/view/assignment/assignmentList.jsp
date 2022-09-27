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
			<form
				action="${pageContext.request.contextPath}/assignmentList"
				id="reportListForm" method="post">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
						style="padding: 1%;">
						<div class="product-status-wrap drp-lst">
							<h4>과제리스트</h4>
							<hr>
							<c:if test="${memberType eq '학생'}">
								<div class="container">
									<a href="${pageContext.request.contextPath}/assignmentRegListById">나의
										과제 제출 리스트</a>
								</div>
							</c:if>
							<c:if test="${memberType eq '교수'}">
								<div class="container-info">
									<div>
									<a href="${pageContext.request.contextPath}/assignmentList">
										학생 과제 제출 리스트</a>
									</div>
									<div>
									<a href="${pageContext.request.contextPath}/addAssignment?openedLecNo=${assignment.openedLecNo}">
										과제추가</a>
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
										<th>assignmentContent</th>
										<th>createDate</th>
										<th>Setting</th>
									</tr>
									<c:forEach var="assignment" items="${assignmentList}">
										<tr>
											<td>${assignment.assignmentNo}</td>
											<td>${assignment.openedLecNo}</td>
											<td>
												<a href="${pageContext.request.contextPath}/assignmentOne?assignmentNo=${assignment.assignmentNo}" style="float: bottom;">${assignment.assignmentTitle}</a>
											</td>
											<td>
												<div>
													<textarea name="assignmentContent" id="assignmentContent"
														style="width: 300px; border-color: white;" readonly>
														 ${assignment.assignmentContent}</textarea>
												</div>	
											</td>
											<td>${assignment.createDate}</td>
											
											
											<c:if test="${memberType eq '교수'}">
												<td><a
													href="${pageContext.request.contextPath}/modifyAssignment?assignmentNo=${assignment.assignmentNo}">
														<button data-toggle="tooltip" title="Edit"
															class="pd-setting-ed" type="button">
															<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
														</button>
												</a><a
													href="${pageContext.request.contextPath}/removeAssignment?assignmentNo=${assignment.assignmentNo}">
														<button data-toggle="tooltip" title="Trash"
															class="pd-setting-ed" type="button">
															<i class="fa fa-trash-o" aria-hidden="true"></i>
														</button>
												</a></td>
											</c:if>
											<c:if test="${memberType eq '학생'}">
												<td><a
													href="${pageContext.request.contextPath}/addassignmentReg?assignmentNo=${assignment.assignmentNo}">
														<button data-toggle="tooltip" title="submit"
															class="pd-setting-ed" type="button">
															<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
														</button>
												</a></td>
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
