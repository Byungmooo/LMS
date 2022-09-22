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
<!-- Main -->

<div class="container-xxl flex-grow-1 container-p-y">
	
	<!-- employeeList -->
	<div class="card">
		<h5 class="card-header">학생리스트</h5>
		<div class="table-responsive text-nowrap">
			<table class="table">
			<caption class="ms-4"></caption>
				<!-- 추가버튼 -->
				<div>				
					<a href="${pageContext.request.contextPath}/member/student/addStudent"
							class="btn btn-warning">추가</a>
				</div>			
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>학번</th>
						<th>학과코드</th>
						<th>학년</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="s" items="${list}">
						<tr>
							<td>${s.memberId}</td>
							<td><span class="badge bg-label-secondary me-1">
								<a href="${pageContext.request.contextPath}/member/student/studentOne?studentCode=${s.studentCode}">${s.memberName}</a>
								</span>
								</td>
							<td>${s.studentCode}</td>
							<td>${s.departmentCode}</td>				
							<td>${s.studentYear}</td>					
							<td>${s.studentState}</td>							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!--  search bar end -->
		
		<div style="display: block; text-align: center;">		
			<c:if test="${paging.prePage}">
				<a href="${pageContext.request.contextPath}/lecNotice?currentPage=${paging.currentPage-10}
					&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">이전</a>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
				<c:choose>
					<c:when test="${p == paging.currentPage }">
						<b>${p}</b>
					</c:when>
					<c:when test="${p != paging.currentPage }">
						<a href="${pageContext.request.contextPath}/lecNotice?currentPage=${p}
							&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">${p}</a>
					</c:when>
				</c:choose>
			</c:forEach>
			
			<c:if test="${paging.nextPage}">
				<a href="${pageContext.request.contextPath}/lecNotice?currentPage=${paging.currentPage+10}
					&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">다음</a>
			</c:if>
		</div>
</div>
<!--  end main -->
<%@ include file="/WEB-INF/view/include/footer.jsp"%>