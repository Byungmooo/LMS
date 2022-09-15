package com.gd.LMS.vo;

import lombok.Data;

@Data
public class LectureAnswer { //강의질문
	
	private int lecQuestionNo;		//강의질문번호
	private String answerContent;	//강의질문내용
	private String createDate;		//생성일
	private String updateDate;		//수정일
	

}
 