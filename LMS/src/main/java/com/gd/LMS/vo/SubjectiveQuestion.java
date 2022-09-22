package com.gd.LMS.vo;


import lombok.Data;


@Data
public class SubjectiveQuestion {
	
	private int openedLecNo;			//열린수강번호
	private int subjectiveNo;			//주관식번호
	private String subjectiveContent;	//주관식내용
	private String subjectiveAnswer;	//주관식답안
	private int questionPoint;			//문제배점
	private String createDate;			//생성일
	private String updateDate;			//수정일
	
	

}
