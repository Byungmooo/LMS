package com.gd.LMS.vo;

import lombok.Data;

@Data
public class LectureNotice {
	
	private int lecNoticeNo;
	private int openedLecNo;
	private int view;
	private String lectNoticeTitle;
	private String lectNoticeContent;
	private String createDate;
	private String updateDate;
	
	
}
