<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<h4 class="fw-bold py-3 mb-4 text-center">
			<span class="text-muted fw-light">${memberName}님 / <strong>미승인 대기 리스트</strong></span>
		</h4>
		<hr class="my-5" />
		
		<div class="card text-center">
			<h5 class="card-header">미승인 대기 목록</h5>
			
			<!-- 검색바 -->
			<div class="row text-center">
				<div class="col-sm-9 col-12 text-center"></div>
				<div class="col-sm-1 col-12 text-center">타입별</div>
				<div class="col-sm-2 col-12 text-center">
					<select name="searchType" id="searchType" class="form-select">
						<option value="" 
							<c:if test="${searchType eq ''}">selected="selected"</c:if>>전체</option>
						<option value="학생"
							<c:if test="${searchType eq '학생'}">selected="selected"</c:if>>학생</option>
						<option value="교수"
							<c:if test="${searchType eq '교수'}">selected="selected"</c:if>>교수</option>
						<option value="직원"
							<c:if test="${searchType eq '직원'}">selected="selected"</c:if>>직원</option>
					</select>
				</div>
			</div>	
			<!-- 전체강의 리스트 -->
			<div class="table-responsive text-nowrap">
				<table class="table">
                    <thead>
                        <tr>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>성별</th>
                            <th>생년월일</th>
                            <th>계정타입</th>
                            <th>학부</th>
                            <th>승인/거부</th>
                        </tr>
                    </thead>
                    <tbody>
                   	<c:forEach var="s" items="${memberList}">
                        <tr>
	                       	<td>${s.memberId}</td>
							<td>${s.memberName}</td>
							<td>${s.memberGender}</td>
							<td>${s.memberBirth}</td>
							<td>${s.memberType}</td>
							<c:if test="${s.memberType eq '직원'}">
								<td>LMS관리부서</td>
							</c:if>
							<c:if test="${(s.memberType eq '교수')||(s.memberType eq '학생')}">
								<td>${s.tempDep}</td>
							</c:if>
							<td>
								<a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/employee/modifyActiveMember?memberId=${s.memberId}&memberType=${s.memberType}&tempDep=${s.tempDep}">승인</a>
								<a class="btn btn-sm btn-danger"  href="${pageContext.request.contextPath}/employee/modifyInActiveMemberList?memberId=${s.memberId}">거절</a>
                            </td>
                        </tr>
                   	</c:forEach>
                 </tbody>
              </table>
           </div>
         </div>
	</div>
<script>
// searchType 갱신
$("#searchType").on("change", (e) => {
    location.href = createUrl('', '', e.target.value);
})

const createUrl = (searchType) => {
    const path = "${pageContext.request.contextPath}";
    const param = {
        searchType: $('#searchType').val()
    }

   if(searchType != '') param.searchType = searchType;

    var url = path +'/employee/activeMemberList';
    url += '?searchType='+ param.searchType ;

    return url;
}
</script>
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>	
