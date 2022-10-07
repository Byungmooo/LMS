<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Header -->
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
		<div class="row">
			<div class="col-sm-3 col-12"></div>
			<div class="col-sm-6 col-12 text-center">
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">"${memberName}"님 /</span>${lectureName}
				</h4>
			</div>

<!-- lectureMenu -->
		<div>
			<ul class="nav nav-pills flex-column flex-md-row mb-3">
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/openedLectureOne?openedLecNo=${openedLecNo}">
					<i class="bx bx-user me-1"></i>
						강의상세
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureNoticeList?openedLecNo=${openedLecNo}">
					<i class="bx bx-bell me-1"></i> 
						강의공지사항
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureQuestionList?openedLecNo=${openedLecNo}">
					<i class="bx bx-link-alt me-1"></i> 
						질문게시판
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/assignmentList?openedLecNo=${openedLecNo}&studentCode=${memberCode}">
					<i class="bx bx-link-alt me-1"></i> 
						과제게시판
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureAttendanceList?openedLecNo=${openedLecNo}&memberCode=${memberCode}">
					<i class="bx bx-link-alt me-1"></i> 
						강의출석
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">exam/studentExList?openedLecNo=${openedLecNo}&memberCode=${memberCode}</c:if>
						<c:if test="${memberType eq '교수'}">exam/professorExList?openedLecNo=${openedLecNo}&memberCode=${memberCode}</c:if>">
					<i class="bx bx-link-alt me-1"></i> 
						강의시험
					</a>
				</li>
			</ul>
		</div>
		<hr class="my-5" />

<!-- studentLectureOne -->
<div class="row text-center">
<div class="card">
<h5 class="card-header"><strong>${question.lectureName}</strong></h5>
<hr class="my-0"/>

<div class="card-body">
 <form name="form" action="${pageContext.request.contextPath}/student/updateLectureQuestion" method="post">
<table class="table table-bordered">
    <tr>
        <th>질문번호</th>
        <td>${question.lecQuestionNo}</td>
        <th>작성자</th>
        <td>${question.writer}</td>
        <th>답변여부</th>
        <td>${question.answerY}</td>
        <th>등록날짜</th>
        <td>${question.createDate}</td>
    </tr>
    <tr>
        <th>제목</th>
        <td colspan="7">   <input class="form-control" name="noticeTitle" id="title" size="115" value="${question.noticeTitle}"
       placeholder="제목을 입력해주세요">
        
        </td>
    </tr>
    <tr>
        <th>질문내용</th>
        <td colspan="7"><textarea class="form-control" rows="20px"  name="noticeContent" id="content" rows="4" cols="80"
                                  style="background-color:#fff;"    placeholder="내용을 입력해주세요">${question.noticeContent}</textarea>
        </td>
    </tr>

    <tr>
        <th>답변내용</th>
        <td colspan="7"><textarea class="form-control" rows="20px" readonly="readonly"
                                  style="background-color:#fff;">${answer.answerContent}</textarea></td>
    </tr>
    
</table>
            </form>
           <div style="width:650px; text-align: right;">
 						<button class="btn btn-primary" type="button" id="btnUpdate">수정</button>
                        <button class="btn btn-primary" type="button" id="btnCancel" onclick="window.history.back()">취소</button>
           </div>
        
    </div>
    </div>
    </div>
    </div>
    </div>
    <!-- / Main -->
    
<script>
  $(document).ready(function () {
	   $("#btnUpdate").click(function () {
            if (confirm("수정하시겠습니까?")) {
                document.form.action = "${pageContext.request.contextPath}/student/updateLectureQuestion?lecQuestionNo=${question.lecQuestionNo}";
                document.form.method = "post";
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
    <!-- Footer -->
    <c:import url="/WEB-INF/view/include/footer.jsp"></c:import>
