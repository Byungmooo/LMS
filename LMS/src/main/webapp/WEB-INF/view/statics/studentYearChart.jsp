<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		<!-- studentLectureMenu -->
		<div class="row">
			<div class="col-sm-9 col-12">
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">"${memberName}"님 /</span>${lectureName}
				</h4>
			</div>
		
		</div>
		<div>
			<ul class="nav nav-pills flex-column flex-md-row mb-3">
				<li class="nav-item " >
					<a class="nav-link active" href="${pageContext.request.contextPath}/member/studentYearChart">
					<i class="bx bx-user me-1"></i>
						학년별 통계
					</a>
					
				</li>
				<li class="nav-item" >
					<a class="nav-link" href="${pageContext.request.contextPath}/member/regionChart">
					<i class="bx bx-bell me-1"></i> 
						지역별 통계
					</a>
				</li>
				<li class="nav-item" >
					<a class="nav-link " href="${pageContext.request.contextPath}/member/departmentChart">
					<i class="bx bx-link-alt me-1"></i> 
						부서별 통계
					</a>
				</li>

	
			</ul>
		</div>
		
		
		<hr class="my-1" />
		
		
		</div>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
		<div class="container-xxl flex-grow-1 container-p-y">	  
			<!-- Row1 구분 -->
			<div class="row text-center">	    
				<div class="card h-100">
					<div class="card-header">
						<div class="card-title mb-0">
							최근 10년 입학연도 통계
						</div>
					</div>
					<div class="card-body">
						<canvas id="mixed-chart" width="800" height="450"></canvas>
						<script type="text/javascript">	
							const data = JSON.parse('${data}');
							const EY = ["2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022"]		
						
						
							
							<!--인원 카운트-->
	                           const COUNTS =  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	                           const MCOUNTS = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	                           const WCOUNTS = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	                  data.map((data, idx, arr) =>  {
	                       const year = data.createDate;
	                             const yearIdx = EY.indexOf(year);
	                      
	                             if(EY.includes(year)){ COUNTS[yearIdx] ++; } 
	                             if(data.gender === "남") { MCOUNTS[yearIdx] ++; }
	                                   else { WCOUNTS[yearIdx] ++ ; }
	                                
	                  })

							
		
new Chart(document.getElementById("mixed-chart"), {
    type: 'bar',
    data: {
      labels: EY,
      datasets: [{
          label: "남자",
          type: "line",
          borderColor: "#00FF00",
          data: MCOUNTS,
          fill: false
        },  {
            label: "여자",
            type: "line",
            borderColor: "#8B00FF",
            data: WCOUNTS,
            fill: false
          },{
          label: "남자",
          type: "bar",
          backgroundColor: "#0067a3",
          data: MCOUNTS,
        }, {
          label: "여자",
          type: "bar",
          backgroundColor: "#FF0000",
          backgroundColorHover: "#FF0000",
          data: WCOUNTS
        }
      ]
    },
    options: {
      title: {
        display: true,
        text: '입학연도 남녀통계'
      },
      legend: { display: false }
    }
});
						</script>
					</div>
					
				</div>
			</div>
			<!-- /Row1 구분 -->
		</div>									
	

	<!-- / Main -->
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 