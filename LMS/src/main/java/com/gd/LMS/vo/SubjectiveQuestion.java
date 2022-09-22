package com.gd.LMS.vo;


import lombok.Data;


@Data
public class SubjectiveQuestion {	//====주관식문제
	
	private int openedLecNo;			//열린수강번호	
	private int examNo;					//시험지번호
	private String subjectiveNo;		//주관식 문제 번호(1~5번)
	private String subjectiveContent;	//주관식 문제 내용
	private String subjectiveAnswer;	//주관식 문제 답안
	private String createDate;			//생성일
	private String updateDate;			//수정일
	
	

}
