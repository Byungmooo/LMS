package com.gd.LMS.vo;

import lombok.Data;

@Data
public class Assignment {
	private int assignmentNo; 	//과제번호
	private int openedLecNo;	//개설된강의번호
	private String createDate;	//생성날짜
	private String updateDate;	//수정날짜
}
