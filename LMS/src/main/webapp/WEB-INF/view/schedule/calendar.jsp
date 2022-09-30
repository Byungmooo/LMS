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
	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="fw-bold py-3 mb-4 text-center">
			<strong>강의시간표</strong>
		</h4>
		<hr class="my-5" />
			<div class="text-center">
				<a href="${pageContext.request.contextPath}/member/calendar?year=${ year }&month=${ month - 1 }
					&memberCode=${memberCode}" class="btn btn-primary">이전 달</a> &nbsp; 
					<strong style="font-size: x-large;">${ year }년 ${ month }월</strong>
				&nbsp; <a
					href="${pageContext.request.contextPath}/member/calendar?year=${ year }&month=${ month + 1 }
					&memberCode=${memberCode}" class="btn btn-primary">다음 달</a>
			</div>
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
						<c:forEach var="i" begin="1" end="${totalTd}" step="1">
							<c:choose>
								<c:when test="${(i - startBlank) > 0 && i <= endDay+startBlank}">
									<td style="float: top;" width="10%">
										<!-- 금일날짜 -->
										<div>
											<span style="float: top;">${i - startBlank}</span>
										</div> 
										
										<div style="display: flex; flex-direction: column; height: 200px;">
											
											<!-- 학부일정 -->
											<c:if test="${!((i%7 == 0)||(i%7 == 1))}">
												<strong style="font-size: small;">● 학부일정</strong>
											</c:if>
											<div style="flex-grow: 1; width1: 50%;">
												<c:forEach items="${scheduleList}" var="s">
													<c:if test="${s.scheduleYear==year&&s.scheduleMonth==month&&s.scheduleDay==(i-startBlank)}">
															<span style="font-size: x-small;">-${s.depScheduleContent}</span>
															<br>
													</c:if>
												</c:forEach>
											</div>

											<!-- 오늘내강의 -->
											<c:if test="${!((i%7 == 0)||(i%7 == 1))}">
												<strong style="font-size: small;">● 강의</strong>
											</c:if>
											<div style="flex-grow: 4;">
												<c:forEach items="${list}" var="l">
													<c:if test="${((l.openYear <= year)&&(l.closeYear >= year))&&
														((l.openMonth < month)&&(l.closeMonth > month))}">
														<c:if test="${i%7==(l.lectureYoil+1)}">
															<span style="font-size: x-small;">
																<a href="#">-${l.lectureName}</a>
															</span>
															<br>
														</c:if>
													</c:if>
													<c:if test="${((l.openYear <= year)&&(l.closeYear >= year))&&
														(l.openMonth == month)&&(l.openDay<=(i - startBlank))}">
														<c:if test="${i%7==(l.lectureYoil+1)}">
															<span style="font-size: x-small;">
																<a href="#">-${l.lectureName}</a>
															</span>
															<br>
														</c:if>
													</c:if>
													<c:if test="${((l.openYear <= year)&&(l.closeYear >= year))&&
														(l.closeMonth == month)&&(l.closeDay>=(i - startBlank))}">
														<c:if test="${i%7==(l.lectureYoil+1)}">
															<span style="font-size: x-small;">
																<a href="#">-${l.lectureName}</a>
															</span>
															<br>
														</c:if>
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
