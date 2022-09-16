package com.gd.LMS.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.Member;

@Mapper
public interface LoginMapper {
	
	//로그인에 사용하는 메소드
	Member selectLogin(Member member);


	
	
}
