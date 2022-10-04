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

	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="fw-bold py-3 mb-4 text-center">
			<strong>강의시간표</strong>
		</h4>
		<hr class="my-5" />
	
		<!-- studentLectureOne -->
		<div class="row text-center">
			<div class="card">
				<h5 class="card-header">
					<strong>${memberName}님의 강의시간표</strong>
				</h5>
				<div class="card-body">
					<div style="float: right;">
						<span>클릭하면 해당 강의로 이동합니다.</span>
					</div>
					<table class="table table-bordered">
						<caption>lecture time</caption>	
						<tr>
							<th width="5%" style="background-color: #999999; color: #fff;"></th>
							<th width="15%" style="background-color: #999999; color: #fff;">월</th>
							<th width="15%" style="background-color: #999999; color: #fff;">화</th>
							<th width="15%" style="background-color: #999999; color: #fff;">수</th>
							<th width="15%" style="background-color: #999999; color: #fff;">목</th>
							<th width="15%" style="background-color: #999999; color: #fff;">금</th>
						</tr>
						<c:forEach begin="1" end="9" var="a">
							<tr height="130">
								<th style="background-color: #999999; color: #fff;">
									${a}교시
									<br/>
									${a+8}:00 ~ ${a+8}:50
								</th>
								<c:forEach begin="1" end="5" var="b">
									<td><c:forEach items="${list}" var="s">
											<c:if test="${b==s.lectureYoil && s.lectureStart<=a && a<=s.lectureEnd}">
												<a href="${pageContext.request.contextPath}/student/openedLectureOne?openedLecNo=${s.openedLecNo}"><strong><span style="font-size: small;">${s.lectureName}</span></strong></a>
												<br/>
												<span style="font-size: x-small;">${s.buildingName}-${s.classroomName}</span>
												<br/>
											</c:if>
										</c:forEach>
									</td>
									<!-- 요일이 b이고 교시가 <=a<=인 -->
								</c:forEach>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- /Main -->
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>
