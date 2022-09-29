<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<!-- Main Contents -->
	
	<div class="product-status mg-b-15">
		<div class="container-fluid">
			<form action="${pageContext.request.contextPath}/assignmentRegList" method="get">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"
						style="padding: 1%;">
						<div class="product-status-wrap drp-lst">
							<h4>과제 상세보기</h4>
							<hr>
							
							<c:if test="${memberType eq '교수'}">
								<div class="container-info">
									<div>
									<a href="${pageContext.request.contextPath}/assignmentScore?studentLecNo=${assignmentReg.studentLecNo}">
										학생 과제 제출 체점하기</a>
									</div>
								</div>
							</c:if>
							<div class="card bady">
							<div class="asset-inner">
								<table class="table">
									<tr>
										<th>제출한 과제번호</th>
										<td>${RegOne.assignmentNo}</td>			
									</tr>						
									<tr>
									<th>제목</th>
										<td>${RegOne.assignmentRegTitle}</td>
									</tr>
									<tr>
										<th>내용</th>
										<td>${RegOne.assignmentRegContent}</td>				
									</tr>
									<tr>
										<th>내 점수</th>
										<th>${RegOne.assignmentScore}</th>
									</tr>
									<tr>
										<th>작성일</th>
										<th>${RegOne.createDate}</th>
									</tr>
									<tr>
										<th>파일이름</th>
										<th>${RegOne.originName}</th>
									</tr>
										<tr>
										<th>업로드된 파일이름</th>
										<th>${RegOne.fileName}</th>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td> <img src ="${pageContext.request.contextPath}/imgFile/file/${RegOne.fileName}.${RegOne.fileType}">
											<a href="${pageContext.request.contextPath}/downloadFile?fileName=${RegOne.fileName}&assignmentRegNo=${RegOne.assignmentRegNo}">${RegOne.originName}</a>
										</td>
									</tr>
									
								</table>
							</div>
						</div>
						</div>
					</div>
				</div>
			</form>	
		</div>
	</div>
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
