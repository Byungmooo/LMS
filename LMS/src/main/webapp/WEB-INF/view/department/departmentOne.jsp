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
	
	<!-- EmlpoyeeListOne -->
		<div class="row text-center">
			<div class="card">
				<h5 class="card-header"><strong>학과 상세보기</strong></h5>
				<hr class="my-0" />
				
				<div class="card-body">
					<table class="table table-bordered">
				<caption class="ms-4"></caption>
				<thead>
					<tr>
						<th>학과(부서)코드</th>
						<td>${d.departmentCode}</td>
					</tr>
					<tr>
						<th>학과(부서)이름</th>
						<td>${d.departmentName}</td>
					</tr>
					<tr>
						<th>학부 생성일</th>
						<td>${d.createDate}</td>						
					</tr>
					<tr>
						<th>마지막 수정일</th>
						<td>${d.updateDate}</td>						
					</tr>
				</thead>
			</table>
			<div>	
				<c:if test="${memberType eq '직원'}">
					<a href="${pageContext.request.contextPath}/member/modifyDepartment?departmentCode=${d.departmentCode}"
						class="btn btn-warning">수정</a>
					<form action="${pageContext.request.contextPath}/member/removeDepartment" method="post">
						<input type="hidden" name="departmentCode" value="${d.departmentCode}">
						<button class="btn btn-danger" onclick="deleteBtn()">삭제</button>
					</form>	
				</c:if>
				<c:if test="${memberType eq '교수'}">
					<div class="container-info">
							<a href="${pageContext.request.contextPath}/member/departmentList" class="btn btn-primary">목록</a>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	
	</div>
</div>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>


<script> 
function deleteBtn(){
	alert("삭제하시겠습니까??");
    document.form.submit();
}
</script>