package com.gd.LMS.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.service.MemberService;
import com.gd.LMS.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	@Autowired MemberService memberService;
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		//디버깅
		log.debug(TeamColor.KBW+"로그아웃");
		
		//세션무효화
		session.invalidate();
		
		return "redirect:/login";
	}

	
	// 로그인
	@GetMapping("/member/login")
	public String login(HttpSession session) {
		// 기존에 로그인되어 있는 상태(session값이 null이 아니면)에서 로그인 폼으로 들어왔을 경우, 인덱스 페이지로 이동
		if (session.getAttribute("session") != null) {
			return "index";
		} else { // 로그인이 되어있지 않았을 경우
			return "member/login";
		}
	}
	
	//login Action
	@PostMapping("/member/login")
	public String login(Model model, HttpSession session, Member member) {
		
		// 파라미터 디버깅
		log.debug(TeamColor.KBW + member + "<-- member" );
		
		//입력한 ID와 PW로 서비스 호출
		Member resultMember = memberService.getLogin(member);
		
		//디버깅
		log.debug(TeamColor.KBW + resultMember + " db 정보유무확인(id,pw X)");
		
		// id pw가 user정보에 없다면(로그인실패)시 실패메세지 알림
		if(resultMember == null) {
			model.addAttribute("errMsg","ID와 PW를 확인해주세요!");
			return "member/login";
		} else {
			if(resultMember.getActive().equals("N")) { // 휴먼계정관리 페이지로 이동
				// activeYPage.jsp 아이디와 비밀번호를 입력하면 계정활성화 
				// -> mapper.updateEmployeeActiveY()
				return "member/activeYPage"; 
			}
		}
		
		// user 정보가 일치하고 계정 활성화(Y)인 계정에 세션부여
		session.setAttribute("memberId", resultMember.getMemberId());
		session.setAttribute("memberType", resultMember.getMemberType());

		return "index";	
	}
	
	// db 연동확인
	@GetMapping("/member/index")
	public String index() {
		return "member/index";
	}
	
	// db 연동확인
	@PostMapping("/index")
	public String index(Member member, Model model) {
		
		Member resultMember = memberService.getMember(member);
		
		model.addAttribute("member", resultMember);
		
		return "member/index";
	}
	
	
	// 회원가입
	@GetMapping("/member/memberRegister")
	public String memberRegister() {
		
		return "member/memberRegister";
	}
	
	// 회원가입
	@PostMapping("/member/memberRegister")
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
		
		return "redirect:/member/login";
	}
	
	// id 중복체크
	// @RequestMapping(value = "/memberIdCheck", method = RequestMethod.POST)
	// @ResponseBody
	@PostMapping("/member/memberIdCheck")
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
