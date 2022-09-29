<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<!-- studentLectureMenu -->
		<div class="row">
			<div class="col-sm-9 col-12">
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">"${memberName}"님 /</span>${lectureName}
				</h4>
			</div>
			<div class="col-sm-3 col-12">
				<a class="btn btn-info" href="${pageContext.request.contextPath}/student/studentLectureList?memberCode=${memberCode}" style="float: right;">
					강의리스트
				</a>
			</div>
		</div>
		<div>
			<ul class="nav nav-pills flex-column flex-md-row mb-3">
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/student/openedLectureOne?openedLecNo=${openedLecNo}">
					<i class="bx bx-user me-1"></i>
						강의홈
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/student/lectureNoticeList?openedLecNo=${openedLecNo}">
					<i class="bx bx-bell me-1"></i> 
						강의공지사항
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/student/lectureQuestionList?openedLecNo=${openedLecNo}">
					<i class="bx bx-link-alt me-1"></i> 
						질문게시판
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/student/assignmentList?openedLecNo=${openedLecNo}">
					<i class="bx bx-link-alt me-1"></i> 
						과제게시판
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/student/lectureAttendanceList?openedLecNo=${openedLecNo}&memberCode=${memberCode}">
					<i class="bx bx-link-alt me-1"></i> 
						강의출석
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="">
					<i class="bx bx-link-alt me-1"></i> 
						강의시험
					</a>
				</li>
			</ul>
		</div>
		<hr class="my-5" />
	
	<!-- RowPerPage Option -->
    <div class="row">
        <div class="col-sm-9 col-12 text-center"></div>
        <div class="col-sm-3 col-12 text-center">
            <select class="form-select" name="sel" id="rowPerPage">
                <option value="5"
                        <c:if test="${paging.rowPerPage == 5}">selected</c:if>>5줄 보기
                </option>
                <option value="10"
                        <c:if test="${paging.rowPerPage == 10}">selected</c:if>>10줄 보기
                </option>
                <option value="15"
                        <c:if test="${paging.rowPerPage == 15}">selected</c:if>>15줄 보기
                </option>
                <option value="20"
                        <c:if test="${paging.rowPerPage == 20}">selected</c:if>>20줄 보기
                </option>
            </select>
        </div>
    </div>
		
		<!-- studentAssignmentList -->
		<div class="card text-center">
			<h5 class="card-header">강의질문</h5>
			<div class="table-responsive text-nowrap">
				<table class="table">
					<caption class="ms-4">List of Assignment</caption>
					<thead>
						<tr>
							<th width="10%">번호</th>
							<th width="50%">제목</th>
							<th width="10%">답변여부</th>
							<th width="20%">날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="q" items="${question}">
							<tr>
								<td><strong>${q.lecQuestionNo}</strong></td>
								<td>
									<c:if test="${sessionScope.memberType eq '학생'}">
											<a href="${pageContext.request.contextPath}/student/lectureQuestionOne?lecQuestionNo=${q.lecQuestionNo}">
										${q.noticeTitle}</a>
									</c:if>
									<c:if test="${sessionScope.memberType eq '교수'}">
											<a href="${pageContext.request.contextPath}/professor/lectureQuestionOne?lecQuestionNo=${q.lecQuestionNo}">
										${q.noticeTitle}</a>
									</c:if>
									
								</td>
								<td><span class="badge bg-label-primary me-1"></span>${q.answerY}</td>
								<td><span class="badge bg-label-secondary me-1"></span>${q.createDate}</td>
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
						<form action="${pageContext.request.contextPath}/student/lectureQuestionList" method="get">
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
                <c:choose>
                    <c:when test="${(paging.currentPage-10) < 1}">
                        <a href="javascript:goPage(1, '');">이전</a>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:goPage('${paging.currentPage-10}', '');">이전</a>
                    </c:otherwise>
                </c:choose>
            </c:if>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
                <c:choose>
                    <c:when test="${p == paging.currentPage }">
                        <b>${p}</b>
                    </c:when>
                    <c:when test="${p != paging.currentPage }">
                        <a href="javascript:goPage('${p}', '');">${p}</a>
                    </c:when>
                </c:choose>
            </c:forEach>
            <c:if test="${paging.nextPage}">
                <c:choose>
                    <c:when test="${paging.currentPage+10 > paging.lastPage}">
                        <a href="javascript:goPage('${paging.lastPage}', '');">다음</a>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:goPage('${paging.currentPage+10}', '');" >다음</a>
                    </c:otherwise>
                </c:choose>
            </c:if>
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
		            currentPage:"${paging.currentPage}",
		            rowPerPage:"${paging.rowPerPage}",
		            searchType:"${paging.searchType}",
		            keyword:"${paging.keyword}",
		        }
		
		        if(currentPage != '') param.currentPage = currentPage;
		        if(rowPerPage != '') param.rowPerPage = rowPerPage;
				//
		        var url = path +'/student/lectureQuestionList';
		        url += '?currentPage=' + param.currentPage;
		        url += '&rowPerPage='+ param.rowPerPage;
		        url += '&searchType='+ param.searchType ;
		        url += '&keyword='+ param.keyword ;
		
		        return url;
		    }
		</script>
		

									
	
				</div>
				
<c:if test="${sessionScope.memberType eq '학생'}">
        <a href="${pageContext.request.contextPath}/student/addLectureQuestion"
           class="btn btn-primary">질문하기</a>           
   </c:if>				
				
	</div>
	<!-- / Main -->
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
