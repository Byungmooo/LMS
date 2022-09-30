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

<!-- Main -->

<h4 class="card-header">"이름"님/"강의명"/시험문제 등록</h4>
<body>
	<div class="container-xxl flex-grow-1 container-p-y">
		<hr>
		<div class="col-xl-6">
			<div class="card mb-4">
				<h3 class="card-header">시험지 이름 등록</h3>
			</div>
			<form
				action="${pageContext.request.contextPath}/exam/professorAddExamSheet"
				method="post">
				<div class="mt-2 mb-3">
					※시험지이름 <input name="examName" id="examName" class="form-control"
						type="text" style="width: 200px" value="${examName}">
				</div>
				<div class="">
					<button type="submit" class="btn btn-primary">시험지이름 등록</button>
					<a href="javascript:history.back()" class="btn btn-primary">뒤로가기</a>
				</div>
			</form>
		</div>
	</div>
</body>

<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>


