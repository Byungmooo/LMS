package com.gd.LMS.vo;

import lombok.Data;

@Data
public class AssignmentRegImg { //과제등록이미지
	private int assignmentRegNo; //과제번호
	private String contentType;  //파일유형
	private String originName;   //기존이름 
	private String fileName;     //파일이름

}
 