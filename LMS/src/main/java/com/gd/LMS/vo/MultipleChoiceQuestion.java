package com.gd.LMS.vo;

import lombok.Data;

@Data
public class MultipleChoiceQuestion { 
	
	private int multipleNo; 		//객관식문제번호
	private int openedLecNo;		//열린강의번호
	private String multipleContent;	//객관식문제내용
	private int multipleAnswer;		//객관식문제답안
	private String createDate;		//등록일
	private String updateDate;		//수정일
	

}
