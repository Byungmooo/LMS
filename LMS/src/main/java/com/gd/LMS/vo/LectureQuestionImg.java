package com.gd.LMS.vo;

import lombok.Data;

@Data
public class LectureQuestionImg {

	
	private int lecQuestionNo;	//강의질문번호
	private String contentType;	//파일유형
	private String originName;	//원본이름
	private String fileName;	//파일이름
}
