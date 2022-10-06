package com.gd.LMS.assignment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.LMS.assignment.service.AssignmentService;
import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.Assignment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AssignmentController {
	@Autowired AssignmentService assignmentService;

	// 과제 리스트 조회

	@GetMapping({"/student/assignmentList", "/professor/assignmentList"})
	public String assignmentList(PagingVo pagingVo, Model model, Map<String, Object> map,
			@RequestParam(value = "openedLecNo") int openedLecNo,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) {

		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "전체리스트 컨트롤러 진입=============");

		// 파라미터 세팅 (전체 게시글 개수 계산)
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("openedLecNo", openedLecNo);
		int totalCount = assignmentService.getAssignmentCount(map);
		log.debug(TeamColor.BJH + " keyword, searchType, openedLecNo > " + totalCount);		
		
		
		// 이전 페이지 시작 글 번호와 현재 변경되는 페이지의 시작 글번호에 대한 일치 시키는거 많은 변경이 필요하므로 그냥 1로 처리함
		pagingVo = new PagingVo(currentPage, totalCount, rowPerPage, keyword, searchType);
		if (pagingVo.getBeginRow() >= totalCount) {
			pagingVo = new PagingVo(1, totalCount, rowPerPage, keyword, searchType);
		}
		log.debug(TeamColor.BJH + "PagingVo > " + pagingVo);
		
		// 페이지네이션위한 파라미터 추가 세팅
		map.put("beginRow", pagingVo.getBeginRow());
		map.put("rowPerPage", pagingVo.getRowPerPage());
		log.debug(TeamColor.BJH + "beginRow, rowPerPage > " + map);
		
		
		// 서비스 불러오기
		List<Map<String, Object>> list = assignmentService.getAssignmentList(map);
		log.debug(TeamColor.BJH + list + "<--assignmentList");

		

		model.addAttribute("paging", pagingVo);
		model.addAttribute("list", list);
		
		return "assignment/assignmentList";
	}
	
	//과제 상세보기
	@GetMapping({"/professor/assignmentOne", "/student/assignmentOne"})
	public String assignmentOne(Model model, HttpSession session,
		@RequestParam(value = "assignmentNo") int assignmentNo) {
		
		
		Map<String, Object> assignmentOne = assignmentService.getAssignmentOne(assignmentNo);
		model.addAttribute("map", assignmentOne);
		session.setAttribute("assignmentNo", assignmentNo);
		return "assignment/assignmentOne";
	}
	
	
	
	// 과제 출제 폼
	@GetMapping("/professor/addAssignment")
	public String addAssignment() {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "과제 출제(교수) 컨트롤러(GetMappting) 실행=========");

		return "assignment/addAssignment";
	}

	// 과제 출제 액션
	@PostMapping("/professor/addAssignment")
	public String addAssignment(Assignment assignment, RedirectAttributes redirectAttributes) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "과제 출제(교수) 컨트롤러(PostMappting) 실행=========");

		int result = assignmentService.addAssignment(assignment);
		log.debug(TeamColor.BJH + assignment + "<--assignment");
		
		if (result == 0) {
			log.debug(TeamColor.BJH + "fail > 과제 출제 실패");
			return "redirect:/professor/addAssignment";
		}
		
		redirectAttributes.addAttribute("openedLecNo", result);
		return "redirect:/professor/assignmentList?openedLecNo=" +assignment.getOpenedLecNo();
	}

	
	// 출제한 과제 수정하는 메소드
	@GetMapping("/professor/modifyAssignment")
	public String modifyAssignment(Model model,
			@RequestParam(value="assignmentNo") int assignmentNo) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "과제 수정 컨트롤러(getMapping) 실행=========");
		
		
		Map<String,Object> assignmentOne = assignmentService.getAssignmentOne(assignmentNo);
		// 디버깅
		log.debug(TeamColor.BJH + assignmentOne + "<-- assignmentOne");
		
		// 상세보기 내용 담아서 보내기
		model.addAttribute("map", assignmentOne);

		return "assignment/modifyAssignment";
	}

	// 출제한 과제 수정 액션
	@PostMapping("/professor/modifyAssignment")
	public String modifyAssignment(Assignment assignment,RedirectAttributes redirectAttributes) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "과제출제 수정(PostMapping) 컨트롤러 실행=========");
		
		int count = assignmentService.modifyAssignment(assignment);
		redirectAttributes.addAttribute("assignmentNo", assignment.getAssignmentNo());
		if (count >= 1) {
			log.debug(TeamColor.BJH + "과제 수정 성공");
			return "redirect:/professor/assignmentOne";
		}
		
		return "redirect:/professor/modifyAssignment";
	}

	// 과제 삭제
	@GetMapping("/professor/removeAssignment")
	public String removeAssignment(Model model, HttpSession session
						, RedirectAttributes redirectAttributes,
						@RequestParam("openedLecNo") int openedLecNo) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "과제 출제(교수) 삭제 컨트롤러 실행============");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + openedLecNo + "<-- openedLecNo");

		// 과제 삭제 service call
		int result = assignmentService.removeAssignment(openedLecNo);
		// 파라미터
		log.debug(TeamColor.BJH + result + "<-- result");

		redirectAttributes.addAttribute("openedLecNo", session.getAttribute("openedLecNo"));
		
		return "redirect:/professor/assignmentList";
	}
	
	

	// 제출한 과제 점수 수정 Form
	@GetMapping("/professor/modifyAssignmentRegScore")
	public String modifyAssignmentRegScore(Model model, Map<String,Object> map,
			@RequestParam("assignmentNo") int assignmentNo) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "modifyassignmentRegScore 과제수정 Get Controller");
		// 파라미터 디버깅
	
		List<Map<String,Object>> score = assignmentService.modifyAssignmentRegScore(map);
		// 디버깅
		log.debug(TeamColor.BJH + score + "<-- 수정할 내용 담아서 넘기기");

		// 모델단에 reportSubmitOne을 addAttribute해서 폼으로 전달
		model.addAttribute("score", score);

		return "redirect:/professor/modifyAssignmentRegScore";
	} 
	// 제출한 과제 점수 수정 Action
	@PostMapping("/professor/modifyassignmentRegScore")
	public String modifyassignmentRegScore() {
		return null;

	}
	

}
