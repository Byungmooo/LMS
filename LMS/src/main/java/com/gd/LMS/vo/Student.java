package com.gd.LMS.vo;


import lombok.Data;

@Data
public class Student {
	
	private String memberId;		//회원아이디	
	private int studentCode;		//학번
	private String departmentCode;	//부서코드(학과코드)
	private String studentYear;		//학년
	private String studentState;	//학생상태(재학,휴학,자퇴)

}
