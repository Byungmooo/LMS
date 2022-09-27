package com.gd.LMS.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AssignmentRegForm {

	private String memberId;			// 계정 아이디
	private String AssignmentRegTitle;	// 제줄한 과제 제목
	private String AssignmentRegContent;	// 제줄한 과제 내용
	private int opendLecNo;			// education 번호
	private int AssignmentNo;				// AssignmentNo 번호
	private int AssignmentRegNo;				// AssignmentNo 번호
	private String AssignmentRegFilename;	// 제줄한 과제 첨부파일 새 이름
	private String AssignmentRegOriginName;	// 제줄한 과제 첨부파일 기존 이름
	private long AssignmentRegFileSize;		// 제줄한 과제 첨부파일 크기
	private String AssignmentRegFileType; 	// 제줄한 과제 첨부파일 타입
	MultipartFile AssignmentRegFile;
	
	
}
