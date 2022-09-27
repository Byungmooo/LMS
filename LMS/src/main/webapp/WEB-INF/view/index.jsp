<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<!-- Main -->
		<div class="container-xxl flex-grow-1 container-p-y">	  
			<!-- Row1 구분 -->
			<div class="row text-center">	    
				<div class="card h-100">
					<div class="card-header">
						<div class="card-title mb-0">
							<h5 class="m-0 me-2">${memberId}</h5>
							<small class="text-muted">${memberType}</small>
						</div>
					</div>
					<div class="card-body">
						${memberName}
						<br>
						${memberCode}
					</div>
				</div>
			</div>
			<!-- /Row1 구분 -->
		</div>
		<!-- /Main -->	
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 