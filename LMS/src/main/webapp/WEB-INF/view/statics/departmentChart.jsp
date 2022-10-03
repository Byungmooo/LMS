<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Header -->
<c:choose>
	<c:when test="${memberType eq '�л�'}">
		<c:import url="/WEB-INF/view/include/studentHeader.jsp"></c:import>	
	</c:when>
	<c:when test="${memberType eq '����'}">
		<c:import url="/WEB-INF/view/include/professorHeader.jsp"></c:import>	
	</c:when>
	<c:when test="${memberType eq '����'}">
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
					<span class="text-muted fw-light">"${memberName}"�� /</span>${lectureName}
				</h4>
			</div>
		
		</div>
		<div>
			<ul class="nav nav-pills flex-column flex-md-row mb-3">
				<li class="nav-item" >
					<a class="nav-link" href="${pageContext.request.contextPath}/member/statics/studentYearChart">
					<i class="bx bx-user me-1"></i>
						�г⺰ ���
					</a>
					
				</li>
				<li class="nav-item" ">
					<a class="nav-link" href="${pageContext.request.contextPath}/member/statics/regionChart">
					<i class="bx bx-bell me-1"></i> 
						������ ���
					</a>
				</li>
				<li class="nav-item" ">
					<a class="nav-link active" href="${pageContext.request.contextPath}/member/statics/departmentChart">
					<i class="bx bx-link-alt me-1"></i> 
						�μ��� ���
					</a>
				</li>

	
			</ul>
		</div>
		
		
		<hr class="my-1" />
		
		
		</div>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
		<div class="container-xxl flex-grow-1 container-p-y">	  
			<!-- Row1 ���� -->
			<div class="row text-center">	    
				<div class="card h-100">
					<div class="card-header">
						<div class="card-title mb-0">
							�а��� �ο� ���
						</div>
					</div>
					<div class="card-body">
						<canvas id="doughnut-chart" width="800" height="450"></canvas>
						<script type="text/javascript">	
							const data = JSON.parse('${data}');
							//const CODE = ["AT101","AT102","AT103","HT101","HT102","HT103","HT104","HT105","ST101","ST102","ST103","ST104","ST105","ST106","TT000"]
							const NAME = ["ü���а�","�����а�","���ǰ�","������а�","�߾��߹��а�","������а�","�濵�а�","�����а�","�����а�","�������ڰ��а�","ȭ�а��а�","�ż�����а�","��īƮ�δн����а�","��ǻ�Ͱ��а�","�����к�","��Ÿ"]
							const COLORS = [
								"#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850",
								"#369F36", "#5CEEE6","#46649B","#148CFF","#B0F7FF",
								"#B22222", "#E57733","#D873F1","#000000","#D064D0",
								"#FFF0F0", "#FFD200","#3CBCBC","#e8c3b9","#c45850",
								"#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850",
								"#FF1493", "#FFDC3C","#be32be","#e8c3b9","#D064D0"
								];
							const COUNTS = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0 ];
							data.map((data, idx, arr) =>  {
								const name = data.dName;
								if(NAME.includes(name)){ COUNTS[NAME.indexOf(name)] ++; }
								else {COUNTS[NAME.indexOf("��Ÿ")] ++;}
							})
							
							new Chart(document.getElementById("doughnut-chart"), {
							    type: 'bar',
							    data: {
							      labels: NAME,
							      datasets: [
							        {
							          label: "�ο�",
							          backgroundColor: COLORS,
							          data: COUNTS
							        }
							      ]
							    },
							    options: {
							      legend: { display: false },
							      title: {
							        display: false,
							        text: '�а��� �ο� ���'
							      }
							    }
							});
						</script>
					</div>
					
				</div>
			</div>
			<!-- /Row1 ���� -->
		</div>									
	

	<!-- / Main -->
<!-- Footer -->
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 