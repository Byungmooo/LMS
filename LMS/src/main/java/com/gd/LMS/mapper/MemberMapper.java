package com.gd.LMS.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.Member;

@Mapper
public interface MemberMapper {
	Member selectMember(Member member);
	String selectMemberIdCheck(String checkId);
	int insertMember(Member paramMember);
}
