package com.gd.LMS.member.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.Member;

@Mapper
public interface MemberMapper {
	Member selectMember(Member member);
	String selectMemberIdCheck(String checkId);
	int insertMember(Member paramMember);
	
	//로그인에 사용하는 메소드
	Member selectLogin(Member member);
}
