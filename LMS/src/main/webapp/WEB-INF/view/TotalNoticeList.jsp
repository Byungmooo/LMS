<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/include/studentHeader.jsp"%>
	<!-- Main -->
		<div class="container-xxl flex-grow-1 container-p-y">	  
			<!-- Row1 구분 -->
			<div class="row text-center">	    
				<div class="card h-100">
					<div class="card-header">
						<div class="card-title mb-0">
							<h5 class="m-0 me-2">전체공지사항</h5>
							<small class="text-muted"></small>
						</div>
					</div>
					<div class="card-body">
					
<table border="1"  width="100%" >
<thead>
    <tr>
        <th>번호</th>
        <th>부서코드</th>
        <th>회원아이디</th>
        <th>제목</th>
        <th>조회수</th>    
        <th>작성일</th>
 		<th>수정일</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="row" items="${list}">
    <tr>
        <td>${row.noticeNo}</td>
        <td>${row.departmentCode}</td>
          <td>${row.memberId}</td>
        <td>
			<a href="${pageContext.request.contextPath}/TotalNoticeOne?noticeNo=${row.noticeNo}&view=${row.view+1}">
					${row.noticeTitle}
			</a>
			</td>
        <td>${row.view}</td>
        <td>${row.createDate}</td>
        <td>${row.updateDate}</td>
  
      


    </tr>    
    </c:forEach>
    </tbody>
    
</table>
		<button type="button" id="btnWrite" style="float:right">글쓰기</button>
		<div>
			<c:if test="${currentPage > 1}">
				<a href="${pageContext.request.contextPath}/TotalNoticeList?currentPage=${currentPage-1}">이전</a>
			</c:if>
			<c:if test="${currentPage > lastPage}">
				<a href="${pageContext.request.contextPath}/TotalNoticeList?currentPage=${currentPage+1}">다음</a>
			</c:if>	
		</div>
					</div>
				</div>
			</div>
			<!-- /Row1 구분 -->
		</div>
		<!-- /Main -->	

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>


</body>
<script>
    $(document).ready(function(){
        $("#btnWrite").click(function(){
            // 페이지 주소 변경(이동)
            location.href = "${path}/view/TotalNoticeAdd.jsp";
        });
    });
</script>
</html>

<%@ include file="/WEB-INF/view/include/footer.jsp"%> 