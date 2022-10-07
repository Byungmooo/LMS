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
		<h4 class="fw-bold py-3 mb-4 text-center">
			<span class="text-muted fw-light">${memberName}
					${memberType}님 어서오세요 </span>
					</h4>
		<hr class="my-5" />
		
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
