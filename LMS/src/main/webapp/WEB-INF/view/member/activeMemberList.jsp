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
    <h4 class="fw-bold py-3 mb-4">
        <span class="text-muted fw-light">"${sessionScope.memberName}님 "/</span> 학생게시판
    </h4>
    <hr class="my-1"/>
    <!-- RowPerPage Option -->
    <div class="row">
        <div class="col-sm-9 col-12 text-center"></div>
        <div class="col-sm-3 col-12 text-center">
            <select class="form-select" name="sel" id="rowPerPage">
                <option value="5"
                        <c:if test="${paging.rowPerPage == 5}">selected</c:if>>5줄 보기
                </option>
                <option value="10"
                        <c:if test="${paging.rowPerPage == 10}">selected</c:if>>10줄 보기
                </option>
                <option value="15"
                        <c:if test="${paging.rowPerPage == 15}">selected</c:if>>15줄 보기
                </option>
                <option value="20"
                        <c:if test="${paging.rowPerPage == 20}">selected</c:if>>20줄 보기
                </option>
            </select>
        </div>
    </div>
    <br> 
    <div class="card">
        <h5 class="card-header">회원 가입 승인 리스트</h5>
        	<div class="table-responsive text-nowrap">
        		 <div id="toolbar">
                     <select style="font-size:15px;" name="select" id="viewProduct" onchange="window.open(value,'_self');">
						<c:if test="${memberType eq '직원'}">
							<option value="${pageContext.request.contextPath}/employee/activeMemberList?memberType=all"
								selected>전체 리스트</option>
						</c:if>
					</select>
					<input type="hidden" name="memberId" id="memberId" value="${memberId}">
                  </div>
                  <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
                           data-cookie-id-table="saveId"  data-click-to-select="true" data-toolbar="#toolbar">
                    <thead>
                        <tr>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>성별</th>
                            <th>생년월일</th>
                            <th>이메일</th>
                            <th>주소</th>
                            <th>연락처</th>
                            <th>가입날짜</th>
                            <th>가입 승인 / 가입 거부</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${memberType eq '직원'}">
                    	<c:forEach var="s" items="${studentList}">
	                        <tr>
								<td>${s.memberId}</td>
								<td>${s.memberName}</td>
								<td>${s.memberGender}</td>
								<td>${s.memberBirth}</td>
								<td>${s.memberEmail}</td>
								<td>${s.memberAddress}</td>
								<td>${s.memberContact}</td>
								<td>${s.createDate}</td>
								<td>
									<button type="button" class="btn btn-primary"  onclick="location.href='${pageContext.request.contextPath}/employee/modifyActiveMemberList?accountId=${s.memberId}'">승인</button>
	                                <button type="button" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/employee/modifyInActiveMemberList?memberId=${s.memberId}'">거절</button>
	                            </td>
	                        </tr>
                     	</c:forEach>
                      	<c:forEach var="p" items="${professorList}">
							<tr>
								<td>${p.memberId}</td>
								<td>${p.memberName}</td>
								<td>${p.memberGender}</td>
								<td>${p.memberBirth}</td>
								<td>${p.memberEmail}</td>
								<td>${p.memberAddress}</td>
								<td>${p.memberContact}</td>
								<td>${p.createDate}</td>
								<td>
									<button type="button" class="btn btn-primary"  onclick="location.href='${pageContext.request.contextPath}/employee/modifyActiveMemberList?memberId=${p.memberId}'">승인</button>
                                    <button type="button" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/loginCheck/modifyInActiveMemberList?memberId=${p.memberId}'">거절</button>
                                </td>
							</tr>
						</c:forEach>
						<c:forEach var="e" items="${employeeList}">
							<tr>
								<td>${e.memberId}</td>
								<td>${e.memberName}</td>
								<td>${e.memberGender}</td>
								<td>${e.memberBirth}</td>
								<td>${e.memberEmail}</td>
								<td>${e.memberAddress}</td>
								<td>${e.memberContact}</td>
								<td>${e.createDate}</td>
								<td>
									<button type="button" class="btn btn-primary"  onclick="location.href='${pageContext.request.contextPath}/employee/modifyActiveMemberList?memberId=${e.memberId}'">승인</button>
                                    <button type="button" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/employee/modifyInActiveMemberList?memberId=${e.memberId}'">거절</button>
                                </td>
							</tr>
						</c:forEach>
                    </c:if>
                 </tbody>
              </table>
           </div>
        </div>
	</div>
