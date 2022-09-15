package com.gd.LMS.vo;

import lombok.Data;

@Data
public class GradeProccess {
	
	private int studentLecNo;		//학생수강번호
	private String gradeResult;		//학점결과
	private String proccessDate;	//
	private String endDate;			//종강일
	private String createDate;		//생성일
	private String updateDate;		//수정일

}
