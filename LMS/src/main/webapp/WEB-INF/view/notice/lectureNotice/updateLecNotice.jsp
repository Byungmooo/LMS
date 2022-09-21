<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/include/studentHeader.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>		
	
	<div class= "container">
		<h3>강의 공지 수정</h3>
			<div class="col-sm-10">
				<form action="${pageContext.request.contextPath}/modifyLecNoticeOne" 
					  method="post" id="modifyForm">
					<div class="form-group">		
						<label for="lecNoticeNo">공지번호</label>
						<input type="text" name="lecNoticeNo" value="${lectureNotice.lecNoticeNo}" readonly>
					</div>
					<div class="form-group">		
						<label for="openedLecNo">강의번호</label>
						<input type="text" name="openedLecNo" value="${lectureNotice.openedLecNo}" readonly>
					</div>
					<div class="form-group">		
						<label for="lecNoticeTitle">강의공지 제목</label>
						<input type="text" name="lecNoticeTitle" value="${lectureNotice.lecNoticeTitle}" class="form-control">
					</div>
					<div class="form-group">		
						<label for="lecNoticeContent">강의공지 내용</label>
						<textarea id="lecNoticeContent" class="form-control autosize" style="min-height: 200px; resize: none;" cols="100px"
							name="lecNoticeContent" placeholder="내용을 입력하세요.">${lectureNotice.lecNoticeContent}</textarea>
					</div>
			
					<div style="margin-bottom: 20px; position: relative; left: 350px;">
						<button type="button" class="btn btn-primary" id = "modifyBtn">수정</button>
						<a href="${pageContext.request.contextPath}/lecNoticeOne?lecNoticeNo=${lectureNotice.lecNoticeNo}" class="btn btn-dank">취소</a>	
					</div>
				</form>
			</div>
		</div>
		
<script>

$('#modifyBtn').click(function() {
	if($('#lecNoticeTitle').val() == '') {
		alert('제목을 입력해주세요');
		$("#lecNoticeTitle").focus();
	} else if($('#lecNoticeContent').val() == '') {
		alert('내용을 입력해주세요');
		$("#lecNoticeContent").focus();
	} else {
		modifyForm.submit();
	}
});
  
</script>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>   