<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
.weather {
padding: 50px;
background-image: url("../imgFile/weather.jpg");
background-repeat: no-repeat;
}

.weather2 {
align-items: center;
padding: 50px;
font-size: 50px;
font-weight: bold;
text-align: center;
background-color: #ffffff;
background-color: rgba(255, 255, 255, 0.5);
}
.lecture {
width: 100%; height: 100%;
background: url('../imgFile/N.jpg') no-repeat;       
}

.goodee {
width: 100%; height: 100%;
background-color: #fff;       
}

</style>
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
		<div class="row" style="margin-bottom: 20px;">
			<div class="container" style="width: 100%; height: 100%;">
				<div class="goodee border border-3">
					<div class="d-flex align-items-end row">
						<div class="col-sm-7">
							<div class="card-body">
								<h5 class="card-title text-primary" style="background-color: #fff; width: 10%; height: 60%;">${memberName}</h5>
								<p class="mb-4">
									<span class="fw-bold" style="color: #000;">아이디 : ${memberId}</span><br> <span
										class="fw-bold" style="color: #000;">멤버유형 : ${memberType}</span><br> <span
										class="fw-bold" style="color: #000;">멤버코드 : ${memberCode}</span><br>
									<c:if test="${memberType eq '교수'||memberType eq '학생'}">
										<span class="fw-bold" style="color: #000;">학부코드 : ${depNameOrLevel}</span><br>
									</c:if>
								</p>
								<c:if test="${memberType eq '교수'||memberType eq '학생'}">
									<a
										href="${pageContext.request.contextPath}/member/calendar?memberCode=${memberCode}"
										class="btn btn-sm btn-outline-primary" style="background-color: #fff;color: #000;">Today schedule</a>
									<br>
								</c:if>
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
		</div>

		<div class="row">
			<!-- 날씨 -->
			<div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
				<div class="card h-100">
					<div class="card-header d-flex align-items-center justify-content-between pb-0">
						<div class="card-title mb-0">
							오늘의 날씨 <small class="text-muted">Today's Weather</small>
						</div>
					</div>
					<div class="container">
						<div class="border border-3">
							<div class=weather>
								<div class="d-flex justify-content-between align-items-center mb-3">
									<div class=weather2>
										<div class="content d-flex">
											<div>
												<br>
												<div style="display: flex; position: relative">
													<div style="display: block;">
														<h4 class="location font-weight-normal float-right">금천구</h4>
														<h4 class="font-weight-normal float-right">가산동</h4>
														<h1 class="display-1 mb-0">
															<span id="weather"></span><span id="tmp"></span><sup>ºC</sup>
														</h1>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/ 날씨 -->

			<!-- 강의 -->

			<div class="col-md-6 col-lg-4 order-1 mb-4">
				<div class="card h-100">
					<c:if test="${(memberType eq '학생')||(memberType eq '교수')}">
						<div class="card-header d-flex align-items-center justify-content-between pb-0">
							<div class="card-title mb-0">
								<strong>내 강의</strong> <small class="text-muted">my lecture</small>
							</div>
						</div>
					</c:if>
					<c:if test="${(memberType eq '직원')}">
						<div
							class="card-header d-flex align-items-center justify-content-between">
							<h5 class="card-title m-0 me-2">최근공지사항</h5>
						</div>
					</c:if>
					<div class="container" style="height: 85%;">
						<c:if test="${memberType eq '교수'||memberType eq '학생'}">
							<div class="lecture border border-3" style="width: 100%; height: 100%;">
						</c:if>
							<div class="card-body px-0">
								<ul class="p-0 m-0">
									<c:forEach var="s" items="${studentList}">
										<li class="d-flex mb-4 pb-1">
											<div class="avatar flex-shrink-0 me-3">
												<img src="../assets/img/icons/unicons/wallet.png" alt="User"
													class="rounded" />
											</div>
											<div
												class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
												<div class="me-2">
													<small class="text-muted d-block mb-1">${s.professorName}</small>
													<h6 class="mb-0" style="color: #000;">${s.lectureName}</h6>
												</div>
												<div class="user-progress d-flex align-items-center gap-1">
													<a
														href="${pageContext.request.contextPath}/student/openedLectureOne?openedLecNo=${s.openedLecNo}"
														class="btn btn-primary">바로가기</a>
												</div>
											</div>
										</li>
									</c:forEach>
									<c:if test="${memberType eq '직원'}">
										<li class="d-flex mb-4 pb-1">
											<table class="table table-boarderd">
												<tr>
													<th width="20%"
														style="background-color: #999999; color: #fff;">번호</th>
													<th width="50%"
														style="background-color: #999999; color: #fff;">제목</th>
													<th width="30%"
														style="background-color: #999999; color: #fff;">작성자</th>
												</tr>
												<c:forEach var="e" items="${noticeList}">
													<tr>
														<td>${e.noticeNo}</td>
														<td>${e.noticeTitle}</td>
														<td>${e.writer}</td>
													</tr>
												</c:forEach>
											</table>
										</li>
									</c:if>
									<c:forEach var="p" items="${professorList}">
										<li class="d-flex mb-4 pb-1">
											<div class="avatar flex-shrink-0 me-3">
												<img src="../assets/img/icons/unicons/wallet.png" alt="User"
													class="rounded" />
											</div>
											<div
												class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
												<div class="me-2">
													<h6 class="mb-0">${p.lectureName}</h6>
													<small class="text-muted d-block mb-1">${p.currentStudentNum}명</small>
												</div>
												<div class="user-progress d-flex align-items-center gap-1">
													<a
														href="${pageContext.request.contextPath}/professor/openedLectureOne?openedLecNo=${p.openedLecNo}"
														class="btn btn-primary">바로가기</a>
												</div>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					<c:if test="${memberType eq '교수'||memberType eq '학생'}">
						</div>
					</c:if>
				</div>
			</div>

			<!--/ 강의 -->

			<!-- 지도 API -->
			<div class="col-md-6 col-lg-4 order-2 mb-4">
				<div class="card h-100">
					<div class="card-header d-flex align-items-center justify-content-between pb-0">
						<div class="card-title mb-0">
							<strong>찾아오시는길</strong> <small class="text-muted">Academy's map</small>
						</div>
					</div>
					<div class="card-body px-0">
						<div class="container">
							<div id="map" class="border border-3" style="width: 100%; height: 100%;"></div>
						</div>
					</div>
				</div>
			</div>
			<!--/ 지도 API -->


		</div>
	</div>
