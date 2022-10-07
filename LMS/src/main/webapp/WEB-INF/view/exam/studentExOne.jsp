<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
		<div class="row">
			<div class="col-sm-3 col-12"></div>
			<div class="col-sm-6 col-12 text-center">
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">${memberName}
					${memberType}님 어서오세요 </span>
				</h4>
			</div>
			<div class="col-sm-3 col-12">
				<a class="btn btn-primary" href="${pageContext.request.contextPath}/student/studentLectureList?memberCode=${memberCode}" style="float: right;">
					강의리스트
				</a>
			</div>
		</div> 
<body>
	<form action="${pageContext.request.contextPath}/exam/complateExamSheet" method="post">
	<div class="container-xxl flex-grow-1 container-p-y">
		<hr>

		<div class="col-xl-6">
			<div class="card mb-4">
				<h3 class="card-header" >객관식</h3>
				<table class="card-body">
					<c:forEach var="m" items="${multipleQ}">
						<div class="card-header">${m.multipleNo}번문제:
							${m.multipleContent }</div>
						<div class="card-body">
							<label>보기 : </label>
							<c:set var="i" value="1" />
							<c:forEach var="ex" items="${m.exampleList}">
								<div>
									<input class="form-check-input" value="${i}" type="radio" name="exMq${m.multipleNo}" id="MQ_${m.multipleNo}_${ex}">   ${ex}
								</div>
								<c:set var="i" value="${i+1}" />
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
							<input type="text" class="form-control" name="exSq" id="SQ_${s.subjectiveNo}"  >
						</div>
					</c:forEach>
				</table>
			</div>
		</div>
		<hr>
<input type="hidden" name="examNo" value="${examSheet.examNo }">
		<button class="btn btn-primary" type="submit"  style=" width: 100px">제출</button>
			 &nbsp;	 &nbsp; 
			<input type="hidden" name="examNo" value="${examSheet.examNo }">
			 &nbsp;  &nbsp;  &nbsp;  &nbsp; 
			<a href="javascript:history.back()" class="btn btn-primary" tyle=" width: 100px">뒤로가기</a>	

		
		<hr>

	</div>
	</form>
</body>


<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>
<script>
/* 	function complateExam(multipleNo,subjectiveNo){
		var examNo = ${'#exam_no'}.val();
		var MQAnswer = $('#MQ_'+multipleNo).val();
		var SQAnswer = $('#SQ_'+subjectiveNo).val();
		
		console.log(examNo+"//examNo");
		console.log(MQAnswer+"//MQAnswer");
		console.log(SQAnswer+"//SQAnswer");
		
		var jsonData = {
			"MQAnswer" : MQAnswer,
			"SQAnswer" : SQAnswer
		};

	} */
</script>
