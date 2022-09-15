package com.gd.LMS.vo;

import lombok.Data;

@Data
public class Employee {
	
	private String memberId;		//회원아이디
	private int employeeCode;		//직원번호
	private int authority;			//직원권한(Level)
	private String employeeState;	//직원상태(재직,휴직,퇴사)
	

}
 