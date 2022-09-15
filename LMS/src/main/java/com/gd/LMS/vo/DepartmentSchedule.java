package com.gd.LMS.vo;

import lombok.Data;

@Data
public class DepartmentSchedule { //학부일정
	
	private int depScheduleNo;			//학부일정번호
	private String departmentCode;		//학부코드
	private String depScheduleContent;	//학과일정내용
	private String depScheduleDate;		//학부일정날짜
	private String createDate;			//등록일
	private String updateDate;			//수정일
		

}
 