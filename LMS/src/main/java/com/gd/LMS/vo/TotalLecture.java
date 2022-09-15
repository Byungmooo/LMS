 package com.gd.LMS.vo;

import lombok.Data;

@Data
public class TotalLecture {
	private int lectureCode;		//강의코드
	private String departmentCode;	//부서코드(학과코드)
	private int employeeCode;		//관리자번호(사번)
	private String lectureName;		//강의이름
	private String lectureType;		//강의종류
	private String gradeType;		//학점종류
	private String practiceY;		//실습여부
	private int credit;				//이수학점
	private String createDate;		//생성일
	private String updateDate;		//수정일
	
	
	

}
