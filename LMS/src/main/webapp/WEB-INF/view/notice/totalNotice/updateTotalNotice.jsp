<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
			<div class="border border-3" style="background-image: url('${pageContext.request.contextPath}/imgFile/notice.jpg'); width: 100%; height: 100%;">
			</div>
		</div>
	</div>
	<!-- Row1 구분 -->
	<div class="row text-center">
		<div class="card h-100">
			<div class="card-header">
				<div class="card-title mb-0">
					<h5 class="m-0 me-2"><strong>공지사항수정</strong></h5>
				</div>
			</div>
			<div class="card-body">
				<form name="form" action="${pageContext.request.contextPath}/employee/updateTotalNotice" method="post">
					<table class="table table-bordered">
						<tr>
							<th>제목</th>
							<td colspan="5"><input name="noticeTitle" id="title" class="form-control"
								size="80" value="${totalNotice.noticeTitle}"
								placeholder="제목을 입력해주세요"></td>
							<th rowspan="2">조회수</th>
							<td rowspan="2">${totalNotice.views}</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${totalNotice.writer}</td>
							<th>등록일</th>
							<td>${totalNotice.createDate}</td>
							<th>수정일</th>
							<td>${totalNotice.updateDate}</td>

						</tr>

						<tr>
							<th>내용</th>
							<td colspan="7"><textarea class="form-control"
									rows="10px" name="noticeContent" id="content" rows="4"
									cols="80" placeholder="내용을 입력해주세요">${totalNotice.noticeContent}</textarea>
							</td>

						</tr>
					</table>	
					<div class="text-center">
						<!-- 게시물번호를 hidden으로 처리 -->
						<input type="hidden" name="noticeNo"
							value="${totalNotice.noticeNo}">
						<button class="btn btn-primary" type="button" id="btnUpdate">수정</button>
						<button class="btn btn-primary" type="button" id="btnCancel"
							onclick="window.history.back()">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- /Row1 구분 -->
</div>
<!-- /Main -->
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>


</body>
<script>
	$(document)
			.ready(
					function() {
						$("#btnUpdate")
								.click(
										function() {
											if (confirm("수정하시겠습니까?")) {
												document.form.action = "${pageContext.request.contextPath}/employee/updateTotalNotice";
												document.form.method = "post";
												document.form.submit();
											}
										});
					});
</script>
</html>
