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
					<form>
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
								<th>시작일자</th>
								<td>
									<input type="date" class="form-control">
								</td>
								<th>종강일자</th>
								<td>
									<input type="date" class="form-control">
								</td>
							</tr>
							<tr>
								<th>강의장소</th>
								<td colspan="3">
									<div class="row">
										<div class="col-sm-2 col12">
											<span>건물</span>
										</div>
										<div class="col-sm-4 col12">
											<select class="form-select">
												<option>선택</option>
											</select>
										</div>
										<div class="col-sm-2 col12">
											<span>호실</span>
										</div>
										<div class="col-sm-4 col12">
											<select class="form-select">
												<option>선택</option>
											</select>
										</div>
									</div>
								</td>
								<th>강의정원</th>
								<td><input type="text" class="form-control"></td>							
							</tr>
							<tr>
								<th>강의계획서</th>
								<td colspan="5"><textarea class="form-control" rows="20px"></textarea></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- / Main -->
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
