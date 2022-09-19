package com.gd.LMS.commons;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gd.LMS.member.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class MemberScheduler {
	@Autowired MemberService memberService;
	
	// 내장 객체가 저장된 cron에 매일 자정 00:00:00에 매일(*) 실행
	@Scheduled(cron = "0 0 0 * * *", zone="Asia/Seoul")
	public void modifyEmployeeActiveN() {
		log.debug(TeamColor.LCH + this.getClass() + "scheduler");
		//int row = memberService.modifyEmployeeActiveN();
		//log.debug(row+"개의 계정이 휴면처리되었습니다");
	}
}
