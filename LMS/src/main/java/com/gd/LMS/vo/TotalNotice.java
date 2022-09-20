package com.gd.LMS.vo;

import lombok.Data;


@Data
public class TotalNotice {
	private int noticeNo;			//게시판번호
	private String departmentCode;	//부서코드(학부코드)
	private String noticeTitle;		//게시판제목
	private String noticeContent;	//게시판내용
	private String writer;			//작성자
	private int views;				//조회수
	private String createDate;		//생성일
	private String updateDate;		//수정일
	
	
	
	
}
