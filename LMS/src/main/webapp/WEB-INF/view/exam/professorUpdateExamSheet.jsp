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
<div class="container-xxl flex-grow-1 container-p-y">
	<div class="row" style="margin-bottom: 20px;">
		<div class="container">
			<div class="goodee border border-3" style="background-color: #fff;">
				<div class="d-flex align-items-end row">
					<div class="col-sm-7">
						<div class="card-body">
							<h5 class="card-title text-primary">${memberName}님어서오세요.</h5>
							<p class="mb-4">
								<span class="fw-bold" style="color: #000;">회원유형 :
									${memberType}</span><br> <span class="fw-bold"
									style="color: #000;">회원코드 : ${memberCode}</span><br>
								<c:if test="${memberType eq '교수'||memberType eq '학생'}">
									<span class="fw-bold" style="color: #000;">학과이름 :
										${depNameOrLevel}</span>
								</c:if>
							</p>
						</div>
					</div>
					<div class="col-sm-5 text-center text-sm-left">
						<div class="card-body pb-0 px-0 px-md-4">
							<img src="../imgFile/lecture.png" height="140"
								alt="View Badge User"
								data-app-dark-img="illustrations/man-with-laptop-dark.png"
								data-app-light-img="illustrations/man-with-laptop-light.png" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-9 col-12"></div>
		<div class="col-sm-3 col-12">
			<a class="btn btn-secondary"
				href="${pageContext.request.contextPath}/
					<c:if test="${memberType eq '학생'}">student</c:if>
					<c:if test="${memberType eq '교수'}">professor</c:if>/studentLectureList?memberCode=${memberCode}"
				style="float: right;"> 강의리스트 </a>
		</div>
	</div>

	<!-- lectureMenu -->
	<div>
		<ul class="nav nav-pills flex-column flex-md-row mb-3">
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/openedLectureOne?openedLecNo=${openedLecNo}">
					<i class="bx bx-user me-1"></i> 강의상세
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureNoticeList?openedLecNo=${openedLecNo}">
					<i class="bx bx-bell me-1"></i> 강의공지사항
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureQuestionList?openedLecNo=${openedLecNo}">
					<i class="bx bx-link-alt me-1"></i> 질문게시판
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/assignmentList?openedLecNo=${openedLecNo}&studentCode=${memberCode}">
					<i class="bx bx-link-alt me-1"></i> 과제게시판
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">student</c:if>
						<c:if test="${memberType eq '교수'}">professor</c:if>/lectureAttendanceList?openedLecNo=${openedLecNo}&memberCode=${memberCode}">
					<i class="bx bx-link-alt me-1"></i> 강의출석
			</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="${pageContext.request.contextPath}/
						<c:if test="${memberType eq '학생'}">exam/studentExList?openedLecNo=${openedLecNo}&memberCode=${memberCode}</c:if>
						<c:if test="${memberType eq '교수'}">exam/professorExList?openedLecNo=${openedLecNo}&memberCode=${memberCode}</c:if>">
					<i class="bx bx-link-alt me-1"></i> 강의시험
			</a></li>
		</ul>
	</div>
	<div class="text-center">
		<h4 class="card-header">시험문제 수정 ${examNo}!</h4>
		<input type="hidden" id="exam_no" value="${examSheet.examNo }">
	</div>
	<div class="container-xxl flex-grow-1 container-p-y">
			<div class="card mb-4 text-center">
				<h3 class="card-header">시험지이름 :
					${examSheet.examName}-${examSheet.examNo}</h3>
				<form id="examSheetForm">
					<div class="mt-2 mb-3">
						<input name="examNo" id="examNo" type="hidden" value="${examNo}">※시험지이름
						<div>
							<input name="examName" id="examName" class="form-control"
								type="text" style="width: 200px" autofocus
								value="${examSheet.examName }" value="${examName}">
							<button class="btn btn-primary" type="button"
								onclick="examSheetUpdate();">수정</button>
						</div>
					</div>
				</form>
			</div>


			<c:forEach var="m" items="${multipleQ}">
				<div class="card mb-4">
					<div class="text-center">
						<h3 class="card-header">객관식 ${m.multipleNo}번 문제</h3>
					</div>
					<div class="mt-2 mb-3">
						<div class="row">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<label>※문제내용</label>
								<input class="form-control" type="text"
									placeholder="문제내용" value="${m.multipleContent}"
									id="multipleContent_${m.multipleNo }">
							</div>
							<div class="col-lg-1"></div>
							<div class="text-center" style="margin-top: 20px;">
								<button class="btn btn-primary" type="button"
									onclick="multipleUpdate('${m.multipleNo}')">수정</button>
							</div>
						</div>
						<div class="mt-2 mb-3">
							<div class="row">
								<div class="col-lg-1 col12"></div>
								<div class="col-lg-11 col12">
									<label>※보기(1~4번을 입력하세요)</label>
									<table class="table">
									<c:set var="i" value="1" />
									<c:forEach var="ex" items="${m.exampleList}" varStatus="status">
										<tr>	
											<c:if test="${i==5}">
												<c:set var="i" value="1" />
											</c:if>
											<th width="10%">
												${i}번
											</th>
											<td width="70%">
												<input class="form-control" type="text"
													placeholder="${status.count}번" value="${ex}"
													id="exampleContent_${m.multipleNo }">
											</td>
											<td width="20%">
												<button class="btn btn-primary" type="button"
													onclick="exampleUpdate('${m.multipleNo }','${status.count}')">수정</button>
											</td>
											<c:set var="i" value="${i+1}" />
										</tr>
									</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<div class="text-center">
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
					</div>
				</div>
			</c:forEach>
		</div>
		
		<c:forEach var="s" items="${subjectiveQ}">
			<div class="container-xxl flex-grow-1 container-p-y">
				<div class="card mb-4">
					<div class="text-center">
						<h3 class="card-header">주관식 ${s.subjectiveNo}번 문제</h3>
					</div>
					<div class="mt-2 mb-3">
						<div class="row">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<label>※문제내용</label>
								<textarea rows="5px" class="form-control"
									placeholder="문제"
									id="subjectiveContent_${s.subjectiveNo}">${s.subjectiveContent }
								</textarea>
							</div>
							<div class="col-lg-1"></div>
							<div class="text-center" style="margin-top: 20px;">
								<button type="button" class="btn btn-primary"
								onclick="subjectiveUpdate('${s.subjectiveNo}');">수정</button>
							</div>
						</div>
					</div>
					<div class="mt-2 mb-3">
						<div class="row">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
							<label>※정답</label>
							<textarea rows="5px" class="form-control" placeholder="정답"
								id="subjectiveAnswer_${s.subjectiveNo}">${s.subjectiveAnswer }
								</textarea>
							</div>
							<div class="col-lg-1"></div>
							<div class="text-center" style="margin-top: 20px;">
								<button class="btn btn-primary" type="button"
								onclick="subAnswerUpdate('${s.subjectiveNo}');">수정</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>

		<div class="text-center">
			<a href="${pageContext.request.contextPath}/exam/professorExList"
				class="btn btn-primary">수정완료</a> <a href="javascript:history.back()"
				class="btn btn-primary">뒤로가기</a>
		</div>
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
