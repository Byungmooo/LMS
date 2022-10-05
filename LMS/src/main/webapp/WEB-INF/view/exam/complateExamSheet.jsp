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

<h4 class="card-header">${memberName}님/"강의명"/제출완료</h4>
<body>
	<input type="hidden" id="exam_no" value="${examSheet.examNo }">
	<div class="container-xxl flex-grow-1 container-p-y">
		<hr>
		
		<div class="col-xl-6">
			<div class="card mb-4">
				<h3 class="card-header">시험지이름 :
					${examSheet.examName}-${examSheet.examNo}</h3>
				<form id="examSheetForm">
					<div class="mt-2 mb-3" >
						<input name="examNo" id="examNo" type="hidden" value="${examNo}" >※시험지이름
							<div >
							<input name="examName" id="examName" class="form-control"
								type="text" style="width: 200px" autofocus value="${examSheet.examName}" value="${examName}" readonly>
							</div>
					</div>
				</form>
			</div>

			<c:forEach var="m" items="${multipleQ}"  varStatus="status1">
				<div class="card mb-4">
					<h3 class="card-header">객관식 ${m.multipleNo}번 문제 : (${m.questionPoint}점)</h3>
					<div class="mt-2 mb-3">
						<label>※문제내용</label>
						<div>
							<input class="form-control" type="text" style="width: 200px"
								placeholder="문제내용" value="${m.multipleContent}"
								id="multipleContent_${m.multipleNo }" readonly>
						</div>
						<div class="mt-2 mb-3">
							<label>※보기 </label>
							<div>
								<c:forEach var="ex" items="${m.exampleList}" varStatus="status">
									<input class="form-control" type="text" style="width: 200px"
										placeholder="${status.count}번" value="${ex}"
										id="exampleContent_${m.multipleNo }" readonly>
								</c:forEach>
							</div>
							<div>
							<label>※정답</label>
								<input class="form-control" type="text" style="width: 200px"
									value="${m.multipleAnswer}번" 
									id="exampleAnswer_${m.multipleNo }" readonly>						
							</div>
							<div>
								<label>※제출답안</label>	
									<c:if test="${status1.count==1}">			
									<input class="form-control" type="text" style="width: 200px"
											 id="MQ_${m.multipleNo}" value="${examList.exMq1}번" readonly>
									</c:if>
									<c:if test="${status1.count==2}">			
									<input class="form-control" type="text" style="width: 200px"
											 id="MQ_${m.multipleNo}" value="${examList.exMq2}번" readonly>
									</c:if>			
									<c:if test="${status1.count==3}">			
									<input class="form-control" type="text" style="width: 200px"
											 id="MQ_${m.multipleNo}" value="${examList.exMq3}번" readonly>
									</c:if>										 	
									<c:if test="${status1.count==4}">			
									<input class="form-control" type="text" style="width: 200px"
											 id="MQ_${m.multipleNo}" value="${examList.exMq4}번" readonly>
									</c:if>	
									<c:if test="${status1.count==5}">			
									<input class="form-control" type="text" style="width: 200px"
											 id="MQ_${m.multipleNo}" value="${examList.exMq5}번" readonly>
									</c:if>																			
							</div>
						</div>
					</div>
				</div>
			</c:forEach>




		</div>
		<div class="col-xl-6">
			<c:forEach var="s" items="${subjectiveQ}" varStatus="status">
				<div class="card mb-4">
					<h3 class="card-header">주관식 문제 ${s.subjectiveNo}번 : (${s.questionPoint}점)</h3>

					<div class="mt-2 mb-3">
						<label>문제내용</label> <input class="form-control" type="text"
							style="width: 400px" placeholder="문제"
							value="${s.subjectiveContent }"
							id="subjectiveContent_${s.subjectiveNo}" readonly>
					</div>

					<div class="mt-2 mb-3">
						<label>정답</label> <input class="form-control" type="text"
							style="width: 200px" placeholder="정답"
							value="${s.subjectiveAnswer }"
							id="subjectiveAnswer_${s.subjectiveNo}" readonly>
					</div>
							<div>
								<label>※제출답안</label>	
								<input class="form-control" type="text" style="width: 200px" 
										id="SQ_${s.subjectiveNo }" value="${examList.exSq[status.count-1]}" readonly>	
										
							</div>
							
				</div>
			</c:forEach>
		</div>
		<div class="col-xl-6">
				<div class="card mb-4">
					<h3 class="card-header">총점</h3>
							<div>	
								<h3 class="card-header">${score}점</h3>
							</div>
				</div>
		</div>		
		<hr>
		<div class="">
			<a href="javascript:history.back()" class="btn btn-primary">뒤로가기</a>
		</div>
		
	</div>
</body>

<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>


<script>


</script>
