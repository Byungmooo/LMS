package com.gd.LMS.vo;

import lombok.Data;

@Data
public class OpenedLecture {
	private int openedLecNo;
	private int professorCode;
	private int lectureCode;
	private int classroomNo;
	private int studentNum;
	private String openLectureDate;
	private String closeLectureDate;
	private String createDate;
	private String updateDate;
		
	
}
