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
                    <h5 class="m-0 me-2">게시글 보기</h5>
                    <%--                    <small class="text-muted">게시글 보기</small>--%>
                </div>
            </div>
            <div class="card-body">
                <form name="form" action="${pageContext.request.contextPath}/employee/updateTotalNotice" method="post">
                    <div>        <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
                        <fmt:parseDate value="${totalNotice.createDate}" pattern="yyyy-MM-dd HH:mm" var="noticeDate"/>
                        작성일자 : <fmt:formatDate value="${noticeDate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
                        <!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
                    </div>

                    <div>
                        조회수 : ${totalNotice.views}
                    </div>
                    <div>
                        제목
                        <input name="noticeTitle" id="title" size="80" value="${totalNotice.noticeTitle}"
                               placeholder="제목을 입력해주세요">
                    </div>
                    <div>
                        내용
                        <textarea name="noticeContent" id="content" rows="4" cols="80"
                                  placeholder="내용을 입력해주세요">${totalNotice.noticeContent}</textarea>
                    </div>

                    <%--                    <div>--%>
                    <%--                        비밀번호--%>
                    <%--                        <input name="pw" id="pw" size="80" value="" placeholder="비밀번호 입력">--%>
                    <%--                    </div>--%>
                    <div style="width:650px; text-align: center;">
                        <!-- 게시물번호를 hidden으로 처리 -->
                        <input type="hidden" name="noticeNo" value="${totalNotice.noticeNo}">            
 						<button class="btn btn-info" type="button" id="btnUpdate">수정</button>
                        <button class="btn btn-info" type="button" id="btnDelete">삭제</button>
                        <button class="btn btn-info" type="button" id="btnCancel" onclick="window.history.back()">취소</button>
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
        $("#btnDelete").click(function () {
            if (confirm("삭제하시겠습니까?")) {
                document.form.action = "${pageContext.request.contextPath}/removeTotalNotice";
                document.form.method = "get";
                document.form.submit();
            }
        });

        $("#btnUpdate").click(function () {
            let title = $("#title").val();
            let content = $("#content").val();
            if (!title) {
                alert("제목을 입력하세요");
                document.form.title.focus();
                return;
            }
            if (!content) {
                alert("내용을 입력하세요");
                document.form.content.focus();
                return;
            }
            document.form.submit();
        });
    });
</script>
</html>
