package com.gd.LMS.vo;

import lombok.Data;

@Data
public class Attendance { //출석
	private int attendanceNo; 		//출석번호
	private int studentLecNo;		//수강번호
	private int lecTimeNo;			//강의시간번호
	private int	totalAbsent;		//총출석일
	private String	attendance;		//출결상황 '지각','조퇴','결석'
	private int attendanceScore;	//출석점수
	private String createDate;		//생성날짜
	private String updateDate;		//수정날짜
}
 