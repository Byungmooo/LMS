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
		<div class="row" style="margin-bottom: 20px;">
			<div class="container">
				<div class="goodee border border-3" style="background-color: #fff;">
					<div class="d-flex align-items-end row">
						<div class="col-sm-7">
							<div class="card-body">
								<h5 class="card-title text-primary">${memberName}님 어서오세요.</h5>
								<p class="mb-4">
									<span class="fw-bold" style="color: #000;">회원유형 : ${memberType}</span><br> 
									<span class="fw-bold" style="color: #000;">회원코드 : ${memberCode}</span><br>
									<c:if test="${memberType eq '교수'||memberType eq '학생'}">
										<span class="fw-bold" style="color: #000;">학과이름 : ${depNameOrLevel}</span>
									</c:if>
								</p>
							</div>
						</div>
						<div class="col-sm-5 text-center text-sm-left">
							<div class="card-body pb-0 px-0 px-md-4">
								<img src="../imgFile/lecture.png"
									height="140" alt="View Badge User"
									data-app-dark-img="illustrations/man-with-laptop-dark.png"
									data-app-light-img="illustrations/man-with-laptop-light.png" />
							</div>
						</div>
					</div>
				</div>
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
													<c:if test="${buildingNo == 0}">selected</c:if>>::건물선택::</option>
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
											<select name="classroomNo" id="classroomNo" class="form-select">
											</select>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th>시작일자</th>
								<td>
									<input type="date" id="openLectureDate" name="openLectureDate" class="form-control">
								</td>
								<th>종강일자</th>
								<td>
									<input type="date" id="closeLectureDate" name="closeLectureDate" class="form-control">
								</td>
								<th>강의정원</th>
								<td><input type="text" id="studentNum" name="studentNum" class="form-control"></td>							
							</tr>
							<tr>
								<th>요일</th>
								<td>
									<select name="lectureYoil" id="lectureYoil" class="form-select">
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
									<select name="lectureStart" id="lectureStart" class="form-select">
										<option value="">선택</option>
										<c:forEach begin="1" end="8" var="i">
											<option value="${i}">${i}교시 (${i+8}:00 ~ ${i+8}:50)</option>
										</c:forEach>
									</select>
								</td>
								<th>종료시간</th>
								<td>
									<select name="lectureEnd" id="lectureEnd" class="form-select">
										<option value="">선택</option>
										<c:forEach begin="2" end="9" var="i">
											<option value="${i}">${i}교시 (${i+8}:00 ~ ${i+8}:50)</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>강의계획서</th>
								<td colspan="5"><textarea name="syllabus" id="syllabus" class="form-control" rows="20px"></textarea></td>
							</tr>
						</table>
						<input type="hidden" name=professorCode value="${memberCode}">
						<input type="hidden" name=lectureCode value="${map.lectureCode}">
						<button type="button" id="addBtn" class="btn btn-primary">신청</button>
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

	$('#addBtn').click(function() {
		if($('#buildingNo').val() == '') {
			alert('건물을 선택해주세요');
		} else if($('#classroomNo').val() == '') {
			alert('호수를 선택해주세요');
		} else if($('#openLectureDate').val() == '') {
			alert('시작날짜를 선택해주세요');
		} else if($('#closeLectureDate').val() == '') {
			alert('끝나는 날짜를 선택해주세요');
		} else if($('#studentNum').val() == '') {
			alert('인원수를 입력해주세요');
		} else if($('#lectureYoil').val() == '') {
			alert('강의요일을 선택해주세요');
		} else if($('#lectureStart').val() == '') {
			alert('강의시작 시간을 선택해주세요');
		} else if($('#lectureEnd').val() == '') {
			alert('강의종료 시간을 선택해주세요');
		} else if($('#syllabus').val() == '') {
			alert('강의계획서를 입력해주세요');
			$("#syllabus").focus();
		} else {
			lectureAddForm.submit();
		}
	});
</script>
<script>
	
	$(document).ready(function(){
		$('#buildingNo').change(function() {
			if($('#buildingNo').val() == '') {
				alert('건물을 선택하세요');
			} else {
				$('#classroomNo').empty();
				$('#classroomNo').append('<option value="">::호수 선택::</option>')
				
				$.ajax({
					url : 'classroomList',
					type : 'get',
					data : {buildingNo : $('#buildingNo').val()},
					success : function(json) {
						$(json).each(function(index, item){
							$('#classroomNo').append('<option value="'+item.classroomNo+'">'+item.classroomName+'</option>')
						});
					}
				});
			}
		});
	});
</script>
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
