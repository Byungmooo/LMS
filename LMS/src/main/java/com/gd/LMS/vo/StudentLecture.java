package com.gd.LMS.vo;

import lombok.Data;

@Data
public class StudentLecture {
	private int studentNo;		//학생번호
	private int studentCode;	//학번
	private int openedLecNo;	//수강중인강의 번호
	private int attendanceScore;//출결점수
	private int examScore;		//시험점수
	private int assignmentScore;//과제점수
	private String createDate;	//생성일
	private String updateDate;	//수정일
	
	
	
}
