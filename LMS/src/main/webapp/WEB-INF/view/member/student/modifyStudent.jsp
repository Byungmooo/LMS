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
                    <h5 class="m-0 me-2">학생정보 수정</h5>
                </div>
              </div>
              <div class="card-body">
                <form name="form" class="form-horizontal" method="post" 
               	 	action="${pageContext.request.contextPath}/employee/modifyStudent">
                	<div class="row" style="margin-bottom: 20px;">
                      	<div class="col-sm-2 col-12 text-center">
                      		아이디
                      	</div>
                       	<div class="col-sm-3 col-12 text-center">
                  		<input type="text" name="memberId" class="form-control"
			 				value="${s.memberId}" readonly>  
			 			</div>
               	  </div>
                  <div class="row" style="margin-bottom: 20px;">
                       	<div class="col-sm-2 col-12 text-center">
                       		학생코드
                       	</div>
                        <div class="col-sm-3 col-12 text-center">
	                    	<input type="text" name="studentCode" class="form-control"
					 			value="${s.studentCode}" readonly>  
					 	</div>
                   </div>
                   <div class="row" style="margin-bottom: 20px;">
                       	<div class="col-sm-2 col-12 text-center">
                       		학부코드
                       	</div>
                       	<div class="col-sm-3 col-12 text-center">
	                    <input type="text" name="departmentCode" class="form-control"
					 		value="${s.departmentCode}"> 
					 	</div> 
                   </div>
                   <div class="row" style="margin-bottom: 20px;">
                       	<div class="col-sm-2 col-12 text-center">
                       		학년
                       	</div>
                       	<div class="col-sm-3 col-12 text-center">
	                    	<select class="form-select" aria-label="Default select example" name="studentYear" id="studentYear">
                       			<option value="1" 
                       				<c:if test="${s.studentYear eq '1'}">selected="selected"</c:if>>1학년</option>
                       			<option value="2"
                       				<c:if test="${s.studentYear eq '2'}">selected="selected"</c:if>>2학년</option>
                       			<option value="3"
                       				<c:if test="${s.studentYear eq '3'}">selected="selected"</c:if>>3학년</option>
                       		</select>
			 			</div> 
                   </div>
                    <div class="row" style="margin-bottom: 20px;">
	                          	<div class="col-sm-2 col-12 text-center">
	                          		재학상태
	                          	</div>
		                   <div class="col-sm-3 col-12 text-center">
					           <select class="form-select" aria-label="Default select example" name="studentState" id="studentState">
		                  			<option value="재학중" 
		                  				<c:if test="${s.studentState eq '재학중'}">selected="selected"</c:if>>재학중</option>
		                  			<option value="휴학중"
		                  				<c:if test="${s.studentState eq '휴학중'}">selected="selected"</c:if>>휴학중</option>
		                  			<option value="자퇴"
		                  				<c:if test="${s.studentState eq '자퇴'}">selected="selected"</c:if>>자퇴</option>
		                  			<option value="졸업"
		                  				<c:if test="${s.studentState eq '졸업'}">selected="selected"</c:if>>졸업</option>
		                  		</select>
		                   </div>
		               </div>
                   <div class="row" style="margin-bottom: 20px;">
                       	<div class="col-sm-2 col-12 text-center">
                       		이름
                       	</div>
                       	<div class="col-sm-3 col-12 text-center">
	                    <input type="text" name="memberName" class="form-control"
					 		value="${s.memberName}" >  
					 	</div>
                   </div>
                   <div class="row" style="margin-bottom: 20px;">
                       	<div class="col-sm-2 col-12 text-center">
                       		성별
                       	</div>
                       	<div class="col-sm-3 col-12 text-center">
	                    <input type="text" name="memberGender" class="form-control"
					 		value="${s.memberGender}" readonly> 
					 	</div> 
                   </div>
                   <div class="row" style="margin-bottom: 20px;">
                       	<div class="col-sm-2 col-12 text-center">
                       		유형
                       	</div>
                       	<div class="col-sm-3 col-12 text-center">
	                    <input type="text" name="memberType" class="form-control"
					 		value="${s.memberType}"  readonly>  
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
											<c:if test="${(fn:substring(s.memberBirth,0,4)) eq i}">selected="selected"</c:if>>${i}</option>
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
										        <c:if test="${(fn:substring(s.memberBirth,5,7)) eq i}">selected="selected"</c:if>>0${i}</option>
										    </c:when>
										    <c:otherwise>
										        <option value="${i}"
										        <c:if test="${(fn:substring(s.memberBirth,5,7)) eq i}">selected="selected"</c:if>>${i}</option>
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
									       		<c:if test="${(fn:substring(s.memberBirth,8,10)) eq i}">selected="selected"</c:if>>0${i}</option>
									    </c:when>
									    <c:otherwise>
									        <option value="${i}"
												<c:if test="${(fn:substring(s.memberBirth,8,10)) eq i}">selected="selected"</c:if>>${i}</option>
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
						 				value="${s.memberEmail}" >  
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
					 		value="${s.memberContact}" >  
					 	</div>
                   </div>
                   <div class="row" style="margin-bottom: 20px;">
                    	<div class="col-sm-2 col-12 text-center">
                    		권한여부
                    	</div>
                    	<div class="col-sm-3 col-12 text-center">
                    		 <select class="form-select" aria-label="Default select example" name="active" id="active">
                    			<option value="Y" 
                    				<c:if test="${s.active eq 'Y'}">selected="selected"</c:if>>Y</option>
                    			<option value="N"
                    				<c:if test="${s.active eq 'N'}">selected="selected"</c:if>>N</option>
                    		</select>
                    	</div>
                    </div>
                    

                   <div style="text-align: center;">      
                   	     <!-- 학번을 hidden으로 처리 -->
                   		<input type="hidden" name="studentCode" value="${s.studentCode}">
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

<!-- /Main -->
	<!-- 주소 API -->		
		<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" 
				style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
		</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var element_layer = document.getElementById('layer'); 
	
	function closeDaumPostcode() {
	    element_layer.style.display = 'none';
	}
	
	function sample2_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            if(data.userSelectedType === 'R'){
	
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	
	            
	            } 
	            document.getElementById('memberAddr').value = data.zonecode + ' ' + addr;
	            element_layer.style.display = 'none';
	        },
	        width : '100%',
	        height : '100%',
	        maxSuggestItems : 5
	    }).embed(element_layer);
	
	    element_layer.style.display = 'block';
	
	    initLayerPosition();
	}
	
	function initLayerPosition(){
	    var width = 300; //우편번호서비스가 들어갈 element의 width
	    var height = 400; //우편번호서비스가 들어갈 element의 height
	    var borderWidth = 5; //샘플에서 사용하는 border의 두께
	
	    // 위에서 선언한 값들을 실제 element에 넣는다.
	    element_layer.style.width = width + 'px';
	    element_layer.style.height = height + 'px';
	    element_layer.style.border = borderWidth + 'px solid';
	    // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	    element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
	    element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
	}
</script>
<script> 
function updateBtn(){
	alert("수정하시겠습니까?");
    document.form.submit();
}
</script>


<%@ include file="/WEB-INF/view/include/footer.jsp" %>