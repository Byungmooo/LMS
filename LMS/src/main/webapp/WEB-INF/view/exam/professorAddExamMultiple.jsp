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
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="card text-center">
			<div class="card-header">
				<h3><strong>시험문제 추가</strong></h3>
			</div>
			<div class="card-body">
				<span>시험지번호 :${examSheet.examNo}번</span><br>
				<span>시험이름 :${examSheet.examName}</span><br>
				<input type="hidden" id="examNo" value="${examSheet.examNo}">
			</div>
		</div>
	</div>
	
	<form>
		<div class="container-xxl flex-grow-1 container-p-y">
			<div class="col-xl-6">
				<div class="card mb-4 text-center">
					<h3 class="card-header">객관식 문제 1번</h3>
					<div class="mt-2 mb-3">
						<div class="row">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<label>※문제내용</label>
								<textarea rows="5px" id="multipleName_1"
									class="form-control multiple">1번 문제내용
								</textarea>
							</div>
							<div class="col-lg-1"></div>
						</div>
						<label>※문제보기</label>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_1" type="text"
								placeholder="문제보기 1"> 
							</div>
							<div class="col-lg-1"></div>
						</div>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_1" type="text"
								placeholder="문제보기 2"> 
							</div>
							<div class="col-lg-1"></div>
						</div> 
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_1" type="text"
								placeholder="문제보기 3"> 
							</div>
							<div class="col-lg-1"></div>
						</div>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_1" type="text"
								placeholder="문제보기 4"> 
							</div>
							<div class="col-lg-1"></div>
						</div> 
						<label>※정답</label>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-3"></div>
							<div class="col-lg-6">
								<select id="multipleAnswer_1" class="form-select color-dropdown"
									name="">
									<option value="">정답을 선택해주세요.</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								</select>
							</div>
							<div class="col-lg-3"></div>
						</div>
					</div>
				</div>
				<div class="card mb-4 text-center">
					<h3 class="card-header">객관식 문제 2번</h3>
					<div class="mt-2 mb-3">
						<div class="row">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<label>※문제내용</label>
								<textarea rows="5px" id="multipleName_2"
									class="form-control multiple">2번 문제내용
								</textarea>
							</div>
							<div class="col-lg-1"></div>
						</div>
						<label>※문제보기</label>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_2" type="text"
								placeholder="문제보기 1"> 
							</div>
							<div class="col-lg-1"></div>
						</div>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_2" type="text"
								placeholder="문제보기 2"> 
							</div>
							<div class="col-lg-1"></div>
						</div> 
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_2" type="text"
								placeholder="문제보기 3"> 
							</div>
							<div class="col-lg-1"></div>
						</div>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_2" type="text"
								placeholder="문제보기 4">
							</div>
							<div class="col-lg-1"></div>
						</div> 
						<label>※정답</label>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-3"></div>
							<div class="col-lg-6">
								<select id="multipleAnswer_2" class="form-select color-dropdown"
									name="">
									<option value="">정답을 선택해주세요.</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								</select>
							</div>
							<div class="col-lg-3"></div>
						</div>
					</div>
				</div>
				<div class="card mb-4 text-center">
					<h3 class="card-header">객관식 문제 3번</h3>
					<div class="mt-2 mb-3">
						<div class="row">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<label>※문제내용</label>
								<textarea rows="5px" id="multipleName_3"
									class="form-control multiple">3번 문제내용
								</textarea>
							</div>
							<div class="col-lg-1"></div>
						</div>
						<label>※문제보기</label>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_3" type="text"
								placeholder="문제보기 1"> 
							</div>
							<div class="col-lg-1"></div>
						</div>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_3" type="text"
								placeholder="문제보기 2"> 
							</div>
							<div class="col-lg-1"></div>
						</div> 
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_3" type="text"
								placeholder="문제보기 3"> 
							</div>
							<div class="col-lg-1"></div>
						</div>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_3" type="text"
								placeholder="문제보기 4">
							</div>
							<div class="col-lg-1"></div>
						</div> 
						<label>※정답</label>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-3"></div>
							<div class="col-lg-6">
								<select id="multipleAnswer_3" class="form-select color-dropdown"
									name="">
									<option value="">정답을 선택해주세요.</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								</select>
							</div>
							<div class="col-lg-3"></div>
						</div>
					</div>
				</div>
				<div class="card mb-4 text-center">
					<h3 class="card-header">객관식 문제 4번</h3>
					<div class="mt-2 mb-3">
						<div class="row">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<label>※문제내용</label>
								<textarea rows="5px" id="multipleName_4"
									class="form-control multiple">4번 문제내용
								</textarea>
							</div>
							<div class="col-lg-1"></div>
						</div>
						<label>※문제보기</label>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_4" type="text"
								placeholder="문제보기 1"> 
							</div>
							<div class="col-lg-1"></div>
						</div>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_4" type="text"
								placeholder="문제보기 2"> 
							</div>
							<div class="col-lg-1"></div>
						</div> 
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_4" type="text"
								placeholder="문제보기 3"> 
							</div>
							<div class="col-lg-1"></div>
						</div>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_4" type="text"
								placeholder="문제보기 4">
							</div>
							<div class="col-lg-1"></div>
						</div> 
						<label>※정답</label>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-3"></div>
							<div class="col-lg-6">
								<select id="multipleAnswer_4" class="form-select color-dropdown"
									name="">
									<option value="">정답을 선택해주세요.</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								</select>
							</div>
							<div class="col-lg-3"></div>
						</div>
					</div>
				</div>
				<div class="card mb-4 text-center">
					<h3 class="card-header">객관식 문제 5번</h3>
					<div class="mt-2 mb-3">
						<div class="row">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<label>※문제내용</label>
								<textarea rows="5px" id="multipleName_5"
									class="form-control multiple">5번 문제내용
								</textarea>
							</div>
							<div class="col-lg-1"></div>
						</div>
						<label>※문제보기</label>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_5" type="text"
								placeholder="문제보기 1"> 
							</div>
							<div class="col-lg-1"></div>
						</div>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_5" type="text"
								placeholder="문제보기 2"> 
							</div>
							<div class="col-lg-1"></div>
						</div> 
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_5" type="text"
								placeholder="문제보기 3"> 
							</div>
							<div class="col-lg-1"></div>
						</div>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<input class="form-control multipleExam_5" type="text"
								placeholder="문제보기 4">
							</div>
							<div class="col-lg-1"></div>
						</div> 
						<label>※정답</label>
						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-3"></div>
							<div class="col-lg-6">
								<select id="multipleAnswer_5" class="form-select color-dropdown"
									name="">
									<option value="">정답을 선택해주세요.</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								</select>
							</div>
							<div class="col-lg-3"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="text-center">
			<a href="javascript:multipleClick();" class="btn btn-primary">객관식문제제출</a>
			<a href="javascript:history.back()" class="btn btn-primary">뒤로가기</a>
		</div>
	</form>
