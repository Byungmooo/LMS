package com.gd.LMS.vo;

import lombok.Data;


@Data
public class Professor {
	private String memberId;		//회원아이디
	private int professorCode;		//교수번호
	private String departmentCode;	//부서코드
	private String departmentLeader;//부서장(학과장)
	private String professorState;	//교수상태(재직,휴직,퇴직)
	

}
