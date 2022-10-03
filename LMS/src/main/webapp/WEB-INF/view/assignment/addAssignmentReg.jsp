<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

  <script>
	$(document).ready(function(){
		$('#openedLecNo').change(function() {
			if($('#openedLecNo').val() == '') {
				alert('openedLecNo를 선택하세요');
			} else {
				$('#assignmentTitle').empty();
				$('#assignmentTitle').append('<option value="">::: 과제제목 선택 :::</option>')
			}
		});
	});
	</script>
	
	<div class="product-status mg-b-15">
		<div class="container-xxl flex-grow-1 container-p-y">
			<form action="${pageContext.request.contextPath}/student/addAssignmentReg"
			enctype="multipart/form-data" id="addForm" method="post">
			
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding:3%;">
						<div class="product-status-wrap drp-lst">
							<h4>과제 제출</h4>
							<hr>
							<div class="form-group">
								제출해야하는 과제 제목
								<select name="openedLecNo"> <!-- select + option 은 세트 / 그안에 돌릴것만 넣으면 됨-->
									<c:forEach var="r" items="${list}">
										<option value="${r.openedLecNo}">${r.assignmentTitle}</option>
									 <input type="hidden" name="assignmentNo" id="assignmentNo" value="${r.assignmentNo}">	 
									</c:forEach>
								</select>
							<div class="form-group">
								<label for="assignmentRegTitle">과제 제목</label>
								<input name="assignmentRegTitle" type="text" class="form-control">
							</div>
							<div class="form-group">
								<label for="assignmentRegContent">과제 내용</label>
								<textarea name="assignmentRegContent" class="form-control"></textarea>
							</div>
							<div class="form-group">
								<label for="regFile">첨부파일</label>
								<input name="regFile" id="regFile" type="file" class="form-control">
							</div>
						</div>
				
					<div class="payment-adress">
					<button type="submit" class="btn btn-primary">과제 제출</button>
					</div>
					</div>
				</div>
				<!-- row -->
			</form>
			<!-- </form> -->
			</div>
		</div>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
