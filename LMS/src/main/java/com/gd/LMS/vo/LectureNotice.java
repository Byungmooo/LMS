package com.gd.LMS.vo;

import lombok.Data;

@Data
public class LectureNotice {
	
	private int lecNoticeNo;			//학부게시판번호
	private int openedLecNo;			//일반게시판번호
	private int view;					//조회수
	private String lectNoticeTitle;		//학부게시판제목
	private String lectNoticeContent;	//학부게시판내용
	private String createDate;			//생성일
	private String updateDate;			//수정일
	
	
}
