package com.gd.LMS.vo;

import lombok.Data;

@Data
public class Attendance { //출석
	private int attendanceNo; 		//출석번호
	private int studentLecNo;		//수강번호
	private String attendanceDate;	//강의시간번호
	private String attendanceState; //총출석일
	private int attendanceScore;	//출석점수
	private String createDate;		//생성날짜
	private String updateDate;		//수정날짜
}
 