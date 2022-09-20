<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/include/studentHeader.jsp"%>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<!-- Main -->
<div class="container-xxl flex-grow-1 container-p-y">
	<h4 class="fw-bold py-3 mb-4">
		<span class="text-muted fw-light">"이름"님 /</span>전체게시판
	</h4>
	<hr class="my-5" />
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

	<!-- TotalNoticeList -->
	<div class="card">
		<h5 class="card-header">전체게시판</h5>
		<div class="table-responsive text-nowrap">
			<table class="table">
				<caption class="ms-4"></caption>
				<thead>
					<tr>
						<th>번호</th>
						<th>부서코드</th>
						<th>글쓴이</th>
						<th>제목</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>수정일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td>${row.noticeNo}</td>
							<td><span class="badge bg-label-primary me-1">${row.departmentCode}</span></td>
							<td>${row.writer}</td>

							<td><span class="badge bg-label-secondary me-1"> <a
									href="${pageContext.request.contextPath}/totalNotice/${row.noticeNo}">
										${row.noticeTitle} </a></span></td>
							<td>${row.views}</td>
							<td>${row.createDate}</td>
							<td>${row.updateDate}</td>
							<td>
								<div class="dropdown">
									<button type="button"
										class="btn p-0 dropdown-toggle hide-arrow"
										data-bs-toggle="dropdown">
										<i class="bx bx-dots-vertical-rounded"></i>
									</button>
									<div class="dropdown-menu">
										<a class="dropdown-item"
											href="${pageContext.request.contextPath}/updateTotalNotice/${totalNotice.noticeNo}">

											<i class="bx bx-book me-1"></i> 게시판수정 <!-- 계획서 등의 내용 -->
										</a> <a class="dropdown-item"
											href="${pageContext.request.contextPath}/removeTotalNotice?noticeNo=${totalNotice.noticeNo}">
											<i class="bx bx-book me-1"></i> 게시판삭제
										</a>
									</div>
								</div>
							</td>
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
						<form action="${pageContext.request.contextPath}/totalNotice" method="get">
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
		<!--  search bar end -->
		
				<div style="display: block; text-align: center;">		
					<c:if test="${paging.prePage}">
						<a href="${pageContext.request.contextPath}/totalNotice?currentPage=${paging.currentPage-10}
							&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">이전</a>
					</c:if>
					<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
						<c:choose>
							<c:when test="${p == paging.currentPage }">
								<b>${p}</b>
							</c:when>
							<c:when test="${p != paging.currentPage }">
								<a href="${pageContext.request.contextPath}/totalNotice?currentPage=${p}
									&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">${p}</a>
							</c:when>
						</c:choose>
					</c:forEach>
					
					<c:if test="${paging.nextPage}">
						<a href="${pageContext.request.contextPath}/totalNotice?currentPage=${paging.currentPage+10}
							&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">다음</a>
					</c:if>
				</div>

</div>
	<button class="btn btn-danger" type="button" id="btnWrite"
		style="float: right"
		onclick="location.href='${pageContext.request.contextPath}/addTotalNotice'">글쓰기</button>
<!-- / Main -->


<%@ include file="/WEB-INF/view/include/footer.jsp"%>
