<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/include/studentHeader.jsp"%>		

	<!-- Main -->
		<div class="container">	 
			<h1>강의공지 작성</h1>
		
		<form action="${pageContext.request.contextPath}/addLecNoticeOne" method="post" id="addForm" >
			
				<div class="form-group">		
					<label for="openedLecNo">강의번호</label>
					<input type="text" name="openedLecNo" class="form-control" placeholder="강의번호를 입력하세요">
				</div>
				<div class="form-group">		
					<label for="lecNoticeTitle">강의공지 제목</label>
					<input type="text" name="lecNoticeTitle" class="form-control" placeholder="제목을 입력해주세요">
				</div>
				<div class="form-group">		
					<label for="lecNoticeContent">강의공지 내용</label>
					<input name="lecNoticeContent" class="form-control" placeholder="내용을 입력해주세요">
				</div>
			
				
			<div style="margin-bottom: 20px; position: relative; left: 350px;">
				<button type="submit" id="addBtn" class="btn btn-info">등록</button>
				<a href="${pageContext.request.contextPath}/lecNoticeList" class="btn btn-danger">취소</a>
			</div>
		</form>
	</div>

		
<script>

$('#addBtn').click(function() {
	if($('#lecNoticeTitle').val() == '') {
		alert('제목을 입력해주세요');
		$("#lecNoticeTitle").focus();
	} else if($('#lecNoticeContent').val() == '') {
		alert('내용을 입력해주세요');
		$("#lecNoticeContent").focus();
	} else {
		addForm.submit();
	}
});
  
</script>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>    

		
