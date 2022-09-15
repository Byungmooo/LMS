<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 목록</title>


</head>
<body>

<h2>게시글 목록</h2>
<button type="button" id="btnWrite" style="float:auto">글쓰기</button>
<table border="1" width="1000px">
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
			<a href="${pageContext.request.contextPath}/boardOne?noticeNo=${row.noticeNo}&view=${row.view+1}">
					${b.title}
			</a>
			</td>
        <td>${row.view}</td>
        <td>${row.createDate}</td>
        <td>${row.updateDate}</td>
  
      


    </tr>    
    </c:forEach>
    </tbody>
    
</table>
		
		<div>
			<c:if test="${currentPage > 1}">
				<a href="${pageContext.request.contextPath}/TotalNoticeList?currentPage=${currentPage-1}">이전</a>
			</c:if>
			<c:if test="${currentPage > lastPage}">
				<a href="${pageContext.request.contextPath}/TotalNoticeList?currentPage=${currentPage+1}">다음</a>
			</c:if>	
		</div>


<script>
    $(document).ready(function(){
        $("#btnWrite").click(function(){
            // 페이지 주소 변경(이동)
            location.href = "${path}/view/TotalNoticeForm.jsp";
        });
    });
</script>
</body>
</html>
