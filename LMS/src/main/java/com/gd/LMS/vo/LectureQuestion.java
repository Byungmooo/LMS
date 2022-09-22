package com.gd.LMS.vo;

import lombok.Data;

@Data
public class LectureQuestion { //강의답변
	
	private int lecQuestionNo;		//강의질문번호
	private int openedLecNo;		//진행강의번호
	private String noticeTitle;		//질문제목
	private String noticeContent;	//질문내용
	private String writer;          //작성자
	private String answerY;			//답변여부
	private String createDate;		//생성일
	private String updateDate;		//수정일
 
}
