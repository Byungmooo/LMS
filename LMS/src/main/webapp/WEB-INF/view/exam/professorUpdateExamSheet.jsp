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

<h4 class="card-header">"이름"님/"강의명"/시험문제 수정 ${examNo}!</h4>
<body>
	<input type="hidden" id="exam_no" value="${examSheet.examNo }">
	<div class="container-xxl flex-grow-1 container-p-y">
		<hr>

		<div class="col-xl-6">
			<div class="card mb-4">
				<h3 class="card-header">시험지이름 :
					${examSheet.examName}-${examSheet.examNo}</h3>
				<form id="examSheetForm">
					<div class="mt-2 mb-3" >
						<input name="examNo" id="examNo" type="hidden" value="${examNo}">※시험지이름
							<div >
							<input name="examName" id="examName" class="form-control"
								type="text" style="width: 200px" autofocus value="${examSheet.examName }" value="${examName}">
							<button  class="btn btn-primary" type="button" onclick="examSheetUpdate();">수정</button>
							</div>
					</div>
				</form>
			</div>


			<c:forEach var="m" items="${multipleQ}">
				<div class="card mb-4">
					<h3 class="card-header">객관식 ${m.multipleNo}번 문제</h3>
					<div class="mt-2 mb-3">
						<label>※문제내용</label>
						<div>
							<input class="form-control" type="text" style="width: 200px"
								placeholder="문제내용" value="${m.multipleContent}"
								id="multipleContent_${m.multipleNo }">
							<button class="btn btn-primary" type="button" onclick="multipleUpdate('${m.multipleNo}')">수정</button>
						</div>
						<div class="mt-2 mb-3">
							<label>※보기(1~4번을 입력하세요) </label>
							<div>
								<c:forEach var="ex" items="${m.exampleList}" varStatus="status">

									<input class="form-control" type="text" style="width: 200px"
										placeholder="${status.count}번" value="${ex}"
										id="exampleContent_${m.multipleNo }">

									<button class="btn btn-primary" type="button"  
										onclick="exampleUpdate('${m.multipleNo }','${status.count}')">수정</button>

								</c:forEach>
							</div>
						</div>
						<div>
							<label>※정답</label> <label>1번<input type="radio"
								name="multipleAnswer_${m.multipleNo}" id="multipleAnswer"
								value="1">
							</label> <label>2번<input type="radio"
								name="multipleAnswer_${m.multipleNo}" id="multipleAnswer"
								value="2">
							</label> <label>3번<input type="radio"
								name="multipleAnswer_${m.multipleNo}" id="multipleAnswer"
								value="3">
							</label> <label>4번<input type="radio"
								name="multipleAnswer_${m.multipleNo}" id="multipleAnswer"
								value="4">
							</label>
							<button class="btn btn-primary" type="button"
								onclick="multipleAnswerUpdate('${m.multipleNo}')">수정</button>
						</div>
						<!-- <select id="" class="form-select color-dropdown" style="width:250px" name="" >
                              <option selected>정답을 선택해주세요.</option>
                              <option>1</option>
                              <option>2</option>
                              <option>3</option>
                              <option>4</option>
                        </select> -->

					</div>
				</div>
			</c:forEach>





		</div>
		<div class="col-xl-6">
			<c:forEach var="s" items="${subjectiveQ}">
				<div class="card mb-4">
					<h3 class="card-header">주관식 문제 ${s.subjectiveNo}번</h3>

					<div class="mt-2 mb-3">
						<label>문제내용</label> <input class="form-control" type="text"
							style="width: 400px" placeholder="문제"
							value="${s.subjectiveContent }"
							id="subjectiveContent_${s.subjectiveNo}">
						<button type="button" class="btn btn-primary"
							onclick="subjectiveUpdate('${s.subjectiveNo}');">수정</button>
					</div>

					<div class="mt-2 mb-3">
						<label>정답</label> <input class="form-control" type="text"
							style="width: 200px" placeholder="정답"
							value="${s.subjectiveAnswer }"
							id="subjectiveAnswer_${s.subjectiveNo}">
						<button class="btn btn-primary" type="button"
							onclick="subAnswerUpdate('${s.subjectiveNo}');">수정</button>
					</div>

				</div>
			</c:forEach>
		</div>
		<div class="">

			<a href="${pageContext.request.contextPath}/exam/professorExList" class="btn btn-primary">수정완료</a> <a
				href="javascript:history.back()" class="btn btn-primary">뒤로가기</a>
		</div>
		<hr>
		<div>======비어있는 Text box or 객관식 정답 선택 안될시 script처리 ===뒤로가기클릭시
			뒤로갈건지 물어보기======</div>
		<hr>
	</div>
</body>

<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>


