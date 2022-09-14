package com.gd.LMS.vo;

import lombok.Data;

@Data
public class ExamSheet {
	
	private int examNo;
	private int multipleNo;
	private int subjectiveNo;
	private int questionNum;
	private int questionPoint;
	private String createDate;
	private String updateDate;
}
