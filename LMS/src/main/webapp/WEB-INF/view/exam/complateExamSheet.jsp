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
	<div class="container-xxl flex-grow-1 container-p-y" style="text-align: center;">
		<hr>
		
		
		<div class= "container" style="text-align: center; width: 600px;">
			<div class="card mb-4">
				<div class="mt-2 mb-3">
				<h3 class="card-header">시험지이름 :
					${examSheet.examName}-${examSheet.examNo}</h3>
				<form id="examSheetForm">
					<div class= "container" style="text-align: center;">
						<label><strong>시험지 이름</strong></label>		
						<input class="form-control" style="text-align: center;" name="examNo" id="examNo" type="hidden" value="${examNo}" >
						<div class= "container">
						<input name="examName" id="examName" class="form-control" type="text"
							style="text-align: center;" autofocus value="${examSheet.examName}" value="${examName}" readonly>
						</div>
					</div>
				</form>
				</div>
			</div>
			<c:forEach var="m" items="${multipleQ}"  varStatus="status1">
				<div class="card mb-4">
					<h3 class="card-header">객관식 ${m.multipleNo}번 문제 : (${m.questionPoint}점)</h3>
					<div class="mt-2 mb-3">
						<div class= "container" style="text-align: center;">
							<label><strong>문제 내용</strong></label>
							<input class="form-control" type="text"  style="text-align: center;"
								placeholder="문제내용" value="${m.multipleContent}"
								id="multipleContent_${m.multipleNo }" readonly>
						</div>
							<br>
						<div class="mt-2 mb-3">
							<div class= "container" style="text-align: center;">
							<label><strong>보기내용</strong></label>
								<c:forEach var="ex" items="${m.exampleList}" varStatus="status">
									<input class="form-control" type="text" style="text-align: center;"
										placeholder="${status.count}번" value="${ex}"
										id="exampleContent_${m.multipleNo}" readonly>
									<br>
								</c:forEach>
								
							</div>
							<br>
							<div class= "container" style="text-align: center;">
							<label><strong>정답</strong></label>
								<ul class="list-group">	
									<li class="list-group-item">${m.multipleAnswer}번</li>
								</ul>
							</div> 
							<br>
							<!-- 내가 제출한 답안 -->
							<div class= "container" style="text-align: center;">
							<label><strong>제출 답안</strong></label>	
								<ul class="list-group">		
									<c:if test="${status1.count==1}">		
										<li class="list-group-item active">${examList.exMq1}번</li>
									</c:if>
									<c:if test="${status1.count==2}">			
										<li class="list-group-item active">${examList.exMq2}번</li>
									</c:if>			
									<c:if test="${status1.count==3}">			
										<li class="list-group-item active">${examList.exMq3}번</li>
									</c:if>										 	
									<c:if test="${status1.count==4}">			
										<li class="list-group-item active">${examList.exMq4}번</li>
									</c:if>	
									<c:if test="${status1.count==5}">			
										<li class="list-group-item active">${examList.exMq5}번</li></c:if>
									<%-- <c:if test="${status1.count==5}">			
									<input class="form-control" type="text" style="width: 200px"
											 id="MQ_${m.multipleNo}" value="${examList.exMq5}번" readonly>
									</c:if>	 --%>
								</ul>
								<br>																	
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<div class= "container" style="text-align: center; width: 600px;">
			<c:forEach var="s" items="${subjectiveQ}" varStatus="status">
				<div class="card mb-4">	
					<h3 class="card-header">주관식 문제 ${s.subjectiveNo}번 : (${s.questionPoint}점)</h3>
					<div class="mt-2 mb-3">
						<div class= "container" style="text-align: center;">
							<label><strong>문제 내용</strong></label>
							
							<input class="form-control" type="text" style="text-align: center;"
								placeholder="문제"
								value="${s.subjectiveContent }"
								id="subjectiveContent_${s.subjectiveNo}" readonly>
						</div>
					</div>
					<div class="mt-2 mb-3">
						<div class= "container" style="text-align: center;">
							<label><strong>정답</strong></label>
							<input class="form-control" type="text" style="text-align: center;"
								placeholder="정답"
								value="${s.subjectiveAnswer }"
								id="subjectiveAnswer_${s.subjectiveNo}" readonly>
						</div>
					</div>
					<div class="mt-2 mb-3">
						<div class= "container" style="text-align: center;">
							<label><strong>제출답안</strong></label>
							<input class="form-control" type="text" style="text-align: center;"
								id="SQ_${s.subjectiveNo }" 
								value="${examList.exSq[status.count-1]}" readonly>	
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class= "container" style="text-align: center; width: 600px;">
				<div class="card mb-4">
					<h3 class="card-header">총점</h3>
							<div>	
								<h3 class="card-header" style="color: blue;">${score}점</h3>
							</div>
				</div>
		</div>
		<div class= "container" style="text-align: center; width: 600px;">
				<a href="${pageContext.request.contextPath}/exam/studentExList" class="btn btn-primary">시험종료</a>
		</div>
		
	</div>
</body>

<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>

<script>
</script>
