package com.gd.LMS.vo;

import lombok.Data;

@Data
public class LectureNotice { //강의공지 
	
	private int lecNoticeNo;			//강의공지번호
	private int openedLecNo;			//강의번호
	private String lecNoticeTitle;		//강의공지제목
	private String lecNoticeContent;	//강의공지내용
	private String writer;			    //작성자
	private int views;					//조회수
	private String createDate;			//생성일
	private String updateDate;			//수정일
	
	
}
