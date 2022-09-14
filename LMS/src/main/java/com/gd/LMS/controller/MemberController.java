package com.gd.LMS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.LMS.service.MemberService;
import com.gd.LMS.vo.Member;

@Controller
public class MemberController {
	@Autowired MemberService memberService;
	
	@GetMapping("memberLogin")
	public String memberLogin() {
		return "index";
	}
	
	@PostMapping("memberLogin")
	public String memberLogin(Member member, Model model) {
		
		Member resultMember = memberService.getMember(member);
		
		model.addAttribute("member", resultMember);
		
		return "redirect:/result";
	}
}
