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
		<h5 class="card-header">학생리스트</h5>
		<div class="table-responsive text-nowrap">
			<table class="table">
			<caption class="ms-4"></caption>
							
				<thead>
					<tr>
						<th>아이디</th>
						<th>학번</th>
						<th>부서코드</th>
						<th>학년</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="s" items="${list}">
						<tr>
							<td>${s.memberId}</td>
							<td>${s.memberName}</td>
							<td><span class="badge bg-label-secondary me-1">
								<a href="${pageContext.request.contextPath}/member/student/stunentOne?studentCode=${s.studentCode}">${s.studentCode}</a>
								</span>
							</td>
							<td>${s.departmentCode}</td>				
							<td>${s.studentYear}</td>					
							<td>${s.studentState}</td>							
						</tr>
					</c:forEach>
				</tbody>
			
			</table>
		</div>
	</div>
</div>
<!--  end main -->
<%@ include file="/WEB-INF/view/include/footer.jsp"%>