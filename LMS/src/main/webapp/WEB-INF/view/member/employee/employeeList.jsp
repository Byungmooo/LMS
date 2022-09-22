<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/include/employeeHeader.jsp"%>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<!-- Main -->

<div class="container-xxl flex-grow-1 container-p-y">
	
	<!-- employeeList -->
	<div class="card">
		<h5 class="card-header">직원리스트</h5>
		<div class="table-responsive text-nowrap">
			<table class="table">
			<caption class="ms-4"></caption>
							
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>직원코드</th>
						<th>권한</th>
						<th>재직상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="e" items="${list}">
						<tr>
							<td>${e.memberId}</td>
							<td><span class="badge bg-label-secondary me-1">
							<a href="${pageContext.request.contextPath}/member/employee/employeeOne?employeeCode=${e.employeeCode}">${e.memberName}</a>
								</span>
							</td>
							<td>${e.employeeCode}</td>
							<td>${e.authority}</td>				
							<td>${e.employeeState}</td>							
						</tr>
					</c:forEach>
				</tbody>
			
			</table>
		</div>
	</div>
</div>
<!--  end main -->
<%@ include file="/WEB-INF/view/include/footer.jsp"%>