<script>
	//시험지이름 수정
	function examSheetUpdate() {

		if (confirm("수정하시겠습니까?")) {
			$.ajax({
				url : '/LMS/exam/updateExamSheetName/update',
				type : 'POST',
				data : $('#examSheetForm').serialize(),
				success : function(result) {
					if (result == "SUCCESS") {
						alert('수정에 성공하였습니다.');
						location.reload();
					} else {
						alert("수정에 실패하였습니다.");
					}
				},
				error : function(error) {
					alert("수정에 실패하였습니다.");
				}
			});
		}
	}

	//객관식 문제 수정
	function multipleUpdate(multipleNo) {
		var multipleContent = $('#multipleContent_' + multipleNo).val();
		var examNo = $('#exam_no').val();

		var jsonData = {
			"examNo" : examNo,
			"multipleNo" : multipleNo,
			"multipleContent" : multipleContent
		};

		if (confirm("수정하시겠습니까?")) {
			$.ajax({
				url : '/LMS/exam/multipleContent/update',
				type : 'POST',
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(jsonData),
				dataType : "json",
				success : function(data) {
					if (data.result == "SUCCESS") {
						alert('수정에 성공하였습니다.');
						location.reload();
					} else {
						alert("수정에 실패하였습니다.");
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
	}

	//객관식 문제 보기 수정
	function exampleUpdate(multipleNo, exampleNo) {
		console.log(multipleNo);
		console.log(exampleNo);

		var exampleContent = $('#exampleContent_' + exampleNo).val();
		var examNo = $('#exam_no').val();

		console.log(exampleContent);
		console.log(examNo);

		var jsonData = {
			"examNo" : examNo,
			"multipleNo" : multipleNo,
			"exampleNo" : exampleNo,
			"exampleContent" : exampleContent
		};

		if (confirm("수정하시겠습니까?")) {
			$.ajax({
				url : '/LMS/exam/exampleContent/update',
				type : 'POST',
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(jsonData),
				dataType : "json",
				success : function(data) {
					if (data.result == "SUCCESS") {
						alert('수정에 성공하였습니다.');
						console.log(data.result + "성공");
						location.reload();
					} else {
						alert("수정에 실패하였습니다.");
						console.log(data.result + "실패");
					}
				},
				error : function(error) {
					console.log(error);
				}

			});
		}
	}
	//객관식 정답 수정
	function multipleAnswerUpdate(multipleNo) {
		var multipleAnswer = $(
				'input[name="multipleAnswer_' + multipleNo + '"]:checked')
				.val();
		var examNo = $('#exam_no').val();
		console.log("examNo:" + examNo);
		console.log("multipleNo:" + multipleNo);
		console.log("multipleAnswer:" + multipleAnswer);

		var jsonData = {
			"examNo" : examNo,
			"multipleNo" : multipleNo,
			"multipleAnswer" : multipleAnswer
		};
		console.log("jsonData:" + jsonData);

		if (confirm("수정하시겠습니까?")) {
			$.ajax({
				url : '/LMS/exam/multipleAnswer/update',
				type : 'POST',
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(jsonData),
				dataType : "json",
				success : function(data) {
					if (data.result == "SUCCESS") {
						alert('수정에 성공하였습니다.');
						location.reload();
					} else {
						alert("수정에 실패하였습니다.");
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
	}

	//주관식 문제 수정
	function subjectiveUpdate(subjectiveNo) {
		var subjectiveContent = $('#subjectiveContent_' + subjectiveNo).val();
		var examNo = $('#exam_no').val();

		console.log(examNo + "//examNo");
		console.log(subjectiveNo + "//subjectiveNo");
		console.log(subjectiveContent + "//subjectiveContent")

		var jsonData = {
			"examNo" : examNo,
			"subjectiveNo" : subjectiveNo,
			"subjectiveContent" : subjectiveContent
		};

		if (confirm("수정하시겠습니까?")) {
			$.ajax({
				url : '/LMS/exam/subjectiveContent/update',
				type : 'POST',
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(jsonData),
				dataType : "json",
				success : function(data) {
					if (data.result == "SUCCESS") {
						alert('수정에 성공하였습니다.');
						console.log(data.result + "성공");
						location.reload();
					} else {
						alert("수정에 실패하였습니다.");
						console.log(data.result + "실패");
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
	}

	//주관식 답안 수정
	function subAnswerUpdate(subjectiveNo) {
		var subjectiveAnswer = $('#subjectiveAnswer_' + subjectiveNo).val();
		var examNo = $('#exam_no').val();

		console.log(examNo + "//examNo");
		console.log(subjectiveNo + "//subjectiveNo");
		console.log(subjectiveAnswer + "//subjectiveAnswer")

		var jsonData = {
			"examNo" : examNo,
			"subjectiveNo" : subjectiveNo,
			"subjectiveAnswer" : subjectiveAnswer
		};

		if (confirm("수정하시겠습니까?")) {
			$.ajax({
				url : '/LMS/exam/subjectiveAnswer/update',
				type : 'POST',
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(jsonData),
				dataType : "json",
				success : function(data) {
					if (data.result == "SUCCESS") {
						alert('수정에 성공하였습니다.');
						console.log(data.result + "성공");
						location.reload();
					} else {
						alert("수정에 실패하였습니다.");
						console.log(data.result + "실패");
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
	}
</script>
