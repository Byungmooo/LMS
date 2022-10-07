<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.addr {
	display: block;
	overflow: hidden;
	width: 100%;
	height: 2.7rem;
	padding: 0.6rem;
	font-size: 1.2rem;
	color: #000;
	border-radius: 0.2rem;
	border: 1px solid #ccc;
	resize: none;
}
</style>
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
	<!-- studentLectureMenu -->
	<div class="row">
		<div class="col-sm-9 col-12">
			<h4 class="fw-bold py-3 mb-4">
				<span class="text-muted fw-light">"${memberName}"님</span>${lectureName}
			</h4>
		</div>
	


	<hr class="my-1" />


	<!-- addLectureQuestion -->
	<div class="row text-center">
		<div class="card">
			<h5 class="card-header">
				<strong>공지사항 작성</strong>
			</h5>
			<hr class="my-0" />

			<div class="card-body">
				<form name="form"
					action="${pageContext.request.contextPath}/employee/addTotalNotice"
					method="post">


					<%--                    <input type="hidden" name="memberId" value="${session.id}">--%>

					<table class="table table-bordered">
			
						<tr>
							<th>부서코드</th>
								<td width="70%" colspan="2">
									<select name="departmentCode" class="form-select">
										<option value="" selected="selected">선택</option>
										<c:forEach items="${department}" var="d">
											<option value="${d.departmentCode}">${d.departmentName}</option>
										</c:forEach>
									</select>
								</td>

						</tr>
			
						<tr>
							<th>작성자</th>
							<td colspan="2"><input type="text" class="form-control"
								value="${sessionScope.memberName}" readonly="readonly"> <input
								type="hidden" name="writer" value="${sessionScope.memberName}"></td>
						</tr>

						<tr>
							<th>게시판 제목</th>
							<td colspan="2"><input type="text" class="form-control" name="noticeTitle" id="title" size="110" value=""
								placeholder="제목을 입력해주세요"></td>
						</tr>
						<tr>
							<th>게시판 내용</th>
							<td colspan="2"><textarea  class="form-control" name="noticeContent" id="content" rows="10"
									cols="110" style="" placeholder="내용을 입력해주세요"></textarea></td>
						</tr>


					</table>
					<div style="width: 650px; text-align: right;">
						<button class="btn btn-primary" type="button" id="btnAdd">공지등록</button>
						<button class="btn btn-primary" type="button" id="btnCancel"
							onclick="window.history.back()">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>
<!-- / Main -->


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
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
