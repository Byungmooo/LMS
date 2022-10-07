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
			<div class="col-sm-3 col-12"></div>
			<div class="col-sm-6 col-12 text-center">
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">"${memberName}"님 /</span>${lectureName}
				</h4>
			</div>
			<c:if test="${memberType eq '학생'}">
				<div class="col-sm-3 col-12" style="float:right;">
					<a href="${pageContext.request.contextPath}/student/studentLectureList?memberCode=${memberCode}" 
						class="btn btn-primary" style="float: right;">강의리스트</a>
				</div>
			</c:if>
			<c:if test="${memberType eq '교수'}">
				<div class="col-sm-3 col-12">
					<a href="${pageContext.request.contextPath}/professor/professorLectureList?memberCode=${memberCode}" 
						class="btn btn-secondary" style="float: right;">강의리스트</a>
				</div>
			</c:if>
		</div>
		<div>
			<ul class="nav nav-pills flex-column flex-md-row mb-3">
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/openedLectureOne?openedLecNo=${openedLecNo}">
					<i class="bx bx-user me-1"></i>
						강의상세
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureNoticeList?openedLecNo=${openedLecNo}">
					<i class="bx bx-bell me-1"></i> 
						강의공지사항
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureQuestionList?openedLecNo=${openedLecNo}">
					<i class="bx bx-link-alt me-1"></i> 
						질문게시판
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/assignmentList?openedLecNo=${openedLecNo}&studentCode=${memberCode}">
					<i class="bx bx-link-alt me-1"></i> 
						과제게시판
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureAttendanceList?openedLecNo=${openedLecNo}&memberCode=${memberCode}">
					<i class="bx bx-link-alt me-1"></i> 
						강의출석
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">exam/studentExList?openedLecNo=${openedLecNo}&memberCode=${memberCode}</c:if>
						<c:if test="${memberType eq '교수'}">exam/professorExList?openedLecNo=${openedLecNo}&memberCode=${memberCode}</c:if>">
					<i class="bx bx-link-alt me-1"></i> 
						강의시험
					</a>
				</li>
			</ul>
		</div>
		
		<hr class="my-5" />
		
		<!-- 정렬 -->
		<div class="row">
			<div class="col-sm-10 col-12 text-center"></div>
			<div class="col-sm-2 col-12 text-center">
				<select  class="form-select" name="sel" id="rowPerPage">
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
	
		<!-- assignment -->
		<div class="card text-center" style="margin-top: 20px;">
			<c:if test="${memberType eq '학생'}">
				<h3 class="card-header">내가 제출해야 될 과제 리스트</h3>
			</c:if>
			<c:if test="${memberType eq '교수'}">
				<h3 class="card-header">과제 리스트</h3>
			</c:if>
			
			<div class="table-responsive text-nowrap">
				<table class="table table-bordered">
					<caption class="ms-4"></caption>
					<thead>
						<tr>
							<th>과제번호</th>
							<th>수강중인 강의번호</th>
							<th>과제제목</th>
							<th>과제내용</th>
							<th>마감일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="map" items="${list}">
							<tr>
								<td>${map.assignmentNo}</td>
								<td>
									<a href="${pageContext.request.contextPath}
										<c:if test="${memberType eq '학생'}">/student</c:if>
										<c:if test="${memberType eq '교수'}">/professor</c:if>
										/assignmentOne?assignmentNo=${map.assignmentNo}">
										${map.openedLecNo}
									</a>
								</td>
								<td>${map.assignmentTitle}</td>
								<td>
									<div>
										<textarea name="assignmentContent" id="assignmentContent"
											style="width: 100%; border-color: white;" readonly>
											 ${map.assignmentContent}</textarea>
									</div>	
								</td>
								<td>${map.endDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
<!-- 검색 -->
	    <hr class="my-3"/>
        <form action="${pageContext.request.contextPath}<c:if test="${memberType eq '학생'}">/student</c:if>
			<c:if test="${memberType eq '교수'}">/professor</c:if>/assignmentList" method="get">
            <input type="hidden" name="openedLecNo" value="${openedLecNo}">
            <input type="hidden" name="rowPerPage" value="${paging.rowPerPage}">
            <div class="row">
            	<div class="col-sm-2 col-12 text-center">
                </div>
                <div class="col-sm-2 col-12 text-center">
                    <select name="searchType" class="form-select">
                        <option value="" selected="selected">전체</option>
                        <option value="no">수강번호</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <div class="col-sm-4 col-12 text-center">
                    <input name="keyword" class="form-control" value="${paging.keyword}">
                </div>
                <div class="col-sm-2 col-12 text-center">
                    <button type="submit" class="btn btn-dark">검색</button>
                </div>
                <div class="col-sm-2 col-12 text-center">
					<c:if test="${memberType eq '교수'}">
						<a href="${pageContext.request.contextPath}/professor/addAssignment" 
							class="btn btn-primary">과제 추가</a>
					</c:if>
                </div>
            </div>
        </form>
       
        <!-- 페이징 -->
		<div class="row text-center" style="margin-top: 20px;">
			<div class="col-sm-4 col-12 text-center">
			</div>
			<div class="col-sm-4 col-12 text-center">
				<ul class="pagination justify-content-center">
					<c:if test="${paging.prePage}">
						<li class="page-item prev">
							<a class="page-link" href="${pageContext.request.contextPath}
								<c:if test="${memberType eq '학생'}">/student</c:if>
								<c:if test="${memberType eq '교수'}">/professor</c:if>/assignmentList?openedLecNo=${openedLecNo}&
								currentPage=${paging.currentPage-1}&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">
							<i class="tf-icon bx bx-chevron-left"></i>
							</a>
						</li>
					</c:if>
					<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
						<c:choose>
							<c:when test="${p == paging.currentPage }">
								<li class="page-item active">
									<a class="page-link" href="#">${p}</a>
								</li>
							</c:when>
							<c:when test="${p != paging.currentPage }">
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}
										<c:if test="${memberType eq '학생'}">/student</c:if>
										<c:if test="${memberType eq '교수'}">/professor</c:if>/assignmentList?openedLecNo=${openedLecNo}&
										currentPage=${p}&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">${p}</a>
								</li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.nextPage}">
						<li class="page-item next">
							<a class="page-link" href="${pageContext.request.contextPath}
								<c:if test="${memberType eq '학생'}">/student</c:if>
								<c:if test="${memberType eq '교수'}">/professor</c:if>/assignmentList?openedLecNo=${openedLecNo}&
								currentPage=${paging.currentPage+1}&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">
							<i class="tf-icon bx bx-chevron-right"></i>
							</a>
						</li>
					</c:if>
				</ul>
			</div>
			<div class="col-sm-4 col-12 text-center">
			</div>
		</div>
	</div>
