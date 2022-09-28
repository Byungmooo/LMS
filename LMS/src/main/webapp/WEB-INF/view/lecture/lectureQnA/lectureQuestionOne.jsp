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
    <c:otherwise>
    </c:otherwise>
</c:choose>

<!-- Main -->
<div class="container-xxl flex-grow-1 container-p-y">
<h4 class="fw-bold py-3 mb-4">
    <span class="text-muted fw-light">"이름"님 /</span>${map.lectureName}
</h4>

<!-- studentLectureMenu -->
<ul class="nav nav-pills flex-column flex-md-row mb-3">
    <li class="nav-item">
        <a class="nav-link active" href="">
            <i class="bx bx-user me-1"></i>
            강의홈
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="">
            <i class="bx bx-bell me-1"></i>
            강의공지사항
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="">
            <i class="bx bx-link-alt me-1"></i>
            질문게시판
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link"
           href="${pageContext.request.contextPath}/student/openedAssignmentList?openedLecNo=${map.openedLecNo}&studentCode=${memberCode}">
            <i class="bx bx-link-alt me-1"></i>
            과제게시판
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="">
            <i class="bx bx-link-alt me-1"></i>
            강의출석
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="">
            <i class="bx bx-link-alt me-1"></i>
            강의시험
        </a>
    </li>
</ul>
<hr class="my-5"/>

<!-- studentLectureOne -->
<div class="row text-center">
<div class="card">
<h5 class="card-header"><strong>${question.lectureName}</strong></h5>
<hr class="my-0"/>

<div class="card-body">
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
        <td colspan="7">${question.noticeTitle}</td>
    </tr>
    <tr>
        <th>질문내용</th>
        <td colspan="7"><textarea class="form-control" rows="20px" readonly="readonly"
                                  style="background-color:#fff;">${question.noticeContent}</textarea>
        </td>
    </tr>

    <tr>
        <th>답변내용</th>
        <td colspan="7"><textarea class="form-control" rows="20px" readonly="readonly"
                                  style="background-color:#fff;">${answer.answerContent}</textarea></td>
    </tr>
</table>
<div>
  <c:if test="${sessionScope.memberType eq '교수'}">
        <a href="${pageContext.request.contextPath}/professor/addLectureAnswer"
           class="btn btn-warning">답변하기</a>           
   </c:if>
   <c:if test="${sessionScope.memberType eq '학생'}">
   		<a href="${pageContext.request.contextPath}/student/updateLectureQuestion/${lectureQuesion.opendLecNo}"
				class="btn btn-info">수정</a>
		<a href="${pageContext.request.contextPath}/student/removeLectrueQuestion?opendLecNo=${lectureQuesion.opendLecNo}"
				class="btn btn-info">삭제</a>
  </c:if>
    <a href="javascript:window.history.back()" class="btn btn-info">목록</a>
    </div>
    </div>
    </div>
    </div>
    </div>
    <!-- / Main -->
    <!-- Footer -->
    <c:import url="/WEB-INF/view/include/footer.jsp"></c:import>
