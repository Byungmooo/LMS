<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/include/studentHeader.jsp"%>	
	<div class= "container">
		<div class="col-10">
			<h3>강의 공지 상세보기</h3>
			<table class="table table-bordered">
					<tr>
						<th>공지번호</th>
						<td>${lectureNotice.lecNoticeNo}</td>
					</tr>
					<tr>
						<th>강의번호</th>
						<td>${lectureNotice.openedLecNo}</td>
					</tr>
					<tr>
						<th>공지제목</th>
						<td>${lectureNotice.lecNoticeTitle}</td>
					</tr>
					<tr>
						<th>공지내용</th>
						<td>${lectureNotice.lecNoticeContent}</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td>${lectureNotice.createDate}</td>
					</tr>
					<tr>
						<th>수정일</th>
						<td>${lectureNotice.updateDate}</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${lectureNotice.view}</td>
					</tr>
					
				</table>
				<div>				
					<a href="${pageContext.request.contextPath}/modifyLecNoticeOne?lecNoticeNo=${lectureNotice.lecNoticeNo}"
							class="btn btn-warning">수정</a>
					<a href="${pageContext.request.contextPath}/removeLecNotice?lecNoticeNo=${lectureNotice.lecNoticeNo}"
							class="btn btn-info">삭제</a>
				
				</div>
			</div>
		</div>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>    