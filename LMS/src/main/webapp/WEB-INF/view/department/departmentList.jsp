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
  <div class="col-sm-12 col-12 text-center">
    <h4 class="fw-bold py-3 mb-4">
        <span class="text-muted fw-light">${memberName}
					${memberType}님 어서오세요 </span></h4>
   
<!-- Main -->


		<hr class="my-3" />
		
    <!-- RowPerPage Option -->

    
   

    <!-- 학부리스트 -->
		<div class="card text-center">
        <h5 class="card-header">전체 학과 리스트</h5>
        <!-- 검색바 -->
			<div class="row text-center">			
			      
				<div class="col-sm-6 col-12 text-center"></div>
			<c:if test="${sessionScope.memberType eq '직원'}">
				<div class="col-sm-1 col-12 text-center">학부별</div>
				<div class="col-sm-2 col-12 text-center">

					<select name="dep" id="searchType" class="form-select">
						<option value=""
							<c:if test="${paging.searchType eq ''}">selected</c:if>>전체</option>
						<c:forEach items="${department}" var="d">
							<option value="${d.departmentCode}"
								<c:if test="${paging.searchType eq d.departmentCode}">selected</c:if>>${d.departmentName}</option>
						</c:forEach>
					</select>
				</div>
				

			</c:if>
				
				<div class="col-sm-1 col-12 text-center">정렬기준</div>
				<div class="col-sm-2 col-12 text-center">
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
        
          <div class="table-responsive text-nowrap">
        
            <table class="table">
                <caption class="ms-4"></caption>
                   <thead>
					<tr>
						<th>학부 코드</th>
						<th>학부 이름</th>
						<th>학부 생성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="d" items="${list}">
						<tr>
							<td>${d.departmentCode}</td>	
							<td>
								<a href="${pageContext.request.contextPath}/emplyoee/departmentOne?departmentCode=${d.departmentCode}">${d.departmentName}</a>
							</td>
							<td>${d.createDate}</td>								
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
            <form action="${pageContext.request.contextPath}/emplyoee/departmentList" method="get">
                <input type="hidden" name="rowPerPage" value="${paging.rowPerPage}">
                
                <div class="row">
                    <div class="col-sm-3 col-12 text-center">
                        <select name="searchType" class="form-select">
                            <option value="" selected="selected">전체</option>
                            <option value="code">학부코드</option>
                            <option value="name">학부이름</option>
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
        
              <div class="col-sm-2 col-12">
	        <c:if test="${sessionScope.memberType eq '직원'}">
		       	<form action ="${pageContext.request.contextPath}/employee/addDepartment" method="get">
		       		<button type="submit" class="btn btn-primary" style="float: right">학부추가하기</button>  
		       		<input type="hidden" name ="departmentCode" value="">
		       	</form>  
		  </c:if>
		</div>
        <!--  search bar end -->
	<!-- 페이징 -->
			<div class="row text-center" style="margin-top: 20px;">
				<div class="col-sm-4 col-12 text-center">
				</div>
				<div class="col-sm-4 col-12 text-center">
					<ul class="pagination justify-content-center">
						<c:if test="${paging.prePage}">
							<li class="page-item prev">
								<a class="page-link" href="${pageContext.request.contextPath}/emplyoee/departmentList?currentPage=${paging.currentPage-1}
									&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}&memberCode=${memberCode}">
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
										<a class="page-link" href="${pageContext.request.contextPath}/emplyoee/departmentList?currentPage=${p}
										&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}&memberCode=${memberCode}">${p}</a>
									</li>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.nextPage}">
							<li class="page-item next">
								<a class="page-link" href="${pageContext.request.contextPath}/emplyoee/departmentList?currentPage=${paging.currentPage+1}
									&rowPerPage=${paging.rowPerPage}&keyword=${paging.keyword}&searchType=${paging.searchType}&memberCode=${memberCode}">
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
</div></div></div>

<script>
	// rowPerPage 갱신
	$("#rowPerPage").on("change", (e) => {
	    location.href = createUrl('', e.target.value, '');
	})
	
	// searchType 갱신
	$("#searchType").on("change", (e) => {
	    location.href = createUrl('', '', e.target.value);
	})
	
	const goPage = (currentPage, rowPerPage) => {
	    location.href = createUrl(currentPage, rowPerPage);
	};
	
	const createUrl = (currentPage, rowPerPage, searchType) => {
	    const path = "${pageContext.request.contextPath}";
	    const param = {
	        currentPage:"${paging.currentPage}",
	        rowPerPage:"${paging.rowPerPage}",
	        searchType: $('#searchType').val(),
	        keyword:"${paging.keyword}",
	    }
	
	    if(currentPage != '') param.currentPage = currentPage;
	    if(rowPerPage != '') param.rowPerPage = rowPerPage;
	   if(searchType != '') param.searchType = searchType;
	
	    var url = path +'/emplyoee/departmentList';
	    url += '?currentPage=' + param.currentPage;
	    url += '&rowPerPage='+ param.rowPerPage;
	    url += '&searchType='+ param.searchType ;
	    url += '&keyword='+ param.keyword ;
	
	    return url;
	}
</script>


<%@ include file="/WEB-INF/view/include/footer.jsp" %>