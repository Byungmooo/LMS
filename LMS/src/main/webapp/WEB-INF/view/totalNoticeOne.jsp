<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/view/include/studentHeader.jsp"%>

<fmt:parseDate value="${totalNotice.createDate}" pattern="yyyy-MM-dd HH:mm" var="createDate"/>
<fmt:parseDate value="${totalNotice.updateDate}" pattern="yyyy-MM-dd HH:mm" var="updateDate"/>
	<div class= "container">
		<div class="col-10">
			<h3>강의 공지 상세보기</h3>
			<table class="table table-bordered">
					<tr>
						<th>공지번호</th>
						<td>${totalNotice.noticeNo}</td>
					</tr>
					<tr>
						<th>공지제목</th>
						<td>${totalNotice.noticeTitle}</td>
					</tr>
					<tr>
						<th>공지내용</th>
						<td>${totalNotice.noticeContent}</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td>
							<fmt:parseDate value="${totalNotice.createDate}" pattern="yyyy-MM-dd HH:mm" var="createDate"/>
							<fmt:formatDate value="${createDate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
						</td>
					</tr>
					<tr>
						<th>수정일</th>
						<td>
							<fmt:parseDate value="${totalNotice.updateDate}" pattern="yyyy-MM-dd HH:mm" var="updateDate"/>
							<fmt:formatDate value="${updateDate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
						</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${totalNotice.view}</td>
					</tr>
					
				</table>
				<div>				
					<a href="${pageContext.request.contextPath}/updateTotalNotice/${totalNotice.noticeNo}"
							class="btn btn-warning">수정</a>
					<a href="${pageContext.request.contextPath}/removeTotalNotice?noticeNo=${totalNotice.noticeNo}"
							class="btn btn-info">삭제</a>
					<a href="javascript:window.history.back()"
							class="btn btn-primary">목록</a>
				</div>
			</div>
		</div>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>    