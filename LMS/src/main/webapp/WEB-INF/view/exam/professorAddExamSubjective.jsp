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

<h4 class="card-header">"이름"님/"강의명"/시험문제 추가</h4>
	<body>	
		<form id="subjectForm">
			<input type="hidden" name="index" value="5">
			<div class="container-xxl flex-grow-1 container-p-y">
				<hr>
				<div class="col-xl-6">
					<div class="card mb-4">
						<h3 class="card-header">주관식 문제 1번</h3>
						<div class="mt-2 mb-3">
							<label>문제내용</label> <input class="form-control subject" type="text"
								style="width: 400px" placeholder="문제" name="subject_content1"> <label>정답</label>
							<input class="form-control" type="text" style="width: 200px"
								placeholder="정답" name="subject_answer1" class="subject">
						</div>
					</div>
					<div class="card mb-4">
						<h3 class="card-header">주관식 문제 2번</h3>
						<div class="mt-2 mb-3">
							<label>문제내용</label> <input class="form-control subject" type="text"
								style="width: 400px" placeholder="문제" name="subject_content2"> <label>정답</label>
							<input class="form-control" type="text" style="width: 200px"
								placeholder="정답" name="subject_answer2" class="subject">
						</div>
					</div>
					<div class="card mb-4">
						<h3 class="card-header">주관식 문제 3번</h3>
						<div class="mt-2 mb-3">
							<label>문제내용</label> <input class="form-control subject" type="text"
								style="width: 400px" placeholder="문제" name="subject_content3"> <label>정답</label>
							<input class="form-control" type="text" style="width: 200px"
								placeholder="정답" name="subject_answer3" class="subject">
						</div>
					</div>
					<div class="card mb-4">
						<h3 class="card-header">주관식 문제 4번</h3>
						<div class="mt-2 mb-3">
							<label>문제내용</label> <input class="form-control subject" type="text"
								style="width: 400px" placeholder="문제" name="subject_content4"> <label>정답</label>
							<input class="form-control" type="text" style="width: 200px"
								placeholder="정답" name="subject_answer4" class="subject">
						</div>
					</div>
					<div class="card mb-4">
						<h3 class="card-header">주관식 문제 5번</h3>
						<div class="mt-2 mb-3">
							<label>문제내용</label> <input class="form-control subject" type="text"
								style="width: 400px" placeholder="문제" name="subject_content5"> <label>정답</label>
							<input class="form-control" type="text" style="width: 200px"
								placeholder="정답" name="subject_answer5" class="subject">
						</div>
					</div>
				</div>
				<div class="">
		
					<a href="javascript:subjectRegist();" class="btn btn-primary">"시험명" 제출 완료하기</a> <a
						href="javascript:history.back()" class="btn btn-primary">뒤로가기</a>
				</div>
				<hr>
			</div>
		</form>
</body>
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>



<script>
	function subjectRegist(){
		dataCheck();
		
		var jsonData = {
			index : $('input[name=index]').val(),
			subject_content1 : $('input[name=subject_content1]').val(),
			subject_answer1 : $('input[name=subject_answer1]').val(),
			subject_content2 : $('input[name=subject_content2]').val(),
			subject_answer2 : $('input[name=subject_answer2]').val(),
			subject_content3 : $('input[name=subject_content3]').val(),
			subject_answer3 : $('input[name=subject_answer3]').val(),
			subject_content4 : $('input[name=subject_content4]').val(),
			subject_answer4 : $('input[name=subject_answer4]').val(),
			subject_content5 : $('input[name=subject_content5]').val(),
			subject_answer5 : $('input[name=subject_answer5]').val()
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
						location.href="/LMS/exam/professorExList";
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
	
function dataCheck(){
	$('.subject').each(function(){
		var inputVal = $(this).val();
		if(inputVal == ""){
			alert("내용이 누락되었습니다.")
			$(this).focus();
			return false;
		}
	});
	
}
	
</script>