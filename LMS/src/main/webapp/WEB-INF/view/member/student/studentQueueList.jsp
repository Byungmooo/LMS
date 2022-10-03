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
    <h4 class="fw-bold py-3 mb-4">
        <span class="text-muted fw-light">"${sessionScope.memberName}님 "/</span> 승인대기목록
    </h4>
    <hr class="my-1"/>
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
     <br> 

    <!-- 학생리스트 -->
    <div class="card">
        <h5 class="card-header">학생 미승인 리스트</h5>
        <div class="table-responsive text-nowrap">
            <table class="table">
                <caption class="ms-4"></caption>
					<thead class="thead-light">
						<tr>
							<th scope="col" style="font-size: 15px; width: 15%;">아이디</th>
								<th scope="col" style="font-size: 15px; width: 18%;">이메일</th>
								<th scope="col" style="font-size: 15px; width: 13%;">핸드폰번호</th>
								<th scope="col" style="font-size: 15px; width: 10%;">이름</th>
								<th scope="col" style="font-size: 15px; width: 7%;">성별</th>
								<th scope="col" style="font-size: 15px; width: 11%;">생일</th>
								<th scope="col" style="font-size: 15px; width: 15%;">주소</th>
								<th scope="col" style="font-size: 15px; width: 8%;">승인</th>
								<th scope="col" style="font-size: 15px; width: 8%;">거절</th>
						</tr>
					</thead>		
				<tbody>
				<c:if test="${!empty studentQueueList}">
					<c:forEach var="s" items="${list}">
						<tr>
							<td>${s.memberId}</td>
							<td>
								<a href="${pageContext.request.contextPath}/employee/studentOne?studentCode=${s.studentCode}">${s.memberName}</a>
							</td>
							<td>${s.studentCode}</td>
							<td>${s.departmentCode}</td>				
							<td>${s.studentYear}</td>					
							<td>${s.studentState}</td>	
							<td>
								<button type="button" class="btn btn-primary" value="${s.memberId}">승인</button>
								<div class="modal-header">
									<h6 class="modal-title" id="modal-title-notification">확인</h6>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="py-3 text-center">
										<i class="ni ni-bell-55 ni-3x"></i>
										<h4 class="heading mt-4">승인 확인</h4>
										<p>${s.memberId} 학생의 회원가입을 승인하시겠습니까?</p>
									</div>				
								</div>			
								<div class="modal-footer">
									<button type="button" class="btn btn-link">취소</button>
									<button type="button" class="btn btn-primary" 
									onclick="location.href='${pageContext.request.contextPath}/employee/accessStudent/memberId?=${s.memberId}'">승인</button>
									<button type="button" class="btn btn-danger" data-toggle="modal" 
										data-target="#modal-notification-${s.memberId}">거절</button>
								</div>		
								<div class="modal-body">
									<div class="py-3 text-center">
										<i class="ni ni-bell-55 ni-3x"></i>
										<h4 class="heading mt-4">거절 확인</h4>
										<p>${s.memberId} 학생의 회원가입을 거절하시겠습니까?</p>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-link text-white ml-auto" 
									onclick="location.href='${pageContext.request.contextPath}/member/employee/negativeStudent/${s.memberId}'">거절</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty studentQueueList}">
					<tr>
						<td colspan="9">(대기중인 학생이 없습니다)</td>
					</tr>
				</c:if>	
				</tbody>
			</table>
		</div>
	</div>
<!--  search bar -->
    <hr class="my-3"/>
     <div class="row">
        <div class="col-sm-7 col-12 text-center">
            <form action="${pageContext.request.contextPath}/employee/studentQueueList" method="get">
                <input type="hidden" name="rowPerPage" value="${paging.rowPerPage}">
                <div class="row">
                    <div class="col-sm-3 col-12 text-center">
                        <select name="searchType" class="form-select">
                            <option value="" selected="selected">전체</option>
                            <option value="id">아이디</option>
                            <option value="name">이름</option>
                        </select>
                    </div>
                    <div class="col-sm-7 col-12 text-center">
                        <input name="keyword" class="form-control" value="${paging.keyword}">
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
		
		        var url = path +'/member/studentQueueList';
		        url += '?currentPage=' + param.currentPage;
		        url += '&rowPerPage='+ param.rowPerPage;
		        url += '&searchType='+ param.searchType ;
		        url += '&keyword='+ param.keyword ;
		
		        return url;
		    }
		</script>
    </div>
</div>
<!-- / Main -->


<%@ include file="/WEB-INF/view/include/footer.jsp" %>