package com.gd.LMS.vo;

import lombok.Data;

@Data
public class Employee {
	
	private String memberId;		//회원아이디
	private int employeeCode;		//관리자코드
	private int authority;			//관리자권한(Level)
	private String employeeState;	//관리자상태(재직,휴직,퇴사)
	

}
