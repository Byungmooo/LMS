package com.gd.LMS.vo;

import lombok.Data;

@Data
public class Comment { //댓글
	
	private int commentNo;			//댓글번호
	private int noticeNo;			//공지번호
	private String memberId;		//회원아이디
	private String commentContent;	//댓글내용
	private String createDate;		//등록일
	private String updateDate;		//수정일
	

}
