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

<h4 class="card-header">
	<span>"이름"님 /</span>시험명 : ${examSheet.examName} / ${examSheet.examNo }${map.lectureName}
</h4>
<body>
	<div class="container-xxl flex-grow-1 container-p-y">
		<hr>

		<div class="col-xl-6">
			<div class="card mb-4">
				<h3 class="card-header">객관식</h3>
				<table class="card-body">
					<c:forEach var="m" items="${multipleQ}">
						<div class="card-header">${m.multipleNo}번문제:
							${m.multipleContent }</div>
						<div class="card-body">
							<label>보기 : </label>
							<c:forEach var="ex" items="${m.exampleList}">
								<div>
									${ex}<input class="form-check-input" type="checkbox">
								</div>
							</c:forEach>
						</div>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="col-xl-6">
			<div class="card mb-4">
				<h3 class="card-header">주관식</h3>
				<table class="card-body">
					<c:forEach var="s" items="${subjectiveQ}">
						<div class="card-body">${s.subjectiveNo}번문제 :
							${s.subjectiveContent }</div>
						<div class="card mb-4">
							<input type="text" id="" class="form-control">
						</div>

					</c:forEach>
				</table>
			</div>
		</div>
		<hr>
		<form action="${pageContext.request.contextPath}/exam/deleteExamSheet" method="post" class="card-body">
		
		<a href="${pageContext.request.contextPath}/exam/updateExamSheet/${examSheet.examNo}"
			class="btn btn-primary">시험지수정(교수)</a>
			 &nbsp;	 &nbsp; 
			<input type="hidden" name="examNo" value="${examSheet.examNo }">
			<button class="btn btn-primary" onclick="deleteBtn()">시험지삭제(교수)</button>
			 &nbsp;  &nbsp;  &nbsp;  &nbsp; 
			<a href="javascript:history.back()" class="btn btn-primary">뒤로가기</a>	
		</form>
		
		<hr>

	</div>
</body>


<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>

<script>
	function deleteBtn() {
		alert("삭제되었습니다.");
		document.form.submit();
	}
</script>