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
				<h3>
					<strong>시험문제 추가</strong>
				</h3>
			</div>
			<div class="card-body">
				<span>시험지번호 :${examSheet.examNo}번</span><br> <span>시험이름
					:${examSheet.examName}</span><br> <input type="hidden" name="examNo"
					id="examNo" value="${examSheet.examNo}">
			</div>
		</div>
	</div>

	<form id="subjectForm">
		<input type="hidden" name="index" value="5">
		<div class="container-xxl flex-grow-1 container-p-y">
			<div class="col-xl-6">
				<div class="card mb-4 text-center">
					<h3 class="card-header">주관식 문제 1번</h3>
					<div class="mt-2 mb-3">
						<div class="row">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<label>※문제내용</label>
								<textarea rows="5px"class="form-control subject"
									name="subject_content1"></textarea>
								<label>※문제정답</label>
								<textarea rows="5px" class="form-control"
									name="subject_answer1" class="subject"></textarea>
							</div>
							<div class="col-lg-1"></div>
						</div>
					</div>
				</div>
				<div class="card mb-4 text-center">
					<h3 class="card-header">주관식 문제 2번</h3>
					<div class="mt-2 mb-3">
						<div class="row">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<label>※문제내용</label>
								<textarea rows="5px"class="form-control subject"
									name="subject_content2"></textarea>
								<label>※문제정답</label>
								<textarea rows="5px" class="form-control"
									name="subject_answer2" class="subject"></textarea>
							</div>
							<div class="col-lg-1"></div>
						</div>
					</div>
				</div>
				<div class="card mb-4 text-center">
					<h3 class="card-header">주관식 문제 3번</h3>
					<div class="mt-2 mb-3">
						<div class="row">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<label>※문제내용</label>
								<textarea rows="5px"class="form-control subject"
									name="subject_content3"></textarea>
								<label>※문제정답</label>
								<textarea rows="5px" class="form-control"
									name="subject_answer3" class="subject"></textarea>
							</div>
							<div class="col-lg-1"></div>
						</div>
					</div>
				</div>
				<div class="card mb-4 text-center">
					<h3 class="card-header">주관식 문제 4번</h3>
					<div class="mt-2 mb-3">
						<div class="row">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<label>※문제내용</label>
								<textarea rows="5px"class="form-control subject"
									name="subject_content4"></textarea>
								<label>※문제정답</label>
								<textarea rows="5px" class="form-control"
									name="subject_answer4" class="subject"></textarea>
							</div>
							<div class="col-lg-1"></div>
						</div>
					</div>
				</div>
				<div class="card mb-4 text-center">
					<h3 class="card-header">주관식 문제 5번</h3>
					<div class="mt-2 mb-3">
						<div class="row">
							<div class="col-lg-1"></div>
							<div class="col-lg-10">
								<label>※문제내용</label>
								<textarea rows="5px"class="form-control subject"
									name="subject_content5"></textarea>
								<label>※문제정답</label>
								<textarea rows="5px" class="form-control"
									name="subject_answer5" class="subject"></textarea>
							</div>
							<div class="col-lg-1"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="text-center">
				<a href="javascript:subjectRegist();" class="btn btn-primary">"시험명"
					제출 완료하기</a> <a href="javascript:history.back()" class="btn btn-primary">뒤로가기</a>
			</div>
			<hr>
		</div>
	</form>
</div>
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>
<script>
	function subjectRegist() {
		dataCheck();

		var jsonData = {
			examNo : $('input[name=examNo]').val(),
			index : $('input[name=index]').val(),
			subject_content1 : $('textarea[name=subject_content1]').val(),
			subject_answer1 : $('textarea[name=subject_answer1]').val(),
			subject_content2 : $('textarea[name=subject_content2]').val(),
			subject_answer2 : $('textarea[name=subject_answer2]').val(),
			subject_content3 : $('textarea[name=subject_content3]').val(),
			subject_answer3 : $('textarea[name=subject_answer3]').val(),
			subject_content4 : $('textarea[name=subject_content4]').val(),
			subject_answer4 : $('textarea[name=subject_answer4]').val(),
			subject_content5 : $('textarea[name=subject_content5]').val(),
			subject_answer5 : $('textarea[name=subject_answer5]').val()
		}

		if (confirm("수정하시겠습니까?")) {
			$.ajax({
				url : '/LMS/exam/insertSubjective',
				type : 'POST',
				data : JSON.stringify(jsonData),
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					if (data.result == "SUCCESS") {
						alert('수정에 성공하였습니다.');
						location.href = "/LMS/exam/professorExList";
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

	function dataCheck() {
		$('.subject').each(function() {
			var inputVal = $(this).val();
			if (inputVal == "") {
				alert("내용이 누락되었습니다.")
				$(this).focus();
				return false;
			}
		});

	}
</script>