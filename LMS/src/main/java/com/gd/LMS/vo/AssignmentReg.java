package com.gd.LMS.vo;

import lombok.Data;

@Data
public class AssignmentReg {
	private int assignmentRegNo;		//과제제출번호
	private int studentLecNo; 			//학생강의번호
	private int assignmentNo;			//과제번호
	private String assignmentTitle;		//과제이름
	private String assignmentContent;	//과제내용
	private int assignmentScore;		//과제점수
	private String createDate;			//생성날짜
	private String updateDate;			//수정날짜
	
}
