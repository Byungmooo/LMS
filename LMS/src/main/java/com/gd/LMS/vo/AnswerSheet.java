package com.gd.LMS.vo;

import lombok.Data;

@Data
public class AnswerSheet {
	private int answerNo;			//답안번호
	private int studentLecNo;		//학생강의번호
	private int examNo;				//문제번호
	private String answerContent;	//문제내용
	private String answerCorrect;	//정답
	private String createDate;		//생성날짜
	private String updateDate;		//수정날짜
}
