<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <!-- Row1 구분 -->
    <div class="row text-center">
        <div class="card h-100">
            <div class="card-header">
                <div class="card-title mb-0">
                    <h5 class="m-0 me-2">공지사항 수정</h5>
                    <%--                    <small class="text-muted">게시글 보기</small>--%>
                </div>
            </div>
            <div class="card-body">
                <form name="form" action="${pageContext.request.contextPath}/employee/updateTotalNotice" method="post">
             	<!-- totalNoticeOne -->
		<div class="row text-center">
			<div class="card">
				<h5 class="card-header"><strong>제목 :     <input name="noticeTitle" id="title" size="80" value="${totalNotice.noticeTitle}"
                               placeholder="제목을 입력해주세요"></strong></h5>
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
							<td colspan="5"> 	  <textarea class="form-control" rows="20px" name="noticeContent" id="content" rows="4" cols="80"
                                  placeholder="내용을 입력해주세요">${totalNotice.noticeContent}</textarea> </td>
					
						</tr>
					</table>
								<div>	

               </div>
               </div>
               </div>
               </div>
               
             
                    <div style="width:650px; text-align: right;">
                        <!-- 게시물번호를 hidden으로 처리 -->
                        <input type="hidden" name="noticeNo" value="${totalNotice.noticeNo}">            
 						<button class="btn btn-primary" type="button" id="btnUpdate">수정</button>
                        <button class="btn btn-primary" type="button" id="btnCancel" onclick="window.history.back()">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- /Row1 구분 -->
</div>
<!-- /Main -->
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>


</body>
<script>
    $(document).ready(function () {
		 $("#btnUpdate").click(function () {
            if (confirm("수정하시겠습니까?")) {
                document.form.action = "${pageContext.request.contextPath}/employee/updateTotalNotice";
                document.form.method = "post";
                document.form.submit();
            }
        });
    });
</script>
</html>
