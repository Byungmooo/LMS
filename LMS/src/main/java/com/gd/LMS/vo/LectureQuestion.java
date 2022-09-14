package com.gd.LMS.vo;

import lombok.Data;

@Data
public class LectureQuestion {
	
	private int lecQuestionNo;
	private int studentLecNo;
	private String questionTitle;
	private String questionContent;
	private String answerY;
	private String createDate;
	private String updateDate;

}
