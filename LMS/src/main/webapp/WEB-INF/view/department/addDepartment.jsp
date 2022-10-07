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
	
	</br>

	<div class="product-status mg-b-15">
		<div class="container-fluid">
		
			<div class="row text-center">	
	
			<h4>학과 추가페이지</h4>
				</br>
			<form action="${pageContext.request.contextPath}/employee/addDepartment" method="post" class="form-inline">
						<table class="table table-bordered">
							<tr>
								<th>학과코드</th>
								<td colspan="2">
									<input type="text" name="departmentCode" class="form-control" placeholder="예> AT101 형식으로 입력하세요">
								</td>
							</tr>
							<tr>
								<th>학과이름</th>
								<td colspan="2">
									<input type="text" class="form-control" name="departmentName">
									
								</td>
							</tr>
					</table>
				<!-- row -->
				
				<button type="submit" class="btn btn-primary">학과 추가하기</button>
						<button class="btn btn-primary" type="button" id="btnCancel"
							onclick="window.history.back()">취소</button>
			</form>
			<!-- </form> -->
		</div></div>
	</div>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
