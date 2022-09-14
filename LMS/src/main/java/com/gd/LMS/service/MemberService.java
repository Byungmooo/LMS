package com.gd.LMS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.LMS.mapper.MemberMapper;
import com.gd.LMS.vo.Member;

@Service
public class MemberService {
	@Autowired MemberMapper memberMapper;
	
	public Member getMember(Member member) {
		Member resultMember = memberMapper.selectMember(member);
		
		return resultMember;
	}
}
