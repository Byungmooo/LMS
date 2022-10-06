package com.gd.LMS.vo;

import lombok.Data;

@Data
public class Member { //회원  
	
	private String memberId;		//회원아이디
	private String memberPw;		//회원비밀번호
	private String memberName;		//회원이름	
	private String memberGender;	//성별
	private String memberType;		//회원종류(학생,교수,직원)
	private String memberBirth;		//생년월일
	private String memberEmail;		//이메일
	private String memberAddress;	//주소
	private String memberContact;	//연락처
	private String tempDep;         //임시부서
	private String active;			//계정활성화상태
	private String lastLogin;		//마지막접속일
	private String createDate;		//생성일
	private String updateDate;		//수정일
	

}
