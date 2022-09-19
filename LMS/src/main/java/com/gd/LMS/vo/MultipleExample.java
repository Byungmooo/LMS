package com.gd.LMS.vo;

import lombok.Data;

@Data
public class MultipleExample { 

	private int exampleNo;			//문제번호
	private int multipleNo;			//객관식번호
	private int example;			//문제
	private String exampleContent;	//문제내용
	private String createDate;		//생성일
	private String updateDate;		//수정일
	
}
 
