package com.gd.LMS.vo;

import lombok.Data;

@Data
public class AssignmentReg { //과제등록 
	private int assignmentRegNo;		  //과제제출번호
	private int studentLecNo; 			  //수강번호
	private int assignmentNo;			  //과제번호
	private String assignmentRegContent;  //과제내용
	private String assignmentRegDid;      //과제등록유무
	private int assignmentScore;		  //과제점수
	private String createDate;			  //생성날짜
	private String updateDate;			  //수정날짜
	
}
