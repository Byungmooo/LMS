<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/include/studentHeader.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="fw-bold py-3 mb-4">
			<span class="text-muted fw-light">"이름"님 /</span>전체게시판
		</h4>
		<hr class="my-5" />
		
		<!-- studentLectureList -->
		<div class="card">
			<h5 class="card-header">전체게시판</h5>
			<div class="table-responsive text-nowrap">
				<table class="table">
					<caption class="ms-4"></caption>
					<thead>
						<tr>
               			<th>번호</th>
                        <th>부서코드</th>
                        <th>회원아이디</th>
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
                            <td>${row.memberId}</td>
					
								<td><span class="badge bg-label-secondary me-1">        
								 <a href="${pageContext.request.contextPath}/totalNotice/${row.noticeNo}">
                                        ${row.noticeTitle}
                                </a></span></td>
                                                            <td>${row.view}</td>
                            <td>${row.createDate}</td>
                            <td>${row.updateDate}</td>
								<td>
									<div class="dropdown">
										<button type="button" class="btn p-0 dropdown-toggle hide-arrow"
											data-bs-toggle="dropdown">
											<i class="bx bx-dots-vertical-rounded"></i>
										</button>
										<div class="dropdown-menu">
											<a class="dropdown-item" href="${pageContext.request.contextPath}/updateTotalNotice/${totalNotice.noticeNo}">
											
											<i class="bx bx-book me-1"></i>
												게시판수정 <!-- 계획서 등의 내용 -->
											</a>
											<a class="dropdown-item" href="${pageContext.request.contextPath}/removeTotalNotice?noticeNo=${totalNotice.noticeNo}">
											<i class="bx bx-book me-1"></i>
												게시판삭제
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
	</div>
	<!-- / Main -->
	
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
