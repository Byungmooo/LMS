package com.gd.LMS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.mapper.MemberMapper;
import com.gd.LMS.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class MemberService {
	@Autowired MemberMapper memberMapper;
	
	public Member getMember(Member member) {
		Member resultMember = memberMapper.selectMember(member);
		
		log.debug(TeamColor.LCH + resultMember +TeamColor.RESET);
		
		return resultMember;
	}
}
