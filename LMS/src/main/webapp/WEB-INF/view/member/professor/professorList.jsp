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
        <span class="text-muted fw-light">"${sessionScope.memberName}님 "/</span> 교수 전체 리스트
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

    <!-- 교수 리스트 -->
    <div class="card">
        <h5 class="card-header">승인된 교수 리스트</h5>
        <div class="table-responsive text-nowrap">
            <table class="table">
                <caption class="ms-4"></caption>
                   <thead>
					<tr>
						<th>아이디</th>						
						<th>교수코드</th>
						<th>이름</th>
						<th>학부코드</th>
						<th>학과장여부</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${list}">
						<tr>
							<td>${p.memberId}</td>
							<td>${p.professorCode}</td>
							<td>
								<c:if test="${memberType eq '교수'}">
									<a href="${pageContext.request.contextPath}/professor/professorOne?professorCode=${p.professorCode}">
									${p.memberName}
									</a>
								</c:if>
								<c:if test="${memberType eq '직원'}">
									<a href="${pageContext.request.contextPath}/employee/professorOne?professorCode=${p.professorCode}">
									${p.memberName}
									</a>
								</c:if>
							</td>
							<td>${p.departmentCode}</td>				
							<td>${p.departmentLeader}</td>					
							<td>${p.professorState}</td>							
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
            <form action="${pageContext.request.contextPath}/member/professorList" method="get">
                <input type="hidden" name="rowPerPage" value="${paging.rowPerPage}">
                <div class="row">
                    <div class="col-sm-3 col-12 text-center">
                        <select name="searchType" class="form-select">
                            <option value="" selected="selected">전체</option>
                            <option value="id">아이디</option>
                            <option value="code">교수코드</option>
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
						<a href="${pageContext.request.contextPath}/member/professorList?currentPage=${paging.currentPage-1}
							&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">이전</a>
					</c:if>
					<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
						<c:choose>
							<c:when test="${p == paging.currentPage }">
								<b>${p}</b>
							</c:when>
							<c:when test="${p != paging.currentPage }">
								<a href="${pageContext.request.contextPath}/member/professorList?currentPage=${p}
									&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">${p}</a>
							</c:when>
						</c:choose>
					</c:forEach>
					
					<c:if test="${paging.nextPage}">
						<a href="${pageContext.request.contextPath}/member/professorList?currentPage=${paging.currentPage+1}
							&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}">다음</a>
					</c:if>
				</div>
			</div>
		</div>
	<!-- / Main -->

<%@ include file="/WEB-INF/view/include/footer.jsp" %>