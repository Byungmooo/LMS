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
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
	
		<hr class="my-5" />
		
		<!-- addStudent-->
		<div class="row text-center">
			<div class="card">
				<h5 class="card-header"><strong>학생 추가</strong>/strong></h5>
				<hr class="my-0" />
					<div class="card-body">
				        <form name="form" action="${pageContext.request.contextPath}/student/addStudent" method="post">
							<div class="form-group">		
								<label for="memberId">아이디?</label>
								<input type="text" value="${memberId}" class="form-control">
							</div>
		                    <div class="form-group">		
								<label for="studentCode">학번</label>
								<input type="text" name="studentCode" class="form-control">
							</div>
							<select name="departmentCode"> <!-- select + option 은 세트 / 그안에 돌릴것만 넣으면 됨-->
								<c:forEach var="d" items="${list}">
									<option value="${d.departmentCode}">${d.departmentName}</option>	
								</c:forEach>
							</select>	
		                    <select name="studentYear" id="studentYear"> <!-- select + option 은 세트 / 그안에 돌릴것만 넣으면 됨-->
								<option value="1학년 1학기"></option>	
								<option value="1학년 2학기"></option>	
								<option value="2학년 1학기"></option>	
								<option value="2학년 2학기"></option>
								<option value="3학년 1학기"></option>	
								<option value="3학년 2학기"></option>		
							</select>	
		                    <div class="form-group">		
								<label for="studentState" class="form-group">학생상태</label>
								<input type="radio" name="studentState" class="input-radio"
								name="studentState" id="studentState">
							</div>
						</form>
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
