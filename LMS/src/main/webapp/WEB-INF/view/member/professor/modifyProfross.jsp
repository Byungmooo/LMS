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
                    <h5 class="m-0 me-2">교수정보 수정</h5>
                </div>
              </div>
              <div class="card-body">
                <form name="form" action="${pageContext.request.contextPath}/emplpoyee/modifyProfessor" method="get">
                   <div class="form-group">
	                    <label for="memberId">아이디:</label>
	                    <input type="text" name="memberId" class="form-control"
					 		value="${p.memberId}" readonly>  
                   </div>
                   <div class="form-group">
	                    <label for="professorCode">교수코드:</label>
	                    <input type="text" name="professorCode" class="form-control"
					 		value="${p.professorCode}" readonly>  
                   </div>
                   <div class="form-group">
	                    <label for="departmentCode">학부코드:</label>
	                    <input type="text" name="departmentCode" class="form-control"
					 		value="${p.departmentCode}" readonly>  
                   </div>
                   <div class="form-group">
	                    <label for="departmentLeader">학과장여부</label>
	                    <input type="text" name="departmentLeader" class="form-control"
					 		value="${p.departmentLeader}" >  
                   </div>
                   <div class="form-group">
	                    <label for="professorState">재직상태:</label>
	                    <input type="text" name="professorState" class="form-control"
					 		value="${p.professorState}" >  
                   </div>
                   <div class="form-group">
	                    <label for="memberName">이름:</label>
	                    <input type="text" name="memberName" class="form-control"
					 		value="${p.memberName}" >  
                   </div>
                   <div class="form-group">
	                    <label for="memberGender">성별:</label>
	                    <input type="text" name="memberGender" class="form-control"
					 		value="${p.memberGender}" >  
                   </div>
                   <div class="form-group">
	                    <label for="memberType">구분:</label>
	                    <input type="text" name="memberType" class="form-control"
					 		value="${p.memberType}"  readonly>  
                   </div>
                   <div class="form-group">
	                    <label for="memberBirth">생일:</label>
	                    <input type="text" name="memberBirth" class="form-control"
					 		value="${p.memberBirth}" >  
                   </div>
                   <div class="form-group">
	                    <label for="memberEmail">이메일:</label>
	                    <input type="text" name="memberEmail" class="form-control"
					 		value="${p.memberEmail}" >  
                   </div>
                   <div class="form-group">
	                    <label for="memberAddress">주소:</label>
	                    <input type="text" name="memberAddress" class="form-control"
					 		value="${p.memberAddress}" >  
                   </div>
                   <div class="form-group">
	                    <label for="memberContact">연락처:</label>
	                    <input type="text" name="memberContact" class="form-control"
					 		value="${p.memberContact}" >  
                   </div>
                   <div class="form-group">
	                    <label for="active">권한:</label>
	                    <input type="text" name="active" class="form-control"
					 		value="${p.active}" readonly >  
                   </div>
                    

                   <div style="text-align: center;">      
                   	     <!-- 코드를 hidden으로 처리 -->
                   		<input type="hidden" name="professorCode" value="${p.professorCode}">
                   		<button class="btn btn-primary" type="button" id="btnUpdate" onclick="updateBtn()">수정</button>
						<button class="btn btn-warning" type="button" onclick="window.history.back()">취소</button> 
						
                   </div>
                </form>
            </div>
        </div>
    </div>
    <!-- /Row1 구분 -->
</div>
<!-- /Main -->
<%@ include file="/WEB-INF/view/include/footer.jsp" %>
<script> 
function updateBtn(){
	alert("수정하시겠습니까?");
    document.form.submit();
}
</script>