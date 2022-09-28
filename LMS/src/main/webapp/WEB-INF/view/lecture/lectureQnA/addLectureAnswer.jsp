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
	
		
		
		<hr class="my-5" />
		
		<!-- addTotalNotice -->
		<div class="row text-center">
			<div class="card">
				<h5 class="card-header"><strong>답변등록</strong></h5>
				<hr class="my-0" />
				
				<div class="card-body">
		                <form name="form" action="${pageContext.request.contextPath}/professor/addLectureAnswer" method="post">
           
<%--                    <input type="hidden" name="memberId" value="${session.id}">--%>

                    <div>
                        내용
                        <textarea name="answerContent" id="content" rows="4" cols="80"
                                  placeholder="내용을 입력해주세요"></textarea>
                    </div>
                 <div style="width:650px; text-align: center;">
                        <button class="btn btn-info" type="button" id="btnAdd">답변등록</button>
                        <button class="btn btn-info" type="button" id="btnCancel" onclick="window.history.back()">취소</button>
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
          let content = $("#content").val();
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