</div>
<!-- /Main -->
<!-- Footer -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=704877bb7838f7ab8fc0a66afcd3f51f&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.4787825, 126.8811032), // 지도의 중심좌표
		level : 4
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder
			.addressSearch(
					'금천구 가산디지털1로 151',
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:100px;text-align:center;padding:6px 0;">구디대학교</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});

	$
			.ajax({
				url : '/LMS/weather',
				type : 'get',
				timeout : 30000,
				contentType : 'application/json',
				dataType : 'json',
				success : function(data, status, xhr) {
					let dataHeader = data.result.response.header.resultCode;
					if (dataHeader == '00') {
						console.log('success ==>');
						console.log(data);
						let arr = data.result.response.body.items.item;

						if (arr[7].fcstValue >= 80) { // 습도가 80퍼 이상일 때
							if (arr[6].fcstValue == 0) { // 비가 아닐 때
								if (arr[5].fcstValue == 1) { // 맑음 상태일 때
									$('#weather')
											.append(
													'<i class="icon-sun mr-2" width="20"></i>');
								} else { // 흐림 상태일 때
									$('#weather')
											.append(
													'<i class="icon-cloud mr-2" width="20"></i>');
								}
							} else if (arr[6].fcstValue == 1) { // 비 상태일 때
								$('#weather')
										.append(
												'<i class="icon-umbrella mr-2" width="20"></i>');
							} else if (arr[6].fsctValue == 2
									|| arr[6].fsctValue == 3) { // 비/눈 or 눈/비 상태일 때
								if (arr[0].fcstValue < -5) { // 기온이 -5도 이하일 때
									$('#weather')
											.append(
													'<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-snow" viewBox="0 0 16 16"><path d="M8 16a.5.5 0 0 1-.5-.5v-1.293l-.646.647a.5.5 0 0 1-.707-.708L7.5 12.793V8.866l-3.4 1.963-.496 1.85a.5.5 0 1 1-.966-.26l.237-.882-1.12.646a.5.5 0 0 1-.5-.866l1.12-.646-.884-.237a.5.5 0 1 1 .26-.966l1.848.495L7 8 3.6 6.037l-1.85.495a.5.5 0 0 1-.258-.966l.883-.237-1.12-.646a.5.5 0 1 1 .5-.866l1.12.646-.237-.883a.5.5 0 1 1 .966-.258l.495 1.849L7.5 7.134V3.207L6.147 1.854a.5.5 0 1 1 .707-.708l.646.647V.5a.5.5 0 1 1 1 0v1.293l.647-.647a.5.5 0 1 1 .707.708L8.5 3.207v3.927l3.4-1.963.496-1.85a.5.5 0 1 1 .966.26l-.236.882 1.12-.646a.5.5 0 0 1 .5.866l-1.12.646.883.237a.5.5 0 1 1-.26.966l-1.848-.495L9 8l3.4 1.963 1.849-.495a.5.5 0 0 1 .259.966l-.883.237 1.12.646a.5.5 0 0 1-.5.866l-1.12-.646.236.883a.5.5 0 1 1-.966.258l-.495-1.849-3.4-1.963v3.927l1.353 1.353a.5.5 0 0 1-.707.708l-.647-.647V15.5a.5.5 0 0 1-.5.5z"/></svg>');
								} else { // 기온이 -5도 이상일 때
									$('#weather')
											.append(
													'<i class="icon-umbrella mr-2" width="20"></i>');
								}
							} else { // 눈 상태일때
								$('#weather')
										.append(
												'<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-snow" viewBox="0 0 16 16"><path d="M8 16a.5.5 0 0 1-.5-.5v-1.293l-.646.647a.5.5 0 0 1-.707-.708L7.5 12.793V8.866l-3.4 1.963-.496 1.85a.5.5 0 1 1-.966-.26l.237-.882-1.12.646a.5.5 0 0 1-.5-.866l1.12-.646-.884-.237a.5.5 0 1 1 .26-.966l1.848.495L7 8 3.6 6.037l-1.85.495a.5.5 0 0 1-.258-.966l.883-.237-1.12-.646a.5.5 0 1 1 .5-.866l1.12.646-.237-.883a.5.5 0 1 1 .966-.258l.495 1.849L7.5 7.134V3.207L6.147 1.854a.5.5 0 1 1 .707-.708l.646.647V.5a.5.5 0 1 1 1 0v1.293l.647-.647a.5.5 0 1 1 .707.708L8.5 3.207v3.927l3.4-1.963.496-1.85a.5.5 0 1 1 .966.26l-.236.882 1.12-.646a.5.5 0 0 1 .5.866l-1.12.646.883.237a.5.5 0 1 1-.26.966l-1.848-.495L9 8l3.4 1.963 1.849-.495a.5.5 0 0 1 .259.966l-.883.237 1.12.646a.5.5 0 0 1-.5.866l-1.12-.646.236.883a.5.5 0 1 1-.966.258l-.495-1.849-3.4-1.963v3.927l1.353 1.353a.5.5 0 0 1-.707.708l-.647-.647V15.5a.5.5 0 0 1-.5.5z"/></svg>');
							}
						} else { // 습도가 80퍼 미만일 때
							if (arr[5].fcstValue == 1) { // 맑음 상태일 때
								$('#weather')
										.append(
												'<i class="icon-sun mr-2" width="20"></i>');
							} else { // 흐림 상태일 때
								$('#weather')
										.append(
												'<i class="icon-cloud mr-2" width="20"></i>');
							}
						}

						for (let i = 0; i < arr.length; i++) {
							if (arr[i].category == 'TMP') {
								$('#tmp').append(arr[i].fcstValue);
							}
						}
					} else {
						console.log('fail ==>');
						console.log(data);
					}
				},
				error : function(e, status, xhr, data) {
					console.log('error ==>');
					console.log(e);
				}
			});
</script>
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>
