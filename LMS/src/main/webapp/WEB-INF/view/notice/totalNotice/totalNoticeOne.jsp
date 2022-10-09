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
	<div class="row" style="height: 220px;">
		<div class="container" style="height: 200px;">
			<div class="border border-3"
				style="background-image: url('${pageContext.request.contextPath}/imgFile/notice.jpg'); width: 100%; height: 100%;">
			</div>
		</div>
	</div>

	<!-- totalNoticeOne -->
	<div class="row text-center">
		<div class="card">
			<h5 class="card-header">
				<strong>전체공지상세보기</strong>
			</h5>
			<div class="card-body">
				<table class="table table-bordered">
					<tr>
						<th>제목</th>
						<td colspan="3">${totalNotice.noticeTitle}</td>
						<th rowspan="2">조회수</th>
						<td rowspan="2">${totalNotice.views}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${totalNotice.writer}</td>
						<th>등록일</th>
						<td>${totalNotice.createDate}</td>
					</tr>

					<tr>
						<th>내용</th>
						<td colspan="5"><textarea class="form-control" rows="10px"
								readonly="readonly" style="background-color: #fff;">${totalNotice.noticeContent}</textarea></td>
					</tr>
				</table>
				<div>
					<c:if test="${sessionScope.memberType eq '직원'}">
						<input type="hidden" name="noticeNo"
							value="${totalNotice.noticeNo}">
						<a
							href="${pageContext.request.contextPath}/employee/updateTotalNotice?noticeNo=${totalNotice.noticeNo}"
							class="btn btn-primary">수정</a>
						<button class="btn btn-primary" onclick="del(${totalNotice.noticeNo})" type="button" id="btnDelete">삭제</button>

					</c:if>
					<a href="${pageContext.request.contextPath}/member/totalNoticeList"
						class="btn btn-primary">목록</a>
				</div>

			</div>
		</div>
	</div>
</div>
<!-- / Main -->
<script>
	function del(noticeNo) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='${pageContext.request.contextPath}/employee/removeTotalNotice?noticeNo='+noticeNo;
		}
	}
</script>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
