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
								<a href="${pageContext.request.contextPath}/member/calendar?memberCode=${memberCode}" class="btn btn-sm btn-outline-primary">Today
									schedule</a>
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
	
			<div class="row">
				<!-- 날씨 -->
				<div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
					<div class="card h-100">
						<div class="card-header d-flex align-items-center justify-content-between pb-0">
							<div class="card-title mb-0">
								오늘의 날씨
								<small class="text-muted">Today's Weather</small>
							</div>
						</div>
						<div class="card-body">
							<div class="d-flex justify-content-between align-items-center mb-3">
	
							</div>
						</div>
					</div>
				</div>
				<!--/ 날씨 -->
				
				<!-- 강의 -->
				<div class="col-md-6 col-lg-4 order-1 mb-4">
					<div class="card h-100">
						<div
							class="card-header d-flex align-items-center justify-content-between">
							<h5 class="card-title m-0 me-2">내 강의</h5>
						</div>
						<div class="card-body">
							<ul class="p-0 m-0">
								<c:forEach var="s" items="${studentList}">
									<li class="d-flex mb-4 pb-1">
									<div class="avatar flex-shrink-0 me-3">
										<img src="../assets/img/icons/unicons/wallet.png" alt="User"
											class="rounded" />
									</div>
									<div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
										<div class="me-2">
											<small class="text-muted d-block mb-1">${s.professorName}</small>
											<h6 class="mb-0">${s.lectureName}</h6>
										</div>
										<div class="user-progress d-flex align-items-center gap-1">
											<a href="${pageContext.request.contextPath}/student/openedLectureOne?openedLecNo=${s.openedLecNo}" class="btn btn-primary">바로가기</a>
										</div>
									</div>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<!--/ 강의 -->
				
				<!-- 지도 API -->
				<div class="col-md-6 col-lg-4 order-2 mb-4">
					<div class="card h-100">
						<div class="card-header d-flex align-items-center justify-content-between pb-0">
							<div class="card-title mb-0">
								<h5 class="m-0 me-2">지도</h5>
								<small class="text-muted">찾아오시는길</small>
 					 				<div id="map" style="width:450%;height:350px;"></div>
							</div>
						</div>
						<div class="card-body px-0">
						</div>
					</div>
				</div>
				<!--/ 지도 API -->
	
				
			</div>
		</div>
	</div>
	<!-- /Main -->
<!-- Footer -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=704877bb7838f7ab8fc0a66afcd3f51f&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.4787825,126.8811032), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('금천구 가산디지털1로 151', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:100px;text-align:center;padding:6px 0;">구디대학교</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>
