<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
							<h5 class="card-title text-primary">${memberName}님어서오세요.</h5>
							<p class="mb-4">
								<span class="fw-bold" style="color: #000;">회원유형 :
									${memberType}</span><br> <span class="fw-bold"
									style="color: #000;">회원코드 : ${memberCode}</span><br> <span
									class="fw-bold" style="color: #000;">직급 : <c:if
										test="${depNameOrLevel==1}">일반직원</c:if> <c:if
										test="${depNameOrLevel==2}">관리자</c:if>
								</span>
							</p>
						</div>
					</div>
					<div class="col-sm-5 text-center text-sm-left">
						<div class="card-body pb-0 px-0 px-md-4">
							<img src="../imgFile/lecture.png" height="140"
								alt="View Badge User"
								data-app-dark-img="illustrations/man-with-laptop-dark.png"
								data-app-light-img="illustrations/man-with-laptop-light.png" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- addLectureQuestion -->
	<div class="row text-center">
		<div class="card">
			<h5 class="card-header">
				<strong>학부리스트</strong>
			</h5>
			<hr class="my-0" />


			<form
				action="${pageContext.request.contextPath}/employee/addDepartment"
				method="post" class="form-inline">

				<table class="table table-bordered">
					<tr>
						<th>학부코드</th>
						<td colspan="2"><input type="text" name="departmentCode"
							class="form-control" placeholder="예> AT101 형식으로 입력하세요"></td>
					</tr>
					<tr>
						<th>학부이름</th>
						<td colspan="2"><input type="text" class="form-control"
							name="departmentName"></td>
					</tr>
				</table>
				<!-- row -->

				<button type="submit" class="btn btn-primary">학부 추가하기</button>
				<button class="btn btn-primary" type="button" id="btnCancel"
					onclick="window.history.back()">취소</button>
			</form>
			<!-- </form> -->
		</div>
	</div>
</div>
</div>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>