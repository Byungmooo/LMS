package com.gd.LMS.vo;


import lombok.Data;


@Data
public class TranDepartmentRec {
	private int tranDepartmentNo;	//전과번호
	private int studentCode;		//학생번호(학번)
	private String tranReason;		//전과사유
	private String approveY;		//승인여부
	private String tranDate;		//전과일자
	private String createDate;		//생성일
	private String updateDate;		//수정일
	
	

}
