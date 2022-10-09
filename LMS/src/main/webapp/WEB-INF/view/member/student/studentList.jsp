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
	<!-- RowPerPage Option -->
	<div class="row">
		<div class="col-sm-10 col-12 text-center"></div>
		<div class="col-sm-2 col-12 text-center">
			<select class="form-select" name="sel" id="rowPerPage">
				<option value="5"
					<c:if test="${paging.rowPerPage == 5}">selected</c:if>>5줄
					보기</option>
				<option value="10"
					<c:if test="${paging.rowPerPage == 10}">selected</c:if>>10줄
					보기</option>
				<option value="15"
					<c:if test="${paging.rowPerPage == 15}">selected</c:if>>15줄
					보기</option>
				<option value="20"
					<c:if test="${paging.rowPerPage == 20}">selected</c:if>>20줄
					보기</option>
			</select>
		</div>
	</div>


	<!-- 타입별 학생리스트 -->
	<div class="card text-center" style="margin-top: 20px;">
		<ul class="nav nav-pills flex-column flex-md-row mb-3">
			<li class="nav-item"><c:choose>
					<c:when test="${memberType eq '학생'}">
						<a class="nav-link"
							href="${pageContext.request.contextPath}/student/studentList?departmentCode=${departmentCode}">
							<i class="bx bx-user me-1"></i>같은 학부 학생리스트
						</a>
					</c:when>
					<c:when test="${memberType eq '교수'}">
						<a class="nav-link"
							href="${pageContext.request.contextPath}/professor/studentList?departmentCode=${departmentCode}">
							<i class="bx bx-user me-1"></i>나의 학부 학생리스트
						</a>
					</c:when>
					<c:when test="${memberType eq '직원'}">
						<a class="nav-link"
							href="${pageContext.request.contextPath}/employee/studentList">
							<i class="bx bx-user me-1"></i>승인된 학생 전체리스트
						</a>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose></li>
		</ul>
		<div class="table-responsive text-nowrap">
			<table class="table">
				<caption class="ms-4"></caption>
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>학번</th>
						<th>학과코드</th>
						<th>학년</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="s" items="${list}">
						<tr>
							<td>${s.memberId}</td>
							<td><c:if test="${memberType eq '학생'}">
									<a
										href="${pageContext.request.contextPath}/student/studentOne?studentCode=${s.studentCode}">
										${s.memberName} </a>
								</c:if> <c:if test="${memberType eq '직원'}">
									<a
										href="${pageContext.request.contextPath}/employee/studentOne?studentCode=${s.studentCode}">
										${s.memberName} </a>
								</c:if></td>
							<td>${s.studentCode}</td>
							<td>${s.departmentCode}</td>
							<td>${s.studentYear}</td>
							<td>${s.studentState}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!--  search bar -->
	<hr class="my-3" />
	<div class="row">
		<div class="col-sm-2 col-12 text-center"></div>
		<div class="col-sm-7 col-12 text-center">
			<form
				action="${pageContext.request.contextPath}/employee/studentList"
				method="get">
				<input type="hidden" name="rowPerPage" value="${paging.rowPerPage}">
				<div class="row">
					<div class="col-sm-3 col-12 text-center">
						<select name="searchType" class="form-select">
							<option value="" selected="selected">전체</option>
							<option value="id">아이디</option>
							<option value="code">학번</option>
						</select>
					</div>
					<div class="col-sm-7 col-12 text-center">
						<input name="keyword" class="form-control"
							value="${paging.keyword}">
					</div>
					<div class="col-sm-2 col-12 text-center">
						<button type="submit" class="btn btn-dark">검색</button>
					</div>
				</div>
			</form>
		</div>
		<!--  search bar end -->
		<div style="display: block; text-align: center;">
			<c:if test="${paging.prePage}">
				<a
					href="${pageContext.request.contextPath}/employee/studentList?currentPage=${paging.currentPage-1}
							&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">이전</a>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="p">
				<c:choose>
					<c:when test="${p == paging.currentPage }">
						<b>${p}</b>
					</c:when>
					<c:when test="${p != paging.currentPage }">
						<a
							href="${pageContext.request.contextPath}/employee/studentList?currentPage=${p}
									&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">${p}</a>
					</c:when>
				</c:choose>
			</c:forEach>

			<c:if test="${paging.nextPage}">
				<a
					href="${pageContext.request.contextPath}/employee/studentList?currentPage=${paging.currentPage+1}
							&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">다음</a>
			</c:if>
		</div>
	</div>
</div>
<!-- / Main -->

<%@ include file="/WEB-INF/view/include/footer.jsp"%>