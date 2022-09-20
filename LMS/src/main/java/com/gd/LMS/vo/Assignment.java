package com.gd.LMS.vo;

import lombok.Data;

@Data
public class Assignment { //과제
	private int assignmentNo; 	      //과제번호
	private int openedLecNo;	      //강의번호
	private String assignmentTitle;   //과제제목
	private String assignmentContent; //과제내용
	private String endDate;           //마감기한
	private String createDate;	      //등록일
	private String updateDate;   	  //수정일 
}
