<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Header -->
<c:import url="/WEB-INF/view/include/loginHeader.jsp"></c:import>
	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">	  
		<div class="row text-center">	    
			<div class="card h-100">
				<div class="card-header">
					<div class="card-title mb-0">
						<h5 class="m-0 me-2">휴면회원 잠금 해제</h5>
						<small class="text-muted"></small>
					</div>
				</div>
				<div class="card-body">
					<form action="${pageContext.request.contextPath}/memberActive" method="post">
						<table class="table table-secondary">
							<tr>
								<th>아이디</th>
								<td><input type="text" name="memberId" placeholder="아이디 입력" class="form-control"></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="memberPw" placeholder="비밀번호 입력" class="form-control"></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="memberName" placeholder="이름 입력 (2자 이상)" class="form-control"></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="text" name="memberBirth" placeholder="예) 20220920" class="form-control"></td>
							</tr>
							<tr>
								<th>성별</th>
								<td>
									<select name="memberGender" class="form-select">
										<option value="">선택</option>
										<option value="남">남</option>
										<option value="여">여</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="text" name="memberEmail" placeholder="이메일 입력" class="form-control"></td>
							</tr>
							<tr>
								<td colspan="2">인증번호발송 이메일 받는 API?</td>
							</tr>
						</table>
						<button type="submit" class="btn btn-dark">확인</button>
						<a href="${pageContext.request.contextPath}/memberLogin" class="btn btn-dark">취소</a>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /Main -->
<script>
	var result = '${result}';
	if(result === 'fail'){
		alert('일치하는 회원정보가 없습니다.');
	}
</script>
<!-- Footer -->
<c:import url="/WEB-INF/view/include/loginFooter.jsp"></c:import>