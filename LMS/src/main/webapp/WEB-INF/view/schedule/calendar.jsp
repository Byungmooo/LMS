<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<div class="container">
		<h1 style="text-align: center;">수강 일정표</h1>
		<br>
		<h4 style="text-align: center;">

			<a
				href="${pageContext.request.contextPath}/calendar?year=${ year }&month=${ month - 1 }"
				class="btn btn-primary">이전 달</a> &nbsp; ${ year }년 ${ month }월
			&nbsp; <a
				href="${pageContext.request.contextPath}/calendar?year=${ year }&month=${ month + 1 }"
				class="btn btn-primary">다음 달</a>
		</h4>
		<br>

		<div class="mt-2" style="height: auto; width: auto;">
			<table id="zero_config"
				class="table table-striped table-bordered no-wrap">
				<thead>
					<tr>
						<th>일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th>토</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="i" begin="1" end="${totalTd}" step="1"> <!--  -->
							<c:choose>
								<c:when test="${(i - startBlank) > 0 && i <= endDay+startBlank}">
									<td style="float: top;" width="10%">
										<!-- 금일날짜 -->
										<div>
											<span style="float: top;">${i - startBlank}</span>
										</div> 
										
										<div style="display: flex; flex-direction: column; height: 200px;">
											
											<!-- 학부일정 -->
											<p>●학부일정</p>
											<div style="flex-grow: 1; width1: 50%;">
												<c:forEach items="${scheduleList}" var="s">
													<c:if test="${s.scheduleYear==year&&s.scheduleMonth==month&&s.scheduleDay==(i-startBlank)}">
														- ${s.depScheduleContent}
														<br>
													</c:if>
												</c:forEach>
											</div>
											
											<!-- 오늘내강의 -->
											<p>●강의</p>
											<div style="flex-grow: 4;">
												<c:forEach items="${list}" var="l">
													<c:if test="${i%7==(l.lectureYoil+1)}">
														<a href="#">-${l.lectureName}</a>
														<br>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</td>
								</c:when>

								<c:when test="${(i - startBlank) < 1 }">
									<td></td>
								</c:when>

								<c:when test="${i > endDay}">
									<td></td>
								</c:when>
							</c:choose>
							<c:if test="${ i % 7 == 0}">
					</tr>
					<tr>
							</c:if>
						</c:forEach>
					</tr>
				</tbody>
			</table>

		</div>
	</div>
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>
