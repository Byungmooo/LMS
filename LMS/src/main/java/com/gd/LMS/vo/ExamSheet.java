package com.gd.LMS.vo;

import lombok.Data;

@Data
public class ExamSheet {
	
	private int examNo;			//예제번호	
	private int multipleNo;		//
	private int subjectiveNo;	//과제번호
	private int questionNum;	//문제번호
	private int questionPoint;	//문제배점
	private String createDate;	//생성일
	private String updateDate;	//수정일
}
