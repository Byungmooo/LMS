package com.gd.LMS.member.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.Member;

@Mapper
public interface MemberMapper {
	
	// 회원로그인
	Member selectMemberLogin(Member paramMember);
	
	// 회원가입
	int insertMemberRegister(Member paramMember);
	
	// 회원가입 Id 중복체크
	String selectMemberIdCheck(String checkId);
	
	// 회원 최근 접속일 갱신
	int updateMemberLastLogin(String memberId);
	
	// 회원상태 비활성화
	int updateMemberActiveN();
}
