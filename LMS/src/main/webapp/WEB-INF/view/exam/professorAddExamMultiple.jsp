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

<h4 class="card-header">"이름"님/"강의명"/ 시험문제 추가</h4>
<h4>시험지번호 :${examSheet.examNo}번</h4>
<input type="hidden" id="examNo" value="${examSheet.examNo}">
<h4>시험이름 :${examSheet.examName}</h4>
<body>
<form>
	<div class="container-xxl flex-grow-1 container-p-y">
		<hr>

		<div class="col-xl-6">

			<div class="card mb-4">
				<h3 class="card-header">객관식 문제 1번</h3>
				<div class="mt-2 mb-3">
					<label>※문제내용</label> 
					<input id="multipleName_1" class="form-control multiple" type="text" 
						style="width: 200px" placeholder="1번 문제내용"> 
					<label>※문제보기</label> 
						<input	class="form-control multipleExam_1" type="text" style="width: 200px" placeholder="문제보기 1"> 
						<input	class="form-control multipleExam_1" type="text" style="width: 200px" placeholder="문제보기 2"> 
						<input	class="form-control multipleExam_1" type="text" style="width: 200px" placeholder="문제보기 3"> 
						<input	class="form-control multipleExam_1" type="text" style="width: 200px" placeholder="문제보기 4"> 
					<label>※정답</label>
					<select id="multipleAnswer_1" class="form-select color-dropdown" style="width: 250px" name="">
						<option value="">정답을 선택해주세요.</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select>
				</div>
			</div>
			<div class="card mb-4">
				<h3 class="card-header">객관식 문제 2번</h3>
				<div class="mt-2 mb-3">
					<label>※문제내용</label> 
					<input id="multipleName_2" class="form-control multiple" type="text" style="width: 200px" placeholder="2번 문제내용"> 
					<label>※문제보기</label> 
						<input	class="form-control multipleExam_2" type="text" style="width: 200px" placeholder="문제보기 1"> 
						<input	class="form-control multipleExam_2" type="text" style="width: 200px" placeholder="문제보기 2"> 
						<input	class="form-control multipleExam_2" type="text" style="width: 200px" placeholder="문제보기 3"> 
						<input	class="form-control multipleExam_2" type="text" style="width: 200px" placeholder="문제보기 4"> 
					<label>※정답</label>
					<select id="multipleAnswer_2" class="form-select color-dropdown" style="width: 250px" name="">
						<option value="">정답을 선택해주세요.</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select>
				</div>
			</div>
			<div class="card mb-4">
				<h3 class="card-header">객관식 문제 3번</h3>
				<div class="mt-2 mb-3">
					<label>※문제내용</label> 
					<input id="multipleName_3" class="form-control multiple" type="text" style="width: 200px" placeholder="3번 문제내용"> 
					<label>※문제보기</label> 
						<input	class="form-control multipleExam_3" type="text" style="width: 200px" placeholder="문제보기 1"> 
						<input	class="form-control multipleExam_3" type="text" style="width: 200px" placeholder="문제보기 2"> 
						<input	class="form-control multipleExam_3" type="text" style="width: 200px" placeholder="문제보기 3"> 
						<input	class="form-control multipleExam_3" type="text" style="width: 200px" placeholder="문제보기 4"> 
					<label>※정답</label>
					<select id="multipleAnswer_3" class="form-select color-dropdown" style="width: 250px" name="">
						<option value="">정답을 선택해주세요.</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select>
				</div>
			</div>
			<div class="card mb-4">
				<h3 class="card-header">객관식 문제 4번</h3>
				<div class="mt-2 mb-3">
					<label>※문제내용</label> 
					<input id="multipleName_4" class="form-control multiple" type="text" style="width: 200px" placeholder="4번 문제내용"> 
					<label>※문제보기</label> 
						<input	class="form-control multipleExam_4" type="text" style="width: 200px" placeholder="문제보기 1"> 
						<input	class="form-control multipleExam_4" type="text" style="width: 200px" placeholder="문제보기 2"> 
						<input	class="form-control multipleExam_4" type="text" style="width: 200px" placeholder="문제보기 3"> 
						<input	class="form-control multipleExam_4" type="text" style="width: 200px" placeholder="문제보기 4"> 
					<label>※정답</label>
					<select id="multipleAnswer_4" class="form-select color-dropdown" style="width: 250px" name="">
						<option value="">정답을 선택해주세요.</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select>
				</div>
			</div>
			<div class="card mb-4">
				<h3 class="card-header">객관식 문제 5번</h3>
				<div class="mt-2 mb-3">
					<label>※문제내용</label> 
					<input id="multipleName_5" class="form-control multiple" type="text" style="width: 200px" placeholder="5번 문제내용"> 
					<label>※문제보기</label> 
						<input	class="form-control multipleExam_5" type="text" style="width: 200px" placeholder="문제보기 1"> 
						<input	class="form-control multipleExam_5" type="text" style="width: 200px" placeholder="문제보기 2"> 
						<input	class="form-control multipleExam_5" type="text" style="width: 200px" placeholder="문제보기 3"> 
						<input	class="form-control multipleExam_5" type="text" style="width: 200px" placeholder="문제보기 4"> 
					<label>※정답</label>
					<select id="multipleAnswer_5" class="form-select color-dropdown" style="width: 250px" name="">
						<option value="">정답을 선택해주세요.</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select>
				</div>
			</div>


		</div>
	</div>


		<a href="javascript:multipleClick();"class="btn btn-primary" >객관식문제제출</a>
		<a	href="javascript:history.back()" class="btn btn-primary">뒤로가기</a>

	<hr>
</form>
</body>
<c:import url="/WEB-INF/view/include/footer.jsp"></c:import>

<script>

function multipleClick(){
	var multipleArray = new Array(); //객관식 문제 배열
	// 문제 수 만큼 반복
	$('.multiple').each(function(index){
		var jsonObj = new Object();  //객관식 문제 배열 object
		var examContentArray = new Array(); //객관식 보기 배열
		var multipleNo = index+1; //문제번호 세팅
		var answerVal = $('#multipleAnswer_'+multipleNo).val(); //문제별 정답가져오기
		
		jsonObj.multipleNo = multipleNo;
		jsonObj.multipleContent = $(this).val();
		jsonObj.answer = answerVal;
		jsonObj.examNo = $('#examNo').val();

		
		multipleArray.push(jsonObj); //문제번호,내용,정답별로 배열에 세팅(5문제)
		//2중 for (문제별로 4개씩 반복)
		$('.multipleExam_'+multipleNo).each(function(index,item){
			var examContent = {}; //json key 동적 세팅위해 배열선언
			var idx = index+1;
			
			//key 값 동적 셋팅 보기1, 보기2, 보기3, 보기4
			var examContentKeyName ='examContent'+idx;
			examContent[examContentKeyName] = $(this).val();
			
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
	   	$.ajax({
			type:'POST',
			url: '/LMS/exam/multipleAdd',
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(jsonData),
			dataType: 'json',
			success: function(data){
				console.log(data);
			},error: function(error){
				if(error.responseText == "SUCCESS"){
					alert("등록에 성공하였습니다.");
					location.href= "/LMS/exam/professorAddExamSubjective?examNo="+$('#examNo').val();
				}else{
					alert("등록에 실패하였습니다.");
				}
				
			}
		});  
 	}
}

</script>