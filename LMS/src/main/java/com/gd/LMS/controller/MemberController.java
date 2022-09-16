package com.gd.LMS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.service.MemberService;
import com.gd.LMS.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	@Autowired MemberService memberService;
	
	// db 연동확인
	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	// db 연동확인
	@PostMapping("/index")
	public String index(Member member, Model model) {
		
		Member resultMember = memberService.getMember(member);
		
		model.addAttribute("member", resultMember);
		
		return "index";
	}
	
	
	// 회원가입
	@GetMapping("/memberRegister")
	public String memberRegister() {
		
		return "memberRegister";
	}
	
	// 회원가입
	@PostMapping("/memberRegister")
	public String memberRegister(Member paramMember, @RequestParam (value = "birthYear") String birthYear, 
			@RequestParam (value = "birthMonth") String birthMonth, @RequestParam (value = "birthDay") String birthDay, 
			@RequestParam (value = "memberAddr") String memberAddr, @RequestParam (value = "memberAddrDetail") String memberAddrDetail) {
		// 파라미터 추가 세팅
		String birth = birthYear + birthMonth + birthDay;
		String memberAddress = memberAddr + "/" + memberAddrDetail;
		
		paramMember.setMemberBirth(birth);
		paramMember.setMemberAddress(memberAddress);
		
		log.debug(TeamColor.LCH + paramMember.toString() + " <-- 추가할 paramMember정보 (Controller)");
		
		int result = memberService.addMember(paramMember);
		
		if(result != 0) {
			log.debug(TeamColor.LCH + " <-- addMember fail (Controller)");
		} else {
			log.debug(TeamColor.LCH + " <-- addMember success (Controller)");
		}
		
		return "redirect:/index";
	}
	
	// id 중복체크
	// @RequestMapping(value = "/memberIdCheck", method = RequestMethod.POST)
	// @ResponseBody
	@PostMapping("/memberIdCheck")
	public @ResponseBody String memberIdCheck(@RequestParam (value = "checkId") String checkId) {
		log.debug(TeamColor.LCH + checkId + " <-- check 할 ID");
		
		String result = memberService.getMemberIdCheck(checkId);
		
		// 결과
		String returnParam;
		if(result == null) {
			returnParam = "y";
		} else {
			returnParam = "n";
		}
		
		return returnParam;
	}
	
}
