<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/include/studentHeader.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="fw-bold py-3 mb-4">
			<span class="text-muted fw-light">LectureNotice</span>
		</h4>
		<hr class="my-5" />
		
		<!-- LectureNoticeList -->
		<div class="card text-center">
			<h5 class="card-header">강의공지</h5>
			<!-- RowPerPage Option -->
			<div class="row">
				<div class="col-sm-9 col-12 text-center"></div>
				<div class="col-sm-3 col-12 text-center">
					<select  class="form-select" name="sel" id="#">
						<option value="5"
							<c:if test="${paging.rowPerPage == 5}">selected</c:if>>5줄 보기</option>
						<option value="10"
							<c:if test="${paging.rowPerPage == 10}">selected</c:if>>10줄 보기</option>
						<option value="15"
							<c:if test="${paging.rowPerPage == 15}">selected</c:if>>15줄 보기</option>
						<option value="20"
							<c:if test="${paging.rowPerPage == 20}">selected</c:if>>20줄 보기</option>
					</select>
				</div>
			</div>
			<hr class="my-2" />
			<div class="table-responsive text-nowrap text-center">
				<table class="table">
					<thead>
						<tr>
							<th width="10%">글번호</th>
							<th width="20%">제목</th>
							<th width="10%">조회수</th>
							<th width="10%">등록</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${viewAll}">
							<tr>
								<td><strong>${list.SEQ}</strong></td>
								<td><a href="${pageContext.request.contextPath}/testNoticeOne?lecNoticeNo=${list.lecNoticeNo}">${list.lecNoticeTitle}</a></td>
								<td>${list.views}</td>
								<td>${list.createDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr class="my-3" />
				<div class="row">
					<div class="col-sm-2 col-12 text-center"></div>
					<div class="col-sm-7 col-12 text-center">
						<form action="${pageContext.request.contextPath}/testList" method="get">
							<div class="row">
								<div class="col-sm-3 col-12 text-center">
									<select name="searchType" class="form-select">
										<option value="" selected="selected">전체</option>
										<option value="writer">작성자</option>
										<option value="title">제목</option>
										<option value="content">내용</option>
									</select>
								</div>
								<div class="col-sm-7 col-12 text-center">
									<input name="keyword" class="form-control">
								</div>
								<div class="col-sm-2 col-12 text-center">
									<button type="submit" class="btn btn-dark">검색</button>
								</div>
							</div>
						</form>
					</div>
					<div class="col-sm-1 col-12 text-center"></div>
					<div class="col-sm-2 col-12 text-center">
						<a href="${pageContext.request.contextPath}/addNotice" class="btn btn-dark">글쓰기</a>
					</div>
				</div>
				<div style="display: block; text-align: center;">		
					<c:if test="${prePage}">
						<a href="${pageContext.request.contextPath}/testList?currentPage=${paging.currentPage-1}
							&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.beginPage+1}" end="${paging.endPage}" var="p">
						<c:choose>
							<c:when test="${p == paging.currentPage }">
								<b>${p}</b>
							</c:when>
							<c:when test="${p != paging.currentPage }">
								<a href="${pageContext.request.contextPath}/testList?currentPage=${p}
									&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">${p}</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${nextPage}">
						<a href="${pageContext.request.contextPath}/testList?currentPage=${paging.currentPage+1}
							&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">&gt;</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!-- / Main -->

<%@ include file="/WEB-INF/view/include/footer.jsp"%>
