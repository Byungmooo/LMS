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
	<div class="row" style="margin-bottom: 20px;">
		<div class="container">
			<div class="goodee border border-3" style="background-color: #fff;">
				<div class="d-flex align-items-end row">
					<div class="col-sm-7">
						<div class="card-body">
							<h5 class="card-title text-primary">${memberName}님어서오세요.</h5>
							<p class="mb-4">
								<span class="fw-bold" style="color: #000;">회원유형 :
									${memberType}</span><br> <span class="fw-bold"
									style="color: #000;">회원코드 : ${memberCode}</span><br> <span
									class="fw-bold" style="color: #000;">직급 : <c:if
										test="${depNameOrLevel==1}">일반직원</c:if> <c:if
										test="${depNameOrLevel==2}">관리자</c:if>
								</span>
							</p>
						</div>
					</div>
					<div class="col-sm-5 text-center text-sm-left">
						<div class="card-body pb-0 px-0 px-md-4">
							<img src="../imgFile/lecture.png" height="140"
								alt="View Badge User"
								data-app-dark-img="illustrations/man-with-laptop-dark.png"
								data-app-light-img="illustrations/man-with-laptop-light.png" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form name="form"
		action="${pageContext.request.contextPath}/employee/removeDepartment"
		method="get">
		<!-- EmlpoyeeListOne -->
		<div class="row text-center">
			<div class="card">
				<h5 class="card-header">
					<strong>학부 상세보기</strong>
				</h5>
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
						<c:if test="${sessionScope.memberType eq '직원'}">
							<input type="hidden" name="departmentCode"
								value="${d.departmentCode}">
							<a
								href="${pageContext.request.contextPath}/employee/modifyDepartment?departmentCode=${d.departmentCode}"
								class="btn btn-primary">수정</a>


							<button class="btn btn-primary" type="button" id="btnDelete">삭제</button>

						</c:if>
						<a
							href="${pageContext.request.contextPath}/emplyoee/departmentList"
							class="btn btn-primary">목록</a>


					</div>
				</div>
			</div>

		</div>
	</form>
</div>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
<script>
	if ("${param.errorMsg}" != '') {
		alert("${param.errorMsg}");
	}

	$(document)
			.ready(
					function() {
						$("#btnDelete")
								.click(
										function() {
											if (confirm("삭제하시겠습니까?")) {
												document.form.action = "${pageContext.request.contextPath}/employee/removeDepartment?departmentCode=${d.departmentCode}";
												document.form.method = "get";
												document.form.submit();
											}
										});
					});
</script>
