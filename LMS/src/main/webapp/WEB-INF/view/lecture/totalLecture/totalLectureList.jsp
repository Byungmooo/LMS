<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/include/studentHeader.jsp"%>

	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="fw-bold py-3 mb-4">
			<span class="text-muted fw-light">${memberName}님 / <strong>전체강의</strong></span>
		</h4>
		<hr class="my-5" />
		
		<div class="card text-center">
			<h5 class="card-header">전체강의</h5>
			<!-- 전체강의 리스트 -->
			<div class="table-responsive text-nowrap">
				<table class="table">
					<thead>
						<tr>
							<th width="10%">번호</th>
							<th width="50%">강의이름</th>
							<th width="20%">작성자</th>
							<th width="20%">등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="t" items="${totalList}">
							<tr>
								<td><strong>${t.lectureCode}</strong></td>
								<td><a href="${pageContext.request.contextPath}/totalLectureOne?lectureCode=${t.lectureCode}">${t.lectureName}</a></td>
								<td><span class="badge bg-label-secondary me-1"></span>${t.writer}</td>
								<td>${t.createDate}</td>
							</tr>
							<input type="hidden" name="studentCode" id="studentCode" value="${memberCode}">
						</c:forEach>
					</tbody>
				</table>
			</div>
			<hr class="my-3" />
			<!-- 검색 -->
			<form action="${pageContext.request.contextPath}/totalLectureList" method="get">
				<div class="row">
					<div class="col-sm-2 col-12 text-center">
					</div>
					<div class="col-sm-7 col-12 text-center">
						<input type="text" name="keyword" class="form-control" placeholder="과목이름을 입력하세요">
					</div>
					<div class="col-sm-2 col-12 text-center">
						<button type="submit" class="btn btn-dark">검색</button>
					</div>
				</div>
			</form>
			<!-- 페이징 -->
			<div style="display: block; text-align: center;">		
				<c:if test="${paging.prePage}">
					<a href="${pageContext.request.contextPath}/totalLectureList?currentPage=${paging.currentPage-1}
						&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&memberCode=${memberCode}">이전</a>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
					<c:choose>
						<c:when test="${p == paging.currentPage }">
							<b>${p}</b>
						</c:when>
						<c:when test="${p != paging.currentPage }">
							<a href="${pageContext.request.contextPath}/totalLectureList?currentPage=${p}
								&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&memberCode=${memberCode}">${p}</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.nextPage}">
					<a href="${pageContext.request.contextPath}/totalLectureList?currentPage=${paging.currentPage+1}
						&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&memberCode=${memberCode}">다음</a>
				</c:if>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>
