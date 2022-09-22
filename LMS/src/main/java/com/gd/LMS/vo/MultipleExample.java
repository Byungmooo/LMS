package com.gd.LMS.vo;

import lombok.Data;

@Data
public class MultipleExample {  //객관식문제 보기
	
	private int examNo;				//시험지번호
	private int multipleNo;			//객관식문제번호
	private String example;			//보기1~4번(ENUM)
	private String exampleContent;	//보기내용
	private String createDate;		//생성일
	private String updateDate;		//수정일
	
}
 
