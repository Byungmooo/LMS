<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/studentHeader.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Main -->
<div class="container-xxl flex-grow-1 container-p-y">
    <!-- Row1 구분 -->
    <div class="row text-center">
        <div class="card h-100">
            <div class="card-header">
                <div class="card-title mb-0">
                    <h5 class="m-0 me-2">공지사항 작성</h5>
<%--                    <small class="text-muted">게시글 보기</small>--%>
                </div>
            </div>
            <div class="card-body">
                <form name="form" action="${pageContext.request.contextPath}/addTotalNotice" method="post">
                    <input type="hidden" name="writer" value="테스트">
<%--                    <input type="hidden" name="memberId" value="${session.id}">--%>
                    <div>
                        제목
                        <input name="noticeTitle" id="title" size="80" value="" placeholder="제목을 입력해주세요">
                    </div>
                    <div>
                        내용
                        <textarea name="noticeContent" id="content" rows="4" cols="80"
                                  placeholder="내용을 입력해주세요"></textarea>
                    </div>
               

                    <div style="width:650px; text-align: center;">
                        <button class="btn btn-secondary" type="button" id="btnAdd">추가</button>
                        <button class="btn btn-secondary" type="button" id="btnCancel" onclick="window.history.back()">취소</button>
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
        $("#btnAdd").click(function () {
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
