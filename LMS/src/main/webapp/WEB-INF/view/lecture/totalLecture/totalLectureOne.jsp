<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
									<span class="fw-bold" style="color: #000;">직급    : 
										<c:if test="${depNameOrLevel==1}">일반직원</c:if>
										<c:if test="${depNameOrLevel==2}">관리자</c:if>
									</span>
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
				<h5 class="card-header"><strong>${map.lectureName}</strong></h5>
				<hr class="my-0" />
				
				<div class="card-body">
					<table class="table table-bordered">
						<tr>
							<th width="30%">작성자</th>
							<td width="70%">${map.memberId}</td>
						</tr>
						<tr>
							<th>개설학부</th>
							<td>${map.departmentName}</td>
						</tr>
						<tr>
							<th>강의유형</th>
							<td>${map.lectureType}</td>
						</tr>
						<tr>
							<th>학점유형</th>
							<c:if test="${map.gradeType eq 'P'}">
								<td>Pass OR Fail 강의</td>
							</c:if>
							<c:if test="${map.gradeType eq 'NP'}">
								<td>Non-Pass (A ~ F grade) 강의</td>
							</c:if>
						</tr>
						<tr>
							<th>이수학점</th>
							<td>${map.credit} 학점</td>
						</tr>
						<tr>
							<th>실습여부</th>
							<td>${map.practiceY} (Yes or No)</td>
						</tr>
						<tr>
							<th>등록일자</th>
							<td>${map.createDate}</td>
						</tr>
					</table>
					<div style="margin-top: 20px;">
						<input type="hidden" id="lectureCode" name="lectureCode" value="${map.lectureCode}">
						<a href="${pageContext.request.contextPath}/employee/modifyTotalLecture?lectureCode=${map.lectureCode}" class="btn btn-primary" style="color: #fff;">수정</a>
						<button type="button" onclick="del(${map.lectureCode})" class="btn btn-primary" style="color: #fff;">삭제</button>
						<a href="${pageContext.request.contextPath}/employee/totalLectureList" class="btn btn-primary" style="color: #fff;">목록</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- / Main -->
<script>
	if("${errorMsg}" != '') {
		alert("${errorMsg}");
	}
</script>
<script>
	
	function del(lectureCode) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='removeTotalLecture?lectureCode='+lectureCode;
		}
	}
	
</script>
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
