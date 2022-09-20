package com.gd.LMS.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.service.MemberService;
import com.gd.LMS.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	@Autowired MemberService memberService;
	
	// 회원 로그아웃
	@GetMapping("/member/memberLogout")
	public String memberLogout(HttpSession session) {
		log.debug(TeamColor.KBW + "--- logout Controller GetMapping ---");
		
		// 멤버 세션 초기화
		session.invalidate();
		
		return "redirect:/login";
	}

	
	// 회원 로그인 폼
	@GetMapping("/memberLogin")
	public String memberLogin(HttpSession session) {
		log.debug(TeamColor.LCH  + "--- login Controller GetMapping ---");
		
		// 기존에 로그인되어 있는 상태(session값이 null이 아니면)에서 로그인 폼으로 들어왔을 경우, 인덱스 페이지로 이동
		if (session.getAttribute("session") != null) {
			return "index";
		} else { // 로그인이 되어있지 않았을 경우
			return "member/memberLogin";
		}
	}
	
	// 회원 로그인 액션
	@PostMapping("/memberLogin")
	public String login(RedirectAttributes rtts, HttpSession session, Member paramMember) {
		log.debug(TeamColor.LCH  + "--- login Controller PostMapping ---");
		
		// 파라미터 디버깅
		log.debug(TeamColor.KBW + "paramMember (controller) > " + paramMember);
		
		// 입력한 파라미터(ID, PW)로 멤버확인
		Member resultMember = memberService.getMemberLogin(paramMember);
		
		// 리턴값 디버깅
		log.debug(TeamColor.KBW + "resultMember (controller) > " + resultMember);
		
		// 리턴값이 null일 경우 로그인 실패
		if(resultMember == null) {
			// login창에서 실패알림을 띄우기 위해 redirect에 값을 저장 후 스크립트로 전송
			rtts.addFlashAttribute("result", "fail");
			
			return "redirect:/memberLogin";
		} else {
			if(resultMember.getActive().equals("W")) {
				// 로그인에 성공했지만 활성화 상태가 W인 경우 승인대기 메시지
				rtts.addFlashAttribute("result", "activeW");
				return "redirect:/memberLogin";
			} else if (resultMember.getActive().equals("N")) {
				// 로그인에 성공했지만 활성화 상태가 N인 경우 휴먼계정관리 페이지로 이동
				// rtts.addFlashAttribute("result", "activeN");
				return "redirect:/memberActive";
			}
		}
		
		// 로그인에 성공하고 활성화 여부가 'Y'인 계정정보 세션에 저장
		session.setAttribute("memberId", resultMember.getMemberId());
		session.setAttribute("memberType", resultMember.getMemberType());

		return "redirect:/member/index";	
	}
	
	// 회원 index화면
	@GetMapping("/member/index")
	public String index() {
		log.debug(TeamColor.LCH  + "--- index Controller GetMapping ---");
		
		return "index";
	}
	
	// 회원가입 폼
	@GetMapping("/memberRegister")
	public String memberRegister() {
		log.debug(TeamColor.LCH + "--- memberRegister Controller GetMapping ---");
		
		return "memberRegister";
	}
	
	// 회원가입 액션
	@PostMapping("/memberRegister")
	public String memberRegister(RedirectAttributes rtts, Member paramMember, @RequestParam (value = "birthYear") String birthYear, 
			@RequestParam (value = "birthMonth") String birthMonth, @RequestParam (value = "birthDay") String birthDay, 
			@RequestParam (value = "memberAddr") String memberAddr, @RequestParam (value = "memberAddrDetail") String memberAddrDetail) {
		log.debug(TeamColor.LCH + "--- memberRegister Controller PostMapping ---");
		
		// parameter를 memberVo에 맞는 형태로 합쳐 vo에 세팅
		String birth = birthYear + birthMonth + birthDay;
		String memberAddress = memberAddr + "/" + memberAddrDetail;		
		paramMember.setMemberBirth(birth);
		paramMember.setMemberAddress(memberAddress);
		
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "paramMember (controller) > " + paramMember);
		
		// request된 파라미터로 회원가입 메서드 진행
		int result = memberService.addMemberRegister(paramMember);
		
		// 리턴값 디버깅 실패 시 에러메세지 
		if(result != 0) {
			log.debug(TeamColor.LCH + "result (controller) > " + paramMember);
			// rtts.addFlashAttribute("result", "fail");
			
			return "redirect:/memberRegister";
		}
		log.debug(TeamColor.LCH + "result (controller) > " + paramMember);
		
		return "redirect:/login";
	}
	
	// 회원가입 Id 중복체크
	// @RequestMapping(value = "/memberIdCheck", method = RequestMethod.POST)
	// @ResponseBody
	@PostMapping("/memberIdCheck")
	public @ResponseBody String memberIdCheck(@RequestParam (value = "checkId") String checkId) {
		log.debug(TeamColor.LCH + "--- memberIdCheck Controller PostMapping ---");
		
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "checkId (controller) > " + checkId);
		
		// 중복확인 후 리턴값 디버깅
		String result = memberService.getMemberIdCheck(checkId);
		log.debug(TeamColor.LCH + "result (controller) > " + result);
		
		// ajax Json에 보낼 메시지
		String returnJson;
		
		// 리턴값이 null일 경우 사용가능한 아이디
		if(result == null) {
			returnJson = "y";
		} else {
			returnJson = "n";
		}
		
		return returnJson;
	}
	
	// 휴면계정처리 폼
	@GetMapping("/memberActive")
	public String memberActice() {
		log.debug(TeamColor.LCH + "--- memberActive Controller GetMapping ---");
		
		return "memberActive";
	}
}
