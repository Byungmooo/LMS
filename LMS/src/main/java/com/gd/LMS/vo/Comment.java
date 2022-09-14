package com.gd.LMS.vo;

import lombok.Data;

@Data
public class Comment {
	
	private int commentNo;
	private int noticeNo;
	private String memberId;
	private String commentContent;
	private String createDate;
	private String updateDate;
	

}