<script>
	// rowPerPage 변경 이벤트
	$("#rowPerPage").on("change", (e) => {
	    location.href = createUrl('', e.target.value);
	})
	
	const goPage = (currentPage, rowPerPage) => {
	    location.href = createUrl(currentPage, rowPerPage);
	};
	
	const createUrl = (currentPage, rowPerPage) => {
	    const path = "${pageContext.request.contextPath}";
	    const param = {
	    	openedLecNo:"${openedLecNo}",
	        currentPage:"${paging.currentPage}",
	        rowPerPage:"${paging.rowPerPage}",
	        searchType:"${paging.searchType}",
	        keyword:"${paging.keyword}",
	    }
	
	    if(currentPage != '') param.currentPage = currentPage;
	    if(rowPerPage != '') param.rowPerPage = rowPerPage;
		
	    if("${memberType}" == '학생') {
	    	var url = path +'/student/assignmentList';
	    }
	    if("${memberType}" == '교수') {
	    	var url = path +'/professor/assignmentList';
	    }
		    url += '?openedLecNo=' + param.openedLecNo;
		    url += '&currentPage=' + param.currentPage;
		    url += '&rowPerPage='+ param.rowPerPage;
		    url += '&searchType='+ param.searchType ;
		    url += '&keyword='+ param.keyword ;
	
	    return url;
	}
</script>
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
		