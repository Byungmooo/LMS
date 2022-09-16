package com.gd.LMS.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.service.LoginService;
import com.gd.LMS.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	@Autowired LoginService loginService;
	

	
	// 로그인
	@GetMapping("/login")
	public String login(HttpSession session) {
		// 기존에 로그인되어 있는 상태(session값이 null이 아니면)에서 로그인 폼으로 들어왔을 경우, 인덱스 페이지로 이동
		if (session.getAttribute("session") != null) {
			return "redirect:/index";
		} else { // 로그인이 되어있지 않았을 경우
			return "login";
		}
	}
	
	//login Action
	@PostMapping("/login")
	public String login(Model model, HttpSession session, Member member) {
		
		// 파라미터 디버깅
		log.debug(TeamColor.KBW + member + "<-- member" );
		
		//입력한 ID와 PW로 서비스 호출
		Member resultMember = loginService.getLogin(member);
		
		//디버깅
		log.debug(TeamColor.KBW + resultMember + " db 정보유무확인(id,pw X)");
		
		// id pw가 user정보에 없다면(로그인실패)시 실패메세지 알림
		if(resultMember == null) {
			model.addAttribute("errMsg","ID와 PW를 확인해주세요!");
			return "login";
		}
		
		// user 정보가 일치하고 계정 활성화(Y)인 계정에 세션부여
		session.setAttribute("memberId", resultMember.getMemberId());
		session.setAttribute("memberType", resultMember.getMemberType());

		return "index";	
	}
}
