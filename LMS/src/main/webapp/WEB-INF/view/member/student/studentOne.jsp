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
				<h5 class="card-header"><strong>${s.memberName}님의 정보</strong></h5>
				<hr class="my-0" />
				
				<div class="card-body">
					<table class="table table-bordered">
				<caption class="ms-4"></caption>
				<thead>
					<tr>
						<th>아이디</th>
						<td>${s.memberId}</td>
					</tr>
					<tr>
						<th>학번</th>
						<td>${s.studentCode}</td>
					</tr>
					<tr>
						<th>학과코드</th>
						<td>${s.departmentCode}</td>
					</tr>
					<tr>
						<th>학년</th>
						<td>${s.studentYear}</td>
					</tr>
					<tr>
						<th>학생상태</th>
						<td>${s.studentState}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${s.memberName}</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${s.memberGender}</td>
					</tr>
					<tr>
						<th>분류</th>
						<td>${s.memberType}</td>
					</tr>
					<tr>
						<th>생일</th>
						<td>${s.memberBirth}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${s.memberEmail}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${s.memberAddress}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${s.memberContact}</td>
					</tr>
					<tr>
						<th>계정활성화상태</th>
						<td>${s.active}</td>
					</tr>
					<tr>
						<th>계정생성일</th>
						<td>${s.createDate}</td>						
					</tr>
					<tr>
						<th>마지막 수정일</th>
						<td>${s.updateDate}</td>						
					</tr>
				</thead>
			</table>
			<!-- 추가 삭제 목록 버튼 -->
				<c:if test="${memberType eq '직원'}">
					<div style="margin-top: 20px;">
						<input type="hidden" id="memberId" name="memberId"  value="${s.memberId}">
						<a href="${pageContext.request.contextPath}/employee/modifyStudent?studentCode=${s.studentCode}" class="btn btn-primary" style="color: #fff;">수정</a>
						<button type="button" onclick="del(${s.studentCode})" class="btn btn-primary" style="color: #fff;">삭제</button>
						<a href="${pageContext.request.contextPath}/employee/studentList" class="btn btn-primary" style="color: #fff;">목록</a>
					</div>
				</c:if>
				<c:if test="${memberType eq '교수'}">
					<div class="container-info">
							<a href="${pageContext.request.contextPath}/student/studentList" class="btn btn-primary">목록</a>
					</div>
				</c:if>
				<c:if test="${memberType eq '학생'}">
					<div class="container-info">
							<a href="${pageContext.request.contextPath}/student/studentList" class="btn btn-primary">목록</a>
					</div>
				</c:if>
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
	
	function del(studentCode) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='removeStudent?studentCode='+studentCode;
		}
	}
	
</script>
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
