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
                    <h5 class="m-0 me-2">학생정보 수정</h5>
                </div>
              </div>
              <div class="card-body">
                <form name="form" action="${pageContext.request.contextPath}/member/student/modifyStudent?studentCode=${s.studentCode}" method="post">
                   <div class="form-group">
	                    <label for="memberId">아이디:</label>
	                    <input type="text" name="memberId" class="form-control"
					 		value="${s.memberId}" readonly>  
                   </div>
                   <div class="form-group">
	                    <label for="studentCode">학번:</label>
	                    <input type="text" name="studentCode" class="form-control"
					 		value="${s.studentCode}" readonly>  
                   </div>
                   <div class="form-group">
	                    <label for="departmentCode">학부코드:</label>
	                    <input type="text" name="departmentCode" class="form-control"
					 		value="${s.departmentCode}" readonly>  
                   </div>
                   <div class="form-group">
	                    <label for="studentYear">학년:</label>
	                    <input type="text" name="studentYear" class="form-control"
					 		value="${s.studentYear}" >  
                   </div>
                   <div class="form-group">
	                    <label for="studentState">상태(재학,자퇴,졸업):</label>
	                    <input type="text" name="studentState" class="form-control"
					 		value="${s.studentState}" >  
                   </div>
                   <div class="form-group">
	                    <label for="memberName">이름:</label>
	                    <input type="text" name="memberName" class="form-control"
					 		value="${s.memberName}" >  
                   </div>
                   <div class="form-group">
	                    <label for="memberGender">성별:</label>
	                    <input type="text" name="memberGender" class="form-control"
					 		value="${s.memberGender}" >  
                   </div>
                   <div class="form-group">
	                    <label for="memberBirth">생일:</label>
	                    <input type="text" name="memberBirth" class="form-control"
					 		value="${s.memberBirth}" >  
                   </div>
                   <div class="form-group">
	                    <label for="memberEmail">이메일:</label>
	                    <input type="text" name="memberEmail" class="form-control"
					 		value="${s.memberEmail}" >  
                   </div>
                   <div class="form-group">
	                    <label for="memberAddress">주소:</label>
	                    <input type="text" name="memberAddress" class="form-control"
					 		value="${s.memberAddress}" >  
                   </div>
                   <div class="form-group">
	                    <label for="memberContact">연락처:</label>
	                    <input type="text" name="memberContact" class="form-control"
					 		value="${s.memberContact}" >  
                   </div>
                   <div class="form-group">
	                    <label for="active">권한:</label>
	                    <input type="text" name="active" class="form-control"
					 		value="${s.active}" >  
                   </div>
                    

                   <div style="text-align: center;">      
                   	     <!-- 아이디를 hidden으로 처리 -->
                   		<input type="hidden" name="memberId" value="${s.memberId}">
                   		<button type="submit" class="btn btn-primary" id="btnUpdate">수정</button>
                        <button class="btn btn-danger" type="button" id="btnDelete">삭제</button>
                        <button class="btn btn-warning" type="button" id="btnCancel" onclick="window.history.back()">취소</button> 
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
        $("#btnDelete").click(function () {
        	if($('#memberId').val() != '#memberId') {
    			alert('정말 삭제하시겠습니까?');
            }
        });
    
    }); 
</script>