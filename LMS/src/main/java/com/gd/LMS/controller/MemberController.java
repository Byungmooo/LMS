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
	
	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	@PostMapping("/index")
	public String index(Member member, Model model) {
		
		Member resultMember = memberService.getMember(member);
		
		model.addAttribute("member", resultMember);
		
		return "result";
	}
	
	@GetMapping("/memberRegister")
	public String memberRegister() {
		
		return "memberRegister";
	}
	
	@PostMapping("/memberRegister")
	public String memberRegister(Member member) {
		
		
		
		return "redirect:/index";
	}
}
