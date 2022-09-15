package com.gd.LMS.vo;

import lombok.Data;

@Data
public class LectureTime { //강의시간
	
	private int lecTimeNo;		//강의시간번호
	private int openedLecNo;	//열린강의번호
	private String lectureDay;	//강의날짜
	private String lectureClass;//강의실
	private String createDate;	//생성일
	private String updateDate;	//수정일
	

} 
