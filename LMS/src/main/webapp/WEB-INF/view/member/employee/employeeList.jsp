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
	
	<!-- employeeList -->
	<div class="card">
		<h5 class="card-header">직원리스트</h5>
		<div class="table-responsive text-nowrap">
			<table class="table">
			<caption class="ms-4"></caption>
							
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>직원코드</th>
						<th>권한</th>
						<th>재직상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="e" items="${list}">
						<tr>
							<td>${e.memberId}</td>
							<td><span class="badge bg-label-secondary me-1">
							<a href="${pageContext.request.contextPath}/member/employee/employeeOne?employeeCode=${e.employeeCode}">${e.memberName}</a>
								</span>
							</td>
							<td>${e.employeeCode}</td>
							<td>${e.authority}</td>				
							<td>${e.employeeState}</td>							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
<!--  search bar -->
    <hr class="my-3"/>
    
    <div class="row">
        <div class="col-sm-2 col-12 text-center"></div>
        <div class="col-sm-7 col-12 text-center">
            <form action="${pageContext.request.contextPath}/member/employeeList" method="get">
                <input type="hidden" name="rowPerPage" value="${paging.rowPerPage}">
                <div class="row">
                    <div class="col-sm-3 col-12 text-center">
                        <select name="searchType" class="form-select">
                            <option value="" selected="selected">전체</option>
                            <option value="id">아이디</option>
                            <option value="code">직원코드</option>
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
		
		        var url = path +'/member/totalNoticeList';
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