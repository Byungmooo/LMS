package com.gd.LMS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.mapper.LoginMapper;
import com.gd.LMS.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class LoginService {
	@Autowired LoginMapper loginMapper;
	
	public Member getLogin(Member member) {
		Member result = loginMapper.selectLogin(member);
		
		log.debug(TeamColor.KBW + result + "<-- getLogin" );
		
		return result;
	}


	
	
	
}
