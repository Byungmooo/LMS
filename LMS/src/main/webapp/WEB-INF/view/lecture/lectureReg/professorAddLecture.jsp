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
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="row">
			<div class="col-sm-9 col-12">
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">"${memberName}"님 /</span>
				</h4>
			</div>
		</div>
		
		<!-- studentLectureOne -->
		<div class="row text-center">
			<div class="card">
				<h5 class="card-header"><strong>강의신청상세화면</strong></h5>
				<hr class="my-0" />
				
				<div class="card-body">
					<form action="${pageContext.request.contextPath}/professor/professorAddLecture" id="lectureAddForm" method="post">
						<table class="table table-bordered">
							<tr>
								<th>강의이름</th>
								<td>${map.lectureName}</td>
								<th>교과구분</th>
								<td>${map.lectureType}</td>
								<th>이수학점</th>
								<td>${map.credit}</td>
							</tr>
							<tr>
								<th>개설학부</th>
								<td>${map.departmentName}</td>
								<th>강의장소</th>
								<td colspan="3">
									<div class="row">
										<div class="col-sm-2 col12">
											<span>건물</span>
										</div>
										<div class="col-sm-4 col12">
											<select name="buildingNo" id="buildingNo" class="form-select">
												<option value=""
													<c:if test="${buildingNo == 0}">selected</c:if>>선택</option>
												<c:forEach items="${building}" var="b">
													<option value="${b.buildingNo}"
														<c:if test="${buildingNo == b.buildingNo}">selected</c:if>>${b.buildingName}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-sm-2 col12">
											<span>호실</span>
										</div>
										<div class="col-sm-4 col12">
											<select name="classroomNo" class="form-select">
												<option value="">선택</option>
												<c:forEach items="${classroom}" var="c">
													<option value="${c.classroomNo}">${c.classroomName}</option>	
												</c:forEach>
											</select>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th>시작일자</th>
								<td>
									<input type="date" name="openLectureDate" class="form-control">
								</td>
								<th>종강일자</th>
								<td>
									<input type="date" name="closeLectureDate" class="form-control">
								</td>
								<th>강의정원</th>
								<td><input type="text" name="studentNum" class="form-control"></td>							
							</tr>
							<tr>
								<th>요일</th>
								<td>
									<select name="lectureYoil" class="form-select">
										<option value="">선택</option>
										<option value="1">월</option>
										<option value="2">화</option>
										<option value="3">수</option>
										<option value="4">목</option>
										<option value="5">금</option>
									</select>
								</td>
								<th>시작시간</th>
								<td>
									<select name="lectureStart" class="form-select">
										<c:forEach begin="1" end="8" var="i">
											<option value="${i}">${i}교시 (${i+8}:00 ~ ${i+8}:50)</option>
										</c:forEach>
									</select>
								</td>
								<th>종료시간</th>
								<td>
									<select name="lectureEnd" class="form-select">
										<c:forEach begin="2" end="9" var="i">
											<option value="${i}">${i}교시 (${i+8}:00 ~ ${i+8}:50)</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>강의계획서</th>
								<td colspan="5"><textarea name="syllabus" class="form-control" rows="20px"></textarea></td>
							</tr>
						</table>
						<input type="hidden" name=professorCode value="${memberCode}">
						<input type="hidden" name=lectureCode value="${map.lectureCode}">
						<button type="submit" id="addBtn" class="btn btn-primary">신청</button>
						<a href="${pageContext.request.contextPath}/professor/professorLectureReg?memberCode=${memberCode}" class="btn btn-primary">취소</a>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- / Main -->
<script>
	if("${errorMsg}" != '') {
		alert("${errorMsg}");
		location.href='professorAddLecture?lectureCode='+"${map.lectureCode}";
	}
</script>
<script>
	
	$("#buildingNo").on( "change", function() {
		const path = "${pageContext.request.contextPath}";
		const param = {
		    	lectureCode : "${map.lectureCode}",
		        buildingNo:$("#buildingNo").val(),
		    }
		var url = path +'/professor/professorAddLecture';
	    url += '?lectureCode=' + param.lectureCode;
	    url += '&buildingNo='+ param.buildingNo;
		location.href= url;
	});

</script>
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
