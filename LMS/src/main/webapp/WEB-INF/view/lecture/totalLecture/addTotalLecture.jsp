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
		<h4 class="fw-bold py-3 mb-4">
			<span class="text-muted fw-light">${memberName}
					${memberType}님 어서오세요 </span>
		</h4>
		<hr class="my-5" />
		
		<!-- studentLectureOne -->
		<div class="row text-center">
			<div class="card">
				<h5 class="card-header"><strong></strong></h5>
				<hr class="my-0" />
				
				<div class="card-body">
					<form action="${pageContext.request.contextPath}/employee/addTotalLecture" method="post" class="form-inline">
						<table class="table table-bordered">
							<tr>
								<th>강의명</th>
								<td colspan="2">
									<input type="text" name="lectureName" class="form-control" placeholder="lecture Name">
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td colspan="2">
									<input type="text" class="form-control" value="${memberId}" readonly="readonly">
									<input type="hidden" name="employeeCode" value="${memberCode}">
								</td>
							</tr>
							<tr>
								<th width="30%">개설학부</th>
								<td width="70%" colspan="2">
									<select name="departmentCode" class="form-select">
										<option value="" selected="selected">선택</option>
										<c:forEach items="${department}" var="d">
											<option value="${d.departmentCode}">${d.departmentName}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>강의유형</th>
								<td colspan="2">
									<select name="lectureType" class="form-select">
										<option value="" selected="selected">선택</option>
										<option value="전공필수">전공필수</option>
										<option value="전공선택">전공선택</option>
										<option value="교양필수">교양필수</option>
										<option value="교양선택">교양선택</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>학점유형</th>
								<td width="35%">
									<label for="P"><input type="radio" name="gradeType" value="P" id="P">Pass OR Fail</label>
								</td>
								<td width="35%">
									<label for="NP"><input type="radio" name="gradeType" value="NP" id="NP">Non-Pass (A ~ F grade)</label>
								</td>
							</tr>
							<tr>
								<th>이수학점</th>
								<td colspan="2">
									<div class="row">
										<div class="col-sm-9 col12">
											<input type="text" name="credit" class="form-control" placeholder="Credit">
										</div>
										<div class="col-sm-3 col12">
											<span style="float: left;">학점</span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th>실습여부</th>
								<td width="35%">
									<label for="Yes"><input type="radio" name="practiceY" value="Y" id="Yes">Yes</label>
								</td>
								<td width="35%">
									<label for="No"><input type="radio" name="practiceY" value="N" id="No">No</label>
								</td>
							</tr>
						</table>
						<div style="margin-top: 20px;">
							<button type="submit" class="btn btn-primary" style="color: #fff;">입력</button>
							<a href="${pageContext.request.contextPath}/employee/totalLectureList" class="btn btn-primary" style="color: #fff;">취소</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- / Main -->
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
