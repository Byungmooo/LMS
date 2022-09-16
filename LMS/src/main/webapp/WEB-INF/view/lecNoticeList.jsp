<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/include/studentHeader.jsp"%>	
	<div class= "container">
	<h1>강의 공지 게시판</h1>
		<a href= "${pageContext.request.contextPath}/addLecNoticeOne" class="btn btn-success">강의공지 쓰기</a>
	</div>
	<div class="container">
	<table class="table table-hover">
		<tr>
			<th>강의공지번호</th>
			<th>강의번호</th>
			<th>강의공지제목</th>
			<th>강의공지내용</th>			
			<th>등록일</th>		
			<th>수정일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var = "l"  items="${lecNoticeList}">
			<tr>
				<td>${l.lecNoticeNo}</td>
				<td>${l.openedLecNo}</td>
				<td>
					<a href="${pageContext.request.contextPath}/lecNoticeOne/${l.lecNoticeNo}">${l.lecNoticeTitle}</a>
				</td>
				<td>${l.lecNoticeContent}</td>
				<td>${l.createDate}</td>
				<td>${l.updateDate}</td>
				<td>${l.view}</td>
				
				<td>
				<a href="${pageContext.request.contextPath}/modifyLecNotice?lecNoticeNo=${l.lecNoticeNo}"
						class="btn btn-warning">수정</a></td>
				<td>
				<a href="${pageContext.request.contextPath}/removeLecNotice?lecNoticeNo=${l.lecNoticeNo}"
						class="btn btn-info">삭제</a></td>
				
			</tr>
			
		</c:forEach>	
		</tbody>	
	</table>
	</div>
	<!-- Page Navigation -->
						<div class="card-footer py-4">
							<nav aria-label="...">
								<ul class="pagination justify-content-center">
									<!-- 처음으로 버튼 -->
									<c:choose>
										<c:when test="${currentPage > 1}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/lectureNotice/lecNoticeList/1">
													<i class='fas fa-angle-double-left'></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a class="page-link"
												href="#"> <i class='fas fa-angle-double-left'></i>
											</a></li>
										</c:otherwise>
									</c:choose>

									<!-- 이전 버튼 -->
									<c:choose>
										<c:when test="${currentPage > 1}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/lectureNotice/lecNoticeList/${prePage}">
													<i class='fas fa-angle-left'></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a class="page-link"
												href="#"> <i class='fas fa-angle-left'></i>
											</a></li>
										</c:otherwise>
									</c:choose>

									<!-- 현재 페이지 표시 -->
									<c:forEach var="i" begin="${navFirstPage}" end="${navLastPage}">
										<c:if test="${i <= lastPage}">
											<c:choose>
												<%-- 현재 페이지 --%>
												<c:when test="${i == currentPage}">
													<li class="page-item active"><a class="page-link"
														href="#">${i}</a></li>
												</c:when>
												<%-- 현재 페이지가 아닌 선택 가능한 페이지 --%>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="${pageContext.request.contextPath}/lectureNotice/lecNoticeList/${i}">${i}</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>

									<!-- 다음 버튼 -->
									<c:choose>
										<c:when test="${currentPage < lastPage}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}}/lectureNotice/lecNoticeList/${nextPage}">
													<i class='fas fa-angle-right'></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a class="page-link"
												href="#"> <i class='fas fa-angle-right'></i>
											</a></li>
										</c:otherwise>
									</c:choose>

									<!-- 마지막으로 버튼 -->
									<c:choose>
										<c:when test="${currentPage < lastPage}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}}/lectureNotice/lecNoticeList/${lastPage}">
													<i class='fas fa-angle-double-right'></i>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a class="page-link"
												href="#"> <i class='fas fa-angle-double-right'></i>
											</a></li>
										</c:otherwise>
									</c:choose>
								</ul>

								<!-- 총 페이지 수 출력 -->
								<table style="margin: auto;">
									<tr>
										<td>
											<button type="button" class="btn btn-sm btn-outline-primary">
												${currentPage} / ${lastPage} 페이지</button>
										</td>
									</tr>
								</table>
							</nav>
						</div>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>    