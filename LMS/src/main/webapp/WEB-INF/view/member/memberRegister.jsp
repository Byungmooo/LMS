<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/view/include/loginHeader.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>		
		
		<!-- Main -->
		<div class="container-xxl flex-grow-1 container-p-y">	  
			<!-- Row1 구분 -->
			<div class="row text-center">	    
				<div class="card h-100">
					<div class="card-header">
						<div class="card-title mb-0">
							<h5 class="m-0 me-2">회원가입</h5>
							<small class="text-muted"></small>
						</div>
					</div>
					<div class="card-body">
						<form action="${pageContext.request.contextPath}/memberRegister" class="form-horizontal" method="post" id="registerForm">
                            <div class="row" style="margin-bottom: 20px;">
                            	<div class="col-sm-2 col-12 text-center">
                            		중복검사
                            	</div>
                            	<div class="col-sm-8 col-12 text-center">
                            		<input type="text" name="checkId" id="checkId" class="form-control" placeholder="Enter Id">
                            	</div>
                            	<div class="col-sm-2 col-12 text-center">
                            		<button type="button" id="idCheckBtn" class="btn btn-outline-primary" style="float: left;">
		                            <i class="feather icon-user"></i>
		                            	확인
		                            </button>
                            	</div>
                            	
                            </div>
                            <div class="row" style="margin-bottom: 20px;">
                            	<div class="col-sm-2 col-12 text-center">
                            		아이디
                            	</div>
                            	<div class="col-sm-9 col-12 text-center">
                            		<input type="text" name="memberId" id="memberId" class="form-control" placeholder="Check Id" readonly="readonly">
                            	</div>
                            	<div class="col-sm-1 col-12 text-center">
                            	</div>
                            </div>
                            <div class="row" style="margin-bottom: 20px;">
                            	<div class="col-sm-2 col-12 text-center">
                            		비밀번호
                            	</div>
                            	<div class="col-sm-9 col-12 text-center">
                            		<input type="password" name="memberPw" id="memberPw" class="form-control" placeholder="Enter Password">
                            	</div>
                            	<div class="col-sm-1 col-12 text-center">
                            	</div>
                            </div>
                            <div class="row" style="margin-bottom: 20px;">
                            	<div class="col-sm-2 col-12 text-center">
                            		이름
                            	</div>
                            	<div class="col-sm-9 col-12 text-center">
                            		<input type="text" name="memberName" id="memberName" class="form-control" placeholder="Enter Name">
                            	</div>
                            	<div class="col-sm-1 col-12 text-center">
                            	</div>
                            </div>
                            <div class="row" style="margin-bottom: 20px;">
                            	<div class="col-sm-2 col-12 text-center">
                            		성별
                            	</div>
                            	<div class="col-sm-3 col-12 text-center">
                            		<select class="form-select" aria-label="Default select example" name="memberGender" id="memberGender">
                            			<option value="" selected="selected">선택</option>
                            			<option value="남">남</option>
                            			<option value="여">여</option>
                            		</select>
                            	</div>
                            	<div class="col-sm-2 col-12 text-center">
                            		유형
                            	</div>
                            	<div class="col-sm-3 col-12 text-center">
                            		<select class="form-select" aria-label="Default select example" name="memberType" id="memberType">
                            			<option value="" selected="selected">선택</option>
                            			<option value="학생">학생</option>
                            			<option value="교수">교수</option>
                            			<option value="직원">직원</option>
                            		</select>
                            	</div>
                            	<div class="col-sm-2 col-12 text-center">
                            	</div>
                            </div>
                            <div class="row" style="margin-bottom: 20px;">
                            	<div class="col-sm-2 col-12 text-center">
                            		생년월일
                            	</div>
                            	<div class="col-sm-3 col-12 text-center">
                            		<select class="form-select" aria-label="Default select example" name="birthYear" id="birthYear">
                            			<option value="" selected="selected">년</option>
										<c:forEach var="i" begin="1920" end="2022">
											<option value="${i}">${i}</option>
										</c:forEach>
                            		</select>
                            	</div>
                            	<div class="col-sm-3 col-12 text-center">
                            		<select class="form-select" aria-label="Default select example" name="birthMonth" id="birthMonth">
                            			<option value="" selected="selected">월</option>
										<c:forEach var="i" begin="1" end="12">
											<c:choose>
											    <c:when test="${i lt 10 }">
											        <option value="0${i}">0${i}</option>
											    </c:when>
											    <c:otherwise>
											        <option value="${i}">${i}</option>
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
											        <option value="0${i}">0${i}</option>
											    </c:when>
											    <c:otherwise>
											        <option value="${i}">${i}</option>
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
                            	<div class="col-sm-9 col-12 text-center">
                            		<input type="text" name="memberEmail" id="memberEmail" class="form-control" placeholder="Enter Email">
                            	</div>
                            	<div class="col-sm-1 col-12 text-center">
                            	</div>
                            </div>
                            <div class="row" style="margin-bottom: 20px;">
                            	<div class="col-sm-2 col-12 text-center">
                            		주소
                            	</div>
                            	<div class="col-sm-3 col-12 text-center">
                            		<input type="text" name="memberAddr" id="memberAddr" class="form-control" placeholder="Search Address" readonly="readonly">
                            	</div>
                            	<div class="col-sm-1 col-12 text-center">
                            		<button type="button" id="addrBtn" class="btn btn-outline-primary" style="float: left;"
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
                            	<div class="col-sm-9 col-12 text-center">
                            		<input type="text" name="memberContact" id="memberContact" class="form-control" placeholder="Enter Contact">
                            	</div>
                            	<div class="col-sm-1 col-12 text-center">
                            	</div>
                            </div>
                            <button type="button" id="memberBtn" class="btn btn-outline-primary btn-block">
                            <i class="feather icon-user"></i>
                            	가입
                            </button>
						</form>                        	
					</div>
				</div>
			</div>
			<!-- /Row1 구분 -->
		</div>
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
	$('#idCheckBtn').click(function() {
		if($('#checkId').val().length < 4 || $('#checkId').val().length > 13) {
			alert('ID는 4자이상 13자 이하입니다.');
		} else {
			$.ajax({
				url : 'memberIdCheck',
				type : 'post',
				data : {checkId : $('#checkId').val()},
				success : function(json) {
					if(json == 'y') {
						alert('사용가능한 아이디 입니다.');
						$('#memberId').val($('#checkId').val());
					} else {
						alert('이미 사용중인 아이디 입니다.');
						$('#memberId').val('');
					}
				}
			});
		}
	});

	$('#memberBtn').click(function() {
		if($('#memberId').val() == '') {
			alert('중복검사를 진행해주세요');
			$("#checkId").focus();
		} else if($('#memberPw').val() == '') {
			alert('비밀번호를 입력하세요');
			$("#memberPw").focus();
		} else if($('#memberName').val() == '') {
			alert('이름을 입력하세요');
			$("#memberName").focus();
		} else if($('#memberGender').val() == '') {
			alert('성별을 선택하세요');
		} else if($('#memberType').val() == '') {
			alert('유형을 선택하세요');
		} else if($('#birthYear').val() == '') {
			alert('생년월일을 선택하세요');
		} else if($('#birthMonth').val() == '') {
			alert('생년월일을 선택하세요');
		} else if($('#birthDay').val() == '') {
			alert('생년월일을 선택하세요');
		} else if($('#memberEmail').val() == '') {
			alert('이메일주소를 입력하세요');
			$("#memberEmail").focus();
		} else if($('#memberAddr').val() == '') {
			alert('고객주소를 검색하세요');
		} else if($('#memberAddrDetail').val() == '') {
			alert('상세주소를 입력하세요');
			$("#memberAddrDetail").focus();
		} else if($('#memberContact').val() == '') {
			alert('연락처를 입력하세요');
			$("#memberContact").focus();
		} else {
			registerForm.submit();
		}
	});
</script>
<%@ include file="/WEB-INF/view/include/loginFooter.jsp"%>