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
	
	<!-- 직원상세보기 -->
		<div class="row text-center">
			<div class="card">
				<h5 class="card-header"><strong>${e.memberName}님의 정보</strong></h5>
				<hr class="my-0" />
				
				<div class="card-body">
					<table class="table table-bordered">
						<caption class="ms-4"></caption>
						<thead>
							<tr>
								<th>아이디</th>
								<td>${e.memberId}</td>
							</tr>
							<tr>
								<th>직원코드</th>
								<td>${e.employeeCode}</td>
							</tr>
							<tr>
								<th>권한</th>
								<td>${e.authority}</td>
							</tr>
							<tr>
								<th>재직상태</th>
								<td>${e.employeeState}</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>${e.memberName}</td>
							</tr>
							<tr>
								<th>성별</th>
								<td>${e.memberGender}</td>
							</tr>
							<tr>
								<th>분류</th>
								<td>${e.memberType}</td>
							</tr>
							<tr>
								<th>생일</th>
								<td>${e.memberBirth}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${e.memberEmail}</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>${e.memberAddress}</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>${e.memberContact}</td>
							</tr>
							<tr>
								<th>계정활성화상태</th>
								<td>${e.active}</td>
							</tr>
							<tr>
								<th>계정생성일</th>
								<td>${e.createDate}</td>						
							</tr>
							<tr>
								<th>마지막 수정일</th>
								<td>${e.updateDate}</td>						
							</tr>
						</thead>
					</table>
					<!-- 추가 삭제 목록 버튼 -->
					<div style="margin-top: 20px;">
						<input type="hidden" id="memberId" name="memberId"  value="${e.memberId}">
						<a href="${pageContext.request.contextPath}/employee/modifyEmployee?employeeCode=${e.employeeCode}" class="btn btn-primary" style="color: #fff;">수정</a>
						<button type="button" onclick="del(${e.employeeCode})" class="btn btn-primary" style="color: #fff;">삭제</button>
						<a href="${pageContext.request.contextPath}/employee/employeeList" class="btn btn-primary" style="color: #fff;">목록</a>
					</div>
				</div>
			</div>
		</div>
	</div>	
<script>
	if("${errorMsg}" != '') {
		alert("${errorMsg}");
	}
</script>
<script>
	
	function del(employeeCode) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='removeEmployee?employeeCode='+employeeCode;
		}
	}
	
</script>
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
