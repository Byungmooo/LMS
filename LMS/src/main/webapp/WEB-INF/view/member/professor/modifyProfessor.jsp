<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
                <form name="form" class="form-horizontal" method="post"
                	<c:if test="${memberType eq '직원'}">action="${pageContext.request.contextPath}/emplpoyee/modifyProfessor"</c:if>
                	<c:if test="${memberType eq '교수'}">action="${pageContext.request.contextPath}/professor/modifyProfessor"</c:if>>
                   <div class="row" style="margin-bottom: 20px;">
                      	<div class="col-sm-2 col-12 text-center">
                      		아이디
                      	</div>
                       	<div class="col-sm-3 col-12 text-center">
                  		<input type="text" name="memberId" class="form-control"
			 				value="${p.memberId}" readonly>  
			 			</div>
               	   </div>
                   <div class="row" style="margin-bottom: 20px;">
                       	<div class="col-sm-2 col-12 text-center">
                       		교수코드
                       	</div>
                        <div class="col-sm-3 col-12 text-center">
	                    	<input type="text" name="professorCode" class="form-control"
					 			value="${p.professorCode}" readonly>  
					 	</div>
                   </div>
                   <div class="row" style="margin-bottom: 20px;">
                       	<div class="col-sm-2 col-12 text-center">
                       		학부코드
                       	</div>
                       	<div class="col-sm-3 col-12 text-center">
	                    <input type="text" name="departmentCode" class="form-control"
					 		value="${p.departmentCode}" readonly> 
					 	</div> 
                   </div>
                   <div class="row" style="margin-bottom: 20px;">
                       	<div class="col-sm-2 col-12 text-center">
                       		학과장여부
                       	</div>
                       	<div class="col-sm-3 col-12 text-center">
	                    	<select class="form-select" aria-label="Default select example" name="departmentLeader" id="departmentLeader">
                       			<option value="Y" 
                       				<c:if test="${p.departmentLeader eq 'Y'}">selected="selected"</c:if>>학과장</option>
                       			<option value="2"
                       				<c:if test="${p.departmentLeader eq 'N'}">selected="selected"</c:if>>일반교수</option>
                       		</select>
			 			</div> 
                   </div>
                   <div class="row" style="margin-bottom: 20px;">
                          	<div class="col-sm-2 col-12 text-center">
                          		재직상태
                          	</div>
                          	<div class="col-sm-3 col-12 text-center">
	                    	<select class="form-select" aria-label="Default select example" name="professorState" id="professorState">
                       			<option value="재직중" 
                       				<c:if test="${p.professorState eq '재직중'}">selected="selected"</c:if>>재직중</option>
                       			<option value="휴직중"
                       				<c:if test="${p.professorState eq '휴직중'}">selected="selected"</c:if>>휴직중</option>
                       			<option value="퇴직자"
                       				<c:if test="${p.professorState eq '퇴직자'}">selected="selected"</c:if>>퇴직자</option>
                       		</select>
					 	</div> 
                   </div>
                   <div class="row" style="margin-bottom: 20px;">
                       	<div class="col-sm-2 col-12 text-center">
                       		이름
                       	</div>
                       	<div class="col-sm-3 col-12 text-center">
	                    <input type="text" name="memberName" class="form-control"
					 		value="${p.memberName}" >  
					 	</div>
                   </div>
                   <div class="row" style="margin-bottom: 20px;">
                     	<div class="col-sm-2 col-12 text-center">
                     		성별
                     	</div>
                     	<div class="col-sm-3 col-12 text-center">
                     		<input type="text" name="memberGender" class="form-control"
 						value="${p.memberGender}" readonly>  
                    	</div>
                   </div>
                   <div class="row" style="margin-bottom: 20px;">
	                   <div class="col-sm-2 col-12 text-center">
	                   		유형
	                   </div>
                       <div class="col-sm-3 col-12 text-center">
                       		<input type="text" name="memberType" class="form-control"
		 					value="${p.memberType}" readonly>  
                       </div>
                   </div>
                  <div class="row" style="margin-bottom: 20px;">
                            	<div class="col-sm-2 col-12 text-center">
                            		생년월일
                            	</div>
                            	<div class="col-sm-3 col-12 text-center">
                            		<select class="form-select" aria-label="Default select example" name="birthYear" id="birthYear">
                            			<option value="">년</option>
										<c:forEach var="i" begin="1920" end="2022">
											<option value="${i}"
												<c:if test="${(fn:substring(p.memberBirth,0,4)) eq i}">selected="selected"</c:if>>${i}</option>
										</c:forEach>
                            		</select>
                            	</div>
                            	<div class="col-sm-3 col-12 text-center">
                            		<select class="form-select" aria-label="Default select example" name="birthMonth" id="birthMonth">
                            			<option value="" selected="selected">월</option>
										<c:forEach var="i" begin="1" end="12">
											<c:choose>
											    <c:when test="${i lt 10 }">
											        <option value="0${i}"
											        <c:if test="${(fn:substring(p.memberBirth,5,7)) eq i}">selected="selected"</c:if>>0${i}</option>
											    </c:when>
											    <c:otherwise>
											        <option value="${i}"
											        <c:if test="${(fn:substring(p.memberBirth,5,7)) eq i}">selected="selected"</c:if>>${i}</option>
											    </c:otherwise>
											</c:choose>
										</c:forEach>
                            		</select>
                            	</div>
                            	<div class="col-sm-3 col-12 text-center">
                            		<select class="form-select" aria-label="Default select example" name="birthDay" id="birthDay">
                            			<option value="" selected="selected">일</option>
										<c:forEach var="i" begin="1" end="31">
											<c:choose>
											    <c:when test="${i lt 10 }">
											        <option value="0${i}"
											       		<c:if test="${(fn:substring(p.memberBirth,8,10)) eq i}">selected="selected"</c:if>>0${i}</option>
											    </c:when>
											    <c:otherwise>
											        <option value="${i}"
														<c:if test="${(fn:substring(p.memberBirth,8,10)) eq i}">selected="selected"</c:if>>${i}</option>
											    </c:otherwise>
											</c:choose>
										</c:forEach>
                            		</select>
                            	</div>
                            	<div class="col-sm-1 col-12 text-center">
                            	</div>
                            </div>
                   	<div class="row" style="margin-bottom: 20px;">
                        	<div class="col-sm-2 col-12 text-center">
                        		이메일
                        	</div>
                           	<div class="col-sm-3 col-12 text-center">
		                   		 <input type="text" name="memberEmail" class="form-control"
						 				value="${p.memberEmail}" >  
						 	</div>
		           </div>
		                   <!--  주소 가지고 있는 값으로 가져와야함  -->
		                   <div class="row" style="margin-bottom: 20px;">
                            	<div class="col-sm-2 col-12 text-center">
                            		주소
                            	</div>
                            	<div class="col-sm-3 col-12 text-center">
                            		<input type="text" name="memberAddr" id="memberAddr" class="form-control" placeholder="Search Address" readonly="readonly">
                            	</div>
                            	<div class="col-sm-1 col-12 text-center">
                            		<button type="button" id="addrBtn" class="btn btn-primary"
                            			 onclick="sample2_execDaumPostcode()">
		                            <i class="feather icon-user"></i>
		                            	검색
		                            </button>
                            	</div>
                            	<div class="col-sm-1 col-12 text-center">
                            		주소상세
                            	</div>
                            	<div class="col-sm-4 col-12 text-center">
                            		<input type="text" name="memberAddrDetail" id="memberAddrDetail" class="form-control" placeholder="Enter Detail Address">
                            	</div>
                            	<div class="col-sm-1 col-12 text-center">
                            	</div>
                           </div>
		                   <div class="row" style="margin-bottom: 20px;">
                            	<div class="col-sm-2 col-12 text-center">
                            		연락처
                            	</div>
                            	<div class="col-sm-3 col-12 text-center">
			                    	<input type="text" name="memberContact" class="form-control"
							 			value="${p.memberContact}" > 
                            	</div>
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