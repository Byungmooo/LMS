<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</c:choose>
<!-- Main -->
<div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-bold py-3 mb-4">
        <span class="text-muted fw-light">"이름"님 /</span>전체게시판
    </h4>
    <hr class="my-5"/>
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

    <!-- TotalNoticeList -->
    <div class="card">
        <h5 class="card-header">전체게시판</h5>
        <div class="table-responsive text-nowrap">
            <table class="table">
                <caption class="ms-4"></caption>
                   <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>조회수</th>
                    <th>작성일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="row" items="${list}">
                    <tr>
                        <td>${row.noticeNo}</td>
                        <td> <a href="${pageContext.request.contextPath}/member/totalNoticeOne?noticeNo=${row.noticeNo}"> ${row.noticeTitle} </a></td>
                        <td>${row.writer}</td>        
                        <td>${row.views}</td>
                        <td>${row.createDate}</td>
                        <td>
                       
                <div class="dropdown-menu">
              <a class="dropdown-item" href="${pageContext.request.contextPath}/updateTotalNotice/${totalNotice.noticeNo}">
                 <i class="bx bx-book me-1"></i> 게시판수정 </a> 
              <a class="dropdown-item" href="${pageContext.request.contextPath}/removeTotalNotice?noticeNo=${totalNotice.noticeNo}">
                 <i class="bx bx-book me-1"></i> 게시판삭제 </a>
                </div>
                        
                        </td>
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
            <form action="${pageContext.request.contextPath}/totalNotice" method="get">
                <input type="hidden" name="rowPerPage" value="${paging.rowPerPage}">
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
    
      <c:if test="${sessionScope.memberType eq '직원'}">
        <a href="${pageContext.request.contextPath}/employee/addTotalNotice"
           class="btn btn-info"  style="float: right">글쓰기</a>           
   </c:if>

</div>
<!-- / Main -->


<%@ include file="/WEB-INF/view/include/footer.jsp" %>