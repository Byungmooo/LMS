package com.gd.LMS.vo;

import lombok.Data;

@Data
public class GradeProccess { //성적처리
	
	private int studentLecNo;		//학생수강번호
	private String gradeResult;		//성적결과
	private String proccessDate;	//평가날짜
	private String endDate;			//마감기한
	private String createDate;		//등록일
	private String updateDate;		//수정일

}
 