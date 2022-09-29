<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 올린과제 확인하고 파일 다운받고 점수 매기는 폼 -->

studentLecNo
제목
내용
올린날짜

파일다운 	
<form action="${pageContext.request.contextPath}/assignmentScore?fileName=${assignmentReg.fileName}">${assigmentReg.origibName}</form><br>

