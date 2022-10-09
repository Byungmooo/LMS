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
				<h5 class="card-header"><strong>${map.lectureName} / 수정 Page</strong></h5>
				<hr class="my-0" />
				
				<div class="card-body">
					<form action="${pageContext.request.contextPath}/employee/modifyTotalLecture" method="post" class="form-inline">
						<table class="table table-bordered">
							<tr>
								<th>강의명</th>
								<td colspan="2">
									<input type="text" name="lectureName" class="form-control" value="${map.lectureName}">
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td colspan="2">
									<input type="text" class="form-control" value="employeeId" readonly="readonly">
									<input type="hidden" name="employeeCode" value="200100001">
								</td>
							</tr>
							<tr>
								<th width="30%">개설학부</th>
								<td width="70%" colspan="2">
									<select name="departmentCode" class="form-select">
										<option value="">선택</option>
										<c:forEach items="${department}" var="d">
											<c:choose>
												<c:when test="${map.departmentName eq d.departmentName}">
													<option value="${d.departmentCode}" selected="selected">${d.departmentName}</option>
												</c:when>
												<c:otherwise>
													<option value="${d.departmentCode}">${d.departmentName}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>강의유형</th>
								<td colspan="2">
									<select name="lectureType" class="form-select">
										<option value="" selected="selected">선택</option>
										<c:choose>
											<c:when test="${map.lectureType eq '전공필수'}">
												<option value="전공필수" selected="selected">전공필수</option>
											</c:when>
											<c:otherwise>
												<option value="전공필수">전공필수</option>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${map.lectureType eq '전공선택'}">
												<option value="전공선택" selected="selected">전공선택</option>
											</c:when>
											<c:otherwise>
												<option value="전공선택">전공선택</option>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${map.lectureType eq '교양선택'}">
												<option value="교양선택" selected="selected">교양선택</option>
											</c:when>
											<c:otherwise>
												<option value="교양선택">교양선택</option>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${map.lectureType eq '교양필수'}">
												<option value="교양필수" selected="selected">교양필수</option>
											</c:when>
											<c:otherwise>
												<option value="교양필수">교양필수</option>
											</c:otherwise>
										</c:choose>
									</select>
								</td>
							</tr>
							<tr>
								<th>학점유형</th>
								<td width="35%">
									<c:choose>
										<c:when test="${map.gradeType eq 'P'}">
											<label for="P"><input type="radio" name="gradeType" value="P" id="P" checked>Pass OR Fail</label>
										</c:when>
										<c:otherwise>
											<label for="P"><input type="radio" name="gradeType" value="P" id="P">Pass OR Fail</label>
										</c:otherwise>
									</c:choose>
								</td>
								<td width="35%">
									<c:choose>
										<c:when test="${map.gradeType eq 'NP'}">
											<label for="NP"><input type="radio" name="gradeType" value="NP" id="NP" checked>Non-Pass (A ~ F grade)</label>
										</c:when>
										<c:otherwise>
											<label for="NP"><input type="radio" name="gradeType" value="NP" id="NP">Non-Pass (A ~ F grade)</label>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>이수학점</th>
								<td colspan="2">
									<div class="row">
										<div class="col-sm-9 col12">
											<input type="text" name="credit" class="form-control" value="${map.credit}" placeholder="Credit">
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
									<c:choose>
										<c:when test="${map.practiceY eq 'Y'}">
											<label for="Yes"><input type="radio" name="practiceY" value="Y" id="Yes" checked>Yes</label>
										</c:when>
										<c:otherwise>
											<label for="Yes"><input type="radio" name="practiceY" value="Y" id="Yes">Yes</label>
										</c:otherwise>
									</c:choose>
								</td>
								<td width="35%">
									<c:choose>
										<c:when test="${map.practiceY eq 'N'}">
											<label for="No"><input type="radio" name="practiceY" value="N" id="No" checked>No</label>
										</c:when>
										<c:otherwise>
											<label for="No"><input type="radio" name="practiceY" value="N" id="No">No</label>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</table>
						<div style="margin-top: 20px;">
							<input type="hidden" name="lectureCode" value="${map.lectureCode}" >
							<button type="submit" class="btn btn-primary" style="color: #fff;">수정</button>
							<a href="${pageContext.request.contextPath}/employee/totalLectureOne?lectureCode=${map.lectureCode}" class="btn btn-primary" style="color: #fff;">취소</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- / Main -->
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
