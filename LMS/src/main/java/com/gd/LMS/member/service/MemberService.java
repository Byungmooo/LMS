package com.gd.LMS.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.mapper.MemberMapper;
import com.gd.LMS.member.service.MemberService;
import com.gd.LMS.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class MemberService {
	@Autowired MemberMapper memberMapper;
	
	public Member getMember(Member member) {
		Member resultMember = memberMapper.selectMember(member);
		
		log.debug(TeamColor.LCH + resultMember);
		
		return resultMember;
	}
	
	
	public String getMemberIdCheck(String checkId) {
		log.debug(TeamColor.LCH + checkId + " <-- check 할 ID");
		
		String result = null;		
		result = memberMapper.selectMemberIdCheck(checkId);
		
		log.debug(result + " <-- checkId 결과 null일 경우 사용");
		
		return result;
	};
	
	public int addMember(Member paramMember) {
		log.debug(TeamColor.LCH + paramMember.toString() + " <-- 추가할 paramMember정보 (Service)");
		
		int result = memberMapper.insertMember(paramMember);
		
		return result;
	}
	
	public Member getLogin(Member member) {
		Member resultMember = memberMapper.selectLogin(member);
		
		log.debug(TeamColor.KBW + resultMember + "<-- getLogin" );
		
		// 현재 사용가능한 사용자이면 
		if(resultMember.getActive().equals("Y")) {
			memberMapper.updateMemberLastLogin(resultMember.getMemberId());
		}
		
		return resultMember;
	}
	
	public int modifyMemberActiveN() {
		
		return memberMapper.updateMemberActiveN();
	}
}
