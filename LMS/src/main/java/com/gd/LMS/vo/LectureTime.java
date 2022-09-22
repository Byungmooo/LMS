package com.gd.LMS.vo;

import lombok.Data;

@Data
public class LectureTime { //강의시간
	
	private int lecTimeNo;		//강의시간번호
	private int openedLecNo;	//열린강의번호
	private int lectureYoil;	//강의요일
	private int lectureStart;   //강의시작시간
	private int lectureEnd;     //강의종료시간
	private String color;
	private String createDate;	//생성일
	private String updateDate;	//수정일
	

} 
