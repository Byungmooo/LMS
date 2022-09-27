<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Header -->
<c:import url="/WEB-INF/view/include/studentHeader.jsp"></c:import>	

	<!-- Main -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="fw-bold py-3 mb-4">
			<span class="text-muted fw-light">"이름"님 /</span>강의
		</h4>
		<hr class="my-5" />
		
		<!-- studentLectureList -->
		<div class="card text-center">
			<h5 class="card-header">출석부(${date})</h5>
			<div class="table-responsive text-nowrap">
				<table class="table">
					<caption class="ms-4">List of Lecture</caption>
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>학번</th>
							<th>출석체크</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="l" items="${list}">
							<tr>
								<td><strong><fmt:formatNumber type="number" maxFractionDigits="0" value="${l.listNo}"/></strong></td>
								<td>${l.memberName}</td>
								<td>${l.studentCode}</td>
								<td>
									<div class="dropdown">
										${l.attendanceState}
										<button type="button" class="btn p-0 dropdown-toggle hide-arrow"
											data-bs-toggle="dropdown">
											<i class="bx bx-dots-vertical-rounded"></i>
										</button>
										<div class="dropdown-menu">
											<form class="dropdown-item" action="${pageContext.request.contextPath}/lectureAttendance" method="post">
												<input type="hidden" name="studentLecNo" value="${l.studentLecNo}">
												<input type="hidden" name="openedLecNo" value="${l.openedLecNo}">
												<input type="hidden" name="attendanceDate" value="${date}">
												<input type="hidden" name="attendanceState" value="출석">
												<i class="bx bx-book me-1"></i>
												<button type="submit" class="btn">출석</button>
											</form>
											<form class="dropdown-item" action="${pageContext.request.contextPath}/lectureAttendance" method="post">
												<input type="hidden" name="studentLecNo" value="${l.studentLecNo}">
												<input type="hidden" name="openedLecNo" value="${l.openedLecNo}">
												<input type="hidden" name="attendanceDate" value="${date}">
												<input type="hidden" name="attendanceState" value="지각">
												<i class="bx bx-book me-1"></i>
												<button type="submit" class="btn">지각</button>
											</form>
											<form class="dropdown-item" action="${pageContext.request.contextPath}/lectureAttendance" method="post">
												<input type="hidden" name="studentLecNo" value="${l.studentLecNo}">
												<input type="hidden" name="openedLecNo" value="${l.openedLecNo}">
												<input type="hidden" name="attendanceDate" value="${date}">
												<input type="hidden" name="attendanceState" value="조퇴">
												<i class="bx bx-book me-1"></i>
												<button type="submit" class="btn">조퇴</button>
											</form>
											<form class="dropdown-item" action="${pageContext.request.contextPath}/lectureAttendance" method="post">
												<input type="hidden" name="studentLecNo" value="${l.studentLecNo}">
												<input type="hidden" name="openedLecNo" value="${l.openedLecNo}">
												<input type="hidden" name="attendanceDate" value="${date}">
												<input type="hidden" name="attendanceState" value="결석">
												<i class="bx bx-book me-1"></i>
												<button type="submit" class="btn">결석</button>
											</form>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- / Main -->
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 
