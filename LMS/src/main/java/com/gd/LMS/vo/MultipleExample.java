package com.gd.LMS.vo;

import lombok.Data;

@Data
public class MultipleExample { 

	private int examNo;				//시험지 번호
	private String multipleNo;		//객관식 문제 번호 (1~5번)
	private String example;			//한 문제에대한 보기(1~4번)
	private String exampleContent;	//보기 1~4번 내용
	private String createDate;		//생성일
	private String updateDate;		//수정일
	
	
}
 