</div>
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>

<script>
	function multipleClick() {
		var multipleArray = new Array(); //객관식 문제 배열
		// 문제 수 만큼 반복
		$('.multiple')
				.each(
						function(index) {
							var jsonObj = new Object(); //객관식 문제 배열 object
							var examContentArray = new Array(); //객관식 보기 배열
							var multipleNo = index + 1; //문제번호 세팅
							var answerVal = $('#multipleAnswer_' + multipleNo)
									.val(); //문제별 정답가져오기

							jsonObj.multipleNo = multipleNo;
							jsonObj.multipleContent = $(this).val();
							jsonObj.answer = answerVal;
							jsonObj.examNo = $('#examNo').val();

							multipleArray.push(jsonObj); //문제번호,내용,정답별로 배열에 세팅(5문제)
							//2중 for (문제별로 4개씩 반복)
							$('.multipleExam_' + multipleNo).each(
									function(index, item) {
										var examContent = {}; //json key 동적 세팅위해 배열선언
										var idx = index + 1;

										//key 값 동적 셋팅 보기1, 보기2, 보기3, 보기4
										var examContentKeyName = 'examContent'
												+ idx;
										examContent[examContentKeyName] = $(
												this).val();

										examContentArray.push(examContent); //보기에 배열세팅
									});
							//문자배열에 보기배열에담긴 번호별로 보기 1,2,3,4 셋팅
							multipleArray[index].examContent1 = examContentArray[0].examContent1;
							multipleArray[index].examContent2 = examContentArray[1].examContent2;
							multipleArray[index].examContent3 = examContentArray[2].examContent3;
							multipleArray[index].examContent4 = examContentArray[3].examContent4;

						});
		var jsonData = {
			'data' : multipleArray
		}
		console.log(jsonData)

		if (confirm("등록하시겠습니까?")) {
			$
					.ajax({
						type : 'POST',
						url : '/LMS/exam/multipleAdd',
						contentType : "application/json; charset=utf-8",
						data : JSON.stringify(jsonData),
						dataType : 'json',
						success : function(data) {
							console.log(data);
						},
						error : function(error) {
							if (error.responseText == "SUCCESS") {
								alert("등록에 성공하였습니다.");
								location.href = "/LMS/exam/professorAddExamSubjective?examNo="
										+ $('#examNo').val();
							} else {
								alert("등록에 실패하였습니다.");
							}

						}
					});
		}
	}
</script>