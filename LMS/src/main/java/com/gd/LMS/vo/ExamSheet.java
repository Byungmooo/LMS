package com.gd.LMS.vo;

import lombok.Data;

@Data
public class ExamSheet { //시험지
	
	private int examNo;			//예제번호	
	private int multipleNo;		//객관식번호
	private int subjectiveNo;	//주관식번호
	private int questionNum;	//문제번호
	private int questionPoint;	//문제배점
	private String createDate;	//생성일
	private String updateDate;	//수정일
}
 