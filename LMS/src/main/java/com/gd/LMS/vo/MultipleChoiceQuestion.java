package com.gd.LMS.vo;

import lombok.Data;

@Data
public class MultipleChoiceQuestion {  
	
	private int openedLecNo;		//열린강의번호
	private int examNo;				//시험지번호
	private String multipleNo; 		//객관식문제번호(ENUM)
	private String multipleContent;	//객관식문제내용
	private String multipleAnswer;	//객관식문제답안(ENUM)
	private int questionPoint;		//문제배점
	private String createDate;		//등록일
	private String updateDate;		//수정일
	

}
