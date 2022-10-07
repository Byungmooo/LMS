<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Header -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
                    <h5 class="m-0 me-2">학부 수정</h5>
					<hr class="my-5" />
					<!-- Main Contents -->
				</div>
			</div>
			 <div class="card-body">
		        <form name="form" action="${pageContext.request.contextPath}/emplyoee/modifyDepartment" method="post">
					<div class="card bady">
						<div class="asset-inner">
							<table class="table">
								<tr>
									<th>학과코드</th>
									<td><input type="text" name="departmentCode" class="form-control"
										value="${department.departmentCode}" readonly>
									</td>
								</tr>
								<tr>
									<th>내용</th>
									<td><input type="text" name="departmentName" class="form-control"
										value="${department.departmentName}">
									</td>
								</tr>
							</table>	
						</div>
					</div>
					<button type="button" id="btnUpdate" name="btnUpdate" class="btn btn-primary">수정</button>
					<a href="javascript:history.back();" type= "button" class="btn btn-primary">취소</a>
				</form>	
			</div>
		</div>	
	</div>
</div>
<script>
    $(document).ready(function () {
		 $("#btnUpdate").click(function () {
            if (confirm("수정하시겠습니까?")) {
                document.form.action = "${pageContext.request.contextPath}/employee/modifyDepartment";
                document.form.method = "post";
                document.form.submit();
            }
        });
    });
</script>	
	
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
