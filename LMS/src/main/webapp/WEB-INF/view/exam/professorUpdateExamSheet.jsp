<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
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
		
		<h4 class="card-header">
			"이름"님/"강의명"/시험문제 수정 ${examNo}!
		</h4>
	<body>
		<div class="container-xxl flex-grow-1 container-p-y"> 
		<hr>
		
		<div class="col-xl-6">
			<div class="card mb-4">
				<h3 class="card-header">시험지이름 : ${examSheet.examName}-${examSheet.examNo}</h3>
					<form action="${pageContext.request.contextPath}/exam/updateExamSheetName/${examNo}">
						<div class="mt-2 mb-3">
							<input name="examNo" id="examNo" type="hidden" value="${examNo}">※시험지이름
							<input name="examName" id="examName" class="form-control" type="text" style="width:200px" 
								 	autofocus value="${examSheet.examName }" value="${examName}">
							<button Type="submit">수정</button>
						</div>
					</form>
		</div>
			
			
			<c:forEach var = "m" items="${multipleQ}">
			<div class="card mb-4">
				<h3 class="card-header">객관식 ${m.multipleNo}번 문제</h3>
					<div class="mt-2 mb-3">
						<label >※문제내용</label>
						<div>
							<input class="form-control" type="text" style="width:200px" placeholder="문제내용"  autofocus value="${m.multipleContent }" >
							<button>수정</button>
						</div>
							<div class="mt-2 mb-3">
								<label>※보기(1~4번을 입력하세요) </label> 
									<div>
										<c:forEach var = "ex" items="${m.exampleList}" varStatus="status">
											
												<input class="form-control" type="text" style="width:200px" 
													placeholder="${status.count}번" autofocus value="${ex }" value="${ex}"> 
													
												<button>수정</button>
												
										</c:forEach>
									</div>
							</div>
						<label>※정답</label>
						<select id="" class="form-select color-dropdown" style="width:250px" name="" >
                              <option selected>정답을 선택해주세요.</option>
                              <option>1</option>
                              <option>2</option>
                              <option>3</option>
                              <option>4</option>
                        </select>
                        <button>수정</button>
			        </div>
			</div>
			</c:forEach>
		
		
		
			
			
		</div>
		<div class="col-xl-6">
		<c:forEach var = "s" items="${subjectiveQ}">
			<div class="card mb-4">
				<h3 class="card-header">주관식 문제 ${s.subjectiveNo}번</h3>
					
						<div class="mt-2 mb-3">
							<label>문제내용</label>
							<input class="form-control" type="text" style="width:400px" 
									placeholder="문제"  autofocus value="${s.subjectiveContent }"><button>수정</button>
						</div>
						
						<div class="mt-2 mb-3">
							<label>정답</label>
							<input class="form-control" type="text" style="width:200px" 
									placeholder="정답"  autofocus value="${s.subjectiveAnswer }"><button>수정</button>
			        	</div>
			        
			</div>
		</c:forEach>
		</div>
			<div class="">

				<a href=""
				class="btn btn-danger">수정완료</a>
				<a href="javascript:history.back()"
				class="btn btn-danger">뒤로가기</a>				
			</div>
			<hr>
			<div>
			======비어있는 Text box or 객관식 정답 선택 안될시 script처리
			===뒤로가기클릭시 뒤로갈건지 물어보기======</div>
		<hr>
		</div>
	</body>
	<c:import url="/WEB-INF/view/include/footer.jsp"></c:import> 