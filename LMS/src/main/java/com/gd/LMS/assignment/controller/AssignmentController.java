package com.gd.LMS.assignment.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.assignment.service.AssignmentService;
import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.service.MemberService;
import com.gd.LMS.vo.Assignment;
import com.gd.LMS.vo.OpenedLecture;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AssignmentController {
	@Autowired
	AssignmentService assignmentService;
	@Autowired
	MemberService memberService;

	// 과제 리스트 조회

	@GetMapping({"/student/assignmentList", "/professor/assignmentList"})
	public String assignmentList(Model model, HttpSession session) {
		int openedLecNo = 41;

		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "assignmentList Controller");

		// 서비스 불러오기
		List<Assignment> assignmentList = assignmentService.getAssignmentList(openedLecNo);
		log.debug(TeamColor.BJH + assignmentList + "<--assignmentList");

		// 뷰에서 끄내쓸 리스트 보내기
		model.addAttribute("assignmentList", assignmentList);

		if (assignmentList != null) {
			// 성공
			log.debug(TeamColor.BJH + " 과제 리스트 조회 성공");
			// 이동
			return "assignment/assignmentList";
		} else {
			// 실패
			log.debug(TeamColor.BJH + " 과제 리스트 조회실패");
			// index로 리다이렉트
			return "redirect:/assignment/openedLecList";
		}
	}
	
	/**************
		student / professor 붙이기
		학생 교수 공통 : {"/student/assignmentList", "/professor/assignmentList"}
		교수만 : "/professor/assignmentList"
		리다이렉트로 리스트 보낼 때 : 둘 중 한개만 : "/professor/assignmentList"
	
	**************/
	
	// 과제 출제하는 메소드
	@GetMapping("/professor/addAssignment")
	public String addAssignment(Model model, HttpSession session) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "addAssignment Controller 실행");

		int openedLecNo = 41;

		// 세션 받아오기
		String memberId = (String) session.getAttribute("memberId");
		model.addAttribute("openedLecNo", openedLecNo);
		// 로그인한 강사의 멤버아이디
		log.debug(TeamColor.BJH + memberId + "<-- memberId");
		log.debug(TeamColor.BJH + openedLecNo + "<-- openedLecNo");

		return "redirect:/assignment/addAssignment";
	}

	// 과제 출제하는 메소드
	// 리턴값 : openedAssignmentList.jsp로 이동
	@PostMapping("/professor/addAssignment")
	public String addAssignment(Assignment assignment) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "addAssignment Controller");

		// 수정필요
		int openedLecNo = 41;
		assignment.setOpenedLecNo(openedLecNo);

		// 과제 내는 서비스
		int row = assignmentService.addAssignment(assignment);

		if (row != 0) {
			// 성공
			log.debug(TeamColor.BJH + " 과제 내기 성공");
		} else {
			// 실패
			log.debug(TeamColor.BJH + " 과제 내기 실패");
		}
		// assgnmentList로 리다이렉트
		return "redirect:/assignment/assignmentList";
	}

	// 출제한 과제 수정하는 메소드
	@GetMapping("/professor/modifyAssignment")
	public String modifyAssignment(Model model, @RequestParam("assignmentNo") int assignmentNo) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "modifyAssignment Controller");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + assignmentNo + "<-- reportNo");

		Assignment assignmentOne = assignmentService.getAssignmentOne(assignmentNo);
		// 디버깅
		log.debug(TeamColor.BJH + assignmentOne + "<-- assignmentOne");

		// 상세보기 내용 담아서 보내기
		model.addAttribute("assignment", assignmentOne);

		return "redirect:/assignment/modifyAssignment";
	}

	// 출제한 과제 수정하는 메소드
	@PostMapping("/professor/modifyAssignment")
	public String modifyAssignment(@RequestParam("assignmentNo") int assignmentNo,
			@RequestParam("openedLecNo") int openedLecNo, @RequestParam("assignmentTitle") String assignmentTitle,
			@RequestParam("assignmentContent") String assignmentContent, @RequestParam("endDate") String endDate) {

		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "modifyAssignment Controller");

		// 받아온 값 param에 셋팅
		Assignment param = new Assignment();
		param.setOpenedLecNo(openedLecNo);
		param.setAssignmentNo(assignmentNo);
		param.setAssignmentTitle(assignmentTitle);
		param.setAssignmentContent(assignmentContent);
		param.setEndDate(endDate);
		// 셋팅값 디버깅
		log.debug(TeamColor.BJH + param + "<-- param");

		int modifyAssignment = assignmentService.modifyAssignment(param);
		// 디버깅
		System.out.println("modifyAssignment");
		if (modifyAssignment != 0) {
			// 성공
			log.debug(TeamColor.BJH + " 제출한 과제 수정 성공");
		} else {
			// 실패
			log.debug(TeamColor.BJH + " 제출한 과제 수정 실패");
		}
		// 수정에 성공했으면 낸 과제 리스트로 보내기
		return "redirect:/assignment/assignmentList";
	}

	// 과제 삭제
	@GetMapping("/professor/removeAssignment")
	public String removeAssignment(@RequestParam("assignmentNo") int assignmentNo) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "removeAssignment Controller");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + assignmentNo + "<-- assignmentNo");

		// 과제 삭제 service call
		int removeAssignment = assignmentService.removeAssignment(assignmentNo);
		// 파라미터
		log.debug(TeamColor.BJH + removeAssignment + "<-- removeAssignment");

		if (removeAssignment != 0) {
			// 성공
			log.debug(TeamColor.BJH + " 과제 삭제 성공");
		} else {
			// 실패
			log.debug(TeamColor.BJH + " 과제 삭제 실패");
			// reportList로 리다이렉트
			return "redirect:/assignment/assignmentList";

		}
		return "redirect:/assignment/assignmentList";
	}

}
