package com.gd.LMS.vo;

import lombok.Data;

@Data
public class OpenedLecture { 
	private int openedLecNo;		 //열린수강번호
	private int professorCode;		 //교수번호
	private int lectureCode;		 //강의코드
	private int classroomNo;		 //강의실
	private int studentNum;			 //학번
	private String syllabus;         //강의계획서
	private String openLectureDate;	 //개강일
	private String closeLectureDate; //종강일
	private String createDate;		 //생성일
	private String updateDate;		 //수정일
}
