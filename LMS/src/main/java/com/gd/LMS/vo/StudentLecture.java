package com.gd.LMS.vo;

import lombok.Data;

@Data
public class StudentLecture {
	private int studentNo;
	private int studentCode;
	private int openedLecNo;
	private int attendanceScore;
	private int examScore;
	private int assignmentScore;
	private String createDate;
	private String updateDate;
	
	
	
}
