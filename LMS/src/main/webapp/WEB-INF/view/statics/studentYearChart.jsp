<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<!-- studentLectureMenu -->
		<div class="row">
			<div class="col-sm-9 col-12">
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">"${memberName}"님 /</span>${lectureName}
				</h4>
			</div>
		
		</div>
		<div>
			<ul class="nav nav-pills flex-column flex-md-row mb-3">
				<li class="nav-item" >
					<a class="nav-link active" href="${pageContext.request.contextPath}/member/statics/studentYearChart">
					<i class="bx bx-user me-1"></i>
						학년별 통계
					</a>
					
				</li>
				<li class="nav-item" ">
					<a class="nav-link" href="${pageContext.request.contextPath}/member/statics/regionChart">
					<i class="bx bx-bell me-1"></i> 
						지역별 통계
					</a>
				</li>
				<li class="nav-item" ">
					<a class="nav-link" href="${pageContext.request.contextPath}/member/statics/departmentChart">
					<i class="bx bx-link-alt me-1"></i> 
						부서별 통계
					</a>
				</li>

	
			</ul>
		</div>
		
		
		<hr class="my-1" />
		




		
		
		</div>
									
	

	<!-- / Main -->
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 