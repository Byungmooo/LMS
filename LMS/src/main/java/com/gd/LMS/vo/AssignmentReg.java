package com.gd.LMS.vo;

import lombok.Data;

@Data
public class AssignmentReg { //과제등록
	private int assignmentRegNo;		//과제제출번호
	private int studentLecNo; 			//수강번호
	private int assignmentNo;			//과제번호
	private String assignmentTitle;		//과제제목
	private String assignmentContent;	//과제내용
	private int assignmentScore;		//과제점수
	private String createDate;			//생성날짜
	private String updateDate;			//수정날짜
	
}
