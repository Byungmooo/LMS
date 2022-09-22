package com.gd.LMS.vo;

import lombok.Data;

@Data
public class ExamSheet { //시험지
	
	private int examNo;			//시험지번호
	private String examName;	//시험지이름
	private String createDate;	//생성일
	private String updateDate;	//수정일
}
 