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
	<div class="header-advance-area">
		<!-- Mobile Menu end -->
		<div class="breadcome-area">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="breadcome-list single-page-breadcome">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<ul class="breadcome-menu" style="float: left;">
										<li><a href="#">Home</a> <span class="bread-slash">/</span></li>
										<li><a href="#">강의</a> <span class="bread-slash">/</span></li>
										<li><a
											href="${pageContext.request.contextPath}/loginCheck/reportSubmitList">과제</a>
											<span class="bread-slash">/</span></li>
										<li><span class="bread-blod" style="font-weight: bold;">상세보기</span></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="product-status mg-b-15">
		<div class="container-fluid">
			<form action="${pageContext.request.contextPath}/loginCheck/modifyReport"
				id="modifyReportForm" method="post">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="product-status-wrap drp-lst">
							<h4>Modify ReportSubmit</h4>
							<hr>
							<div class="form-group">
								<input name="reportNo" type="hidden" value="${reportOne.reportNo}">
							</div>
							<div class="form-group">
								<label for="subjectName">subjectName</label> <input
									name="subjectName" id="subjectName" type="text"
									class="form-control" value="${reportOne.subjectName}" readonly>
							</div>
							<div class="form-group">
								<label for="reportTitle">reportSubmitTitle</label> <input
									name="reportTitle" id="reportTitle" type="text"
									class="form-control" value="${reportOne.reportTitle}">
							</div>
							<div class="form-group edit-ta-resize res-mg-t-15">
								<label for="reportContent">reportSubmitContent</label>
								<textarea name="reportContent" id="reportContent">${reportOne.reportContent}</textarea>
							</div>
							<div class="form-group">
								<label for="reportStartDate">reportStartDate</label> <input
									name="reportStartDate" id="reportStartDate" type="date"
									class="form-control" value="${reportOne.reportStartDate}">
							</div>
							<div class="form-group">
								<label for="reportEndDate">reportEndDate</label> <input
									name="reportEndDate" id="reportEndDate" type="date"
									class="form-control" value="${reportOne.reportEndDate}">
							</div>
						</div>
						<div class="payment-adress">
							<button type="button" id="modifyReportBtn"
								class="btn btn-primary waves-effect waves-light"
								style="float: right; margin-top: 3%; margin-right: 3%;">Submit</button>
						</div>
					</div>

				</div>
			</form>
			<!-- </form> -->
		</div>
	</div>
	
	<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 