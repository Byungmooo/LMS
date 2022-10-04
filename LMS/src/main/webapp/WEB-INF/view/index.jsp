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
	<div class="content-wrapper">
		<div class="container-xxl flex-grow-1 container-p-y">
			<div class="row">
				<div class="col-md-6">
					<div class="card mb-4">
						<div class="d-flex align-items-end row">
							<div class="col-sm-7">
								<div class="card-body">
									<h5 class="card-title text-primary">${memberName}</h5>
									<p class="mb-4">
										<span class="fw-bold">아이디 : </span>${memberId}<br> <span
											class="fw-bold">멤버유형 : </span>${memberType}<br> <span
											class="fw-bold">멤버코드 : </span>${memberCode}<br>
										<c:if test="${memberType eq '교수'||memberType eq '학생'}">
											<span class="fw-bold">학부코드 : </span>${departmentCode}<br>
										</c:if>
									</p>
									<c:if test="${memberType eq '교수'||memberType eq '학생'}">
										<a href="" class="btn btn-sm btn-outline-primary">Today
											schedule</a>
										<br>
									</c:if>
									<span class="fw-bold">위에 지울거임 여기다 뭐 넣지</span>
								</div>
							</div>
							<div class="col-sm-5 text-center text-sm-left">
								<div class="card-body pb-0 px-0 px-md-4">
									<img src="../assets/img/illustrations/man-with-laptop-light.png"
										height="140" alt="View Badge User"
										data-app-dark-img="illustrations/man-with-laptop-dark.png"
										data-app-light-img="illustrations/man-with-laptop-light.png" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/ Total Revenue -->
				<div class="col-md-6">
					<div class="card mb-4">
						<div class="card-body">
							<div
								class="d-flex justify-content-between flex-sm-row flex-column gap-3">
								<div
									class="d-flex flex-sm-column flex-row align-items-start justify-content-between">
									<div class="card-title">
										<h5 class="text-nowrap mb-2">비트코인</h5>
										<span class="badge bg-label-warning rounded-pill">2022</span>
									</div>
									<div class="mt-sm-auto">
										<br>
										<small class="text-success text-nowrap fw-semibold"><i
											class="bx bx-chevron-up"></i> 999%</small>
										<h3 class="mb-0">$50,000,000,000</h3>
									</div>
								</div>
								<div id="profileReportChart"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
	
			<div class="row">
				<!-- Order Statistics -->
				<div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
					<div class="card h-100">
						<div class="card-header d-flex align-items-center justify-content-between pb-0">
							<div class="card-title mb-0">
								<h5 class="m-0 me-2">날씨?</h5>
								<small class="text-muted">----</small>
							</div>
						</div>
						<div class="card-body">
							<div class="d-flex justify-content-between align-items-center mb-3">
	
							</div>
						</div>
					</div>
				</div>
				<!--/ Order Statistics -->
	
				<!-- Expense Overview -->
				<div class="col-md-6 col-lg-4 order-1 mb-4">
					<div class="card h-100">
						<div class="card-header d-flex align-items-center justify-content-between pb-0">
							<div class="card-title mb-0">
								<h5 class="m-0 me-2">지도?</h5>
								<small class="text-muted">----</small>
							</div>
						</div>
						<div class="card-body px-0">
						
						</div>
					</div>
				</div>
				<!--/ Expense Overview -->
	
				<!-- Transactions -->
				<div class="col-md-6 col-lg-4 order-2 mb-4">
					<div class="card h-100">
						<div
							class="card-header d-flex align-items-center justify-content-between">
							<h5 class="card-title m-0 me-2">오늘 강의? (그럼 직원은?)</h5>
							<div class="dropdown">
								<button class="btn p-0" type="button" id="transactionID"
									data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									<i class="bx bx-dots-vertical-rounded"></i>
								</button>
								<div class="dropdown-menu dropdown-menu-end"
									aria-labelledby="transactionID">
									<a class="dropdown-item" href=""> ??</a> 
									<a class="dropdown-item" href=""> ??</a> 
									<a class="dropdown-item" href=""> ??</a>
								</div>
							</div>
						</div>
						<div class="card-body">
							<ul class="p-0 m-0">
								<li class="d-flex mb-4 pb-1">
									<div class="avatar flex-shrink-0 me-3">
										<img src="../assets/img/icons/unicons/paypal.png" alt="User"
											class="rounded" />
									</div>
									<div
										class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
										<div class="me-2">
											<small class="text-muted d-block mb-1">ㅁㅁㅁㅁ</small>
											<h6 class="mb-0">ㅁㅁㅁ</h6>
										</div>
										<div class="user-progress d-flex align-items-center gap-1">
											<h6 class="mb-0">+999</h6>
											<span class="text-muted">메소</span>
										</div>
									</div>
								</li>
								<li class="d-flex mb-4 pb-1">
									<div class="avatar flex-shrink-0 me-3">
										<img src="../assets/img/icons/unicons/wallet.png" alt="User"
											class="rounded" />
									</div>
									<div
										class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
										<div class="me-2">
											<small class="text-muted d-block mb-1">ㅁㅁㅁ</small>
											<h6 class="mb-0">ㅁㅁㅁ</h6>
										</div>
									</div>
								</li>
								<li class="d-flex mb-4 pb-1">
									<div class="avatar flex-shrink-0 me-3">
										<img src="../assets/img/icons/unicons/chart.png" alt="User"
											class="rounded" />
									</div>
									<div
										class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
										<div class="me-2">
											<small class="text-muted d-block mb-1">ㅁㅁㅁ</small>
											<h6 class="mb-0">ㅁㅁㅁ</h6>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!--/ Transactions -->
			</div>
		</div>
	</div>
	<!-- /Main -->
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>
