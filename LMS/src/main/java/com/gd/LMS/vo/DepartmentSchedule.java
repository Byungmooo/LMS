package com.gd.LMS.vo;

import lombok.Data;

@Data
public class DepartmentSchedule {
	
	private int depScheduleNo;			//학과스케줄번호
	private String departmentCode;		//학과코드
	private String depScheduleContent;	//학과스케줄내용
	private String depScheduleDate;		//학과스케줄날짜
	private String createDate;			//생성일
	private String updateDate;			//수정일
		

}
