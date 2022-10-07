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
	<form name="form" action="${pageContext.request.contextPath}/employee/removeTotalNotice" method="get">
		<h4 class="fw-bold py-3 mb-4">
			<span class="text-muted fw-light">${totalNotice.writer} 님</span>
		</h4>

	

		<hr class="my-3" />
		
		<!-- totalNoticeOne -->
		<div class="row text-center">
			<div class="card">
				<h5 class="card-header"><strong>제목 : ${totalNotice.noticeTitle}</strong></h5>
				<hr class="my-0" />
				
				<div class="card-body">
					<table class="table table-bordered">
					
						<tr>
							<th>작성자</th>
							<td>${totalNotice.writer}</td>
							<th>부서코드</th>
							<td>${totalNotice.departmentCode}</td>
							<th rowspan="2">조회수</th>
							<td rowspan="2">${totalNotice.views}</td>
						</tr>
						<tr>
							<th>등록일</th>
							<td>${totalNotice.createDate}</td>
							<th>수정일</th>
							<td>${totalNotice.updateDate}</td>
				
						</tr>
		
						<tr>
							<th>내용</th>
							<td colspan="5"><textarea class="form-control" rows="20px" readonly="readonly" style="background-color:#fff;">${totalNotice.noticeContent}</textarea></td>
						</tr>
					</table>
								<div>	
   <c:if test="${sessionScope.memberType eq '직원'}">
            <input type="hidden" name="noticeNo" value="${totalNotice.noticeNo}">  
        <a href="${pageContext.request.contextPath}/employee/updateTotalNotice?noticeNo=${totalNotice.noticeNo}" class="btn btn-primary" >수정</a>
        	<button class="btn btn-primary" type="button" id="btnDelete">삭제</button>
        <a href="${pageContext.request.contextPath}/member/totalNoticeList" class="btn btn-primary"  >목록</a>
   </c:if>			
</div>

				</div>
			</div>
		</div></form>
	</div>
	<!-- / Main -->
<script>
    $(document).ready(function () {
		 $("#btnDelete").click(function () {
            if (confirm("삭제하시겠습니까?")) {
                document.form.action = "${pageContext.request.contextPath}/employee/removeTotalNotice?noticeNo=${totalNotice.noticeNo}";
                document.form.method = "get";
                document.form.submit();
            }
        });
    });
</script>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
