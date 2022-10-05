package com.gd.LMS.vo;

import lombok.Data;

@Data
public class ExamSheet { //시험지
	
	private int examNo;			//예제번호	
	private int openedLecNo;	//강의번호
	private String examName;	//문제이름
	private String createDate;	//생성일
	private String updateDate;	//수정일
}
